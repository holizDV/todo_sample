import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../config/theme/theme.dart';
import '../../../../utils/injection/injection.dart';
import '../../data/model/todos.dart';
import '../logic/home_cubit.dart';

enum DetailType { create, update }

@RoutePage()
class DetailPage extends StatefulWidget {
  const DetailPage({
    required this.detailType,
    required this.todos,
    this.indexTodo,
    this.todo,
    super.key,
  });

  final DetailType detailType;
  final int? indexTodo;
  final Todos? todo;
  final Box<Todos> todos;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final homeCubit = getIt<HomeCubit>();

  String get title {
    if (widget.detailType == DetailType.create) {
      return "TODO New";
    }
    return "TODO";
  }

  String get textButton {
    if (widget.detailType == DetailType.create) {
      return "Add";
    }
    return "Update";
  }

  void _onTap(BuildContext context) {
    if (widget.detailType == DetailType.create) {
      homeCubit.onAddTodo(widget.indexTodo ?? 0, widget.todos);
      return;
    }
    homeCubit.onUpdateTodo(index: widget.indexTodo!, todo: widget.todos);
  }

  @override
  void initState() {
    if (widget.detailType == DetailType.update) {
      homeCubit.setValueTodo(widget.todo!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(homeCubit.state);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p24, vertical: AppMargin.m28),
          child: Column(
            children: [
              TextFormField(
                controller: homeCubit.titleCtrl,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: AppColor.grey),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: AppSize.s16),
              TextFormField(
                controller: homeCubit.descriptionCtrl,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: const InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: AppColor.grey),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              BlocBuilder<HomeCubit, HomeState>(
                bloc: homeCubit,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (state == const HomeState.addLoading()) {
                        return;
                      }
                      _onTap(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.blue,
                    ),
                    child: (state == const HomeState.addLoading())
                        ? const CircularProgressIndicator(color: Colors.white)
                        : (state == const HomeState.addLoaded())
                            ? Text(textButton)
                            : Text(textButton),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
