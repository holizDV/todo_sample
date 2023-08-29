import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/common/delete_dialog.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../config/theme/theme.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/injection/injection.dart';
import '../logic/home_cubit.dart';
import '../widget/note_card.dart';
import 'detail_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeCubit = getIt<HomeCubit>();

  @override
  void initState() {
    homeCubit.onInit();
    super.initState();
  }

  @override
  void dispose() {
    homeCubit.titleCtrl.dispose();
    homeCubit.descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TODO List")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: () async {
          final isRefresh = await context.router.push(DetailRoute(
              detailType: DetailType.create, todos: homeCubit.todos));
          if (isRefresh == const HomeState.backRefresh(true)) {
            homeCubit.onInit();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          if (state == const HomeState.loading()) {
            return const Center(
                child: CircularProgressIndicator(color: AppColor.primary));
          }
          if (state == const HomeState.emptyData()) {
            return Center(
              child: Assets.images.emptyData.image(width: 180),
            );
          }
          if (state == const HomeState.loaded()) {
            return RefreshIndicator(
              color: AppColor.primary,
              onRefresh: homeCubit.onInit,
              child: ListView.separated(
                itemCount: homeCubit.todos.length,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppSize.s16),
                padding: const EdgeInsets.fromLTRB(
                  AppPadding.p24,
                  AppPadding.p16,
                  AppPadding.p24,
                  AppPadding.zero,
                ),
                itemBuilder: (context, index) {
                  final todo = homeCubit.todos.getAt(index);

                  return NoteCard(
                    title: todo?.title ?? "-",
                    description: todo?.description ?? "-",
                    onDetail: () async {
                      final isRefresh = await context.router.push(
                        DetailRoute(
                          detailType: DetailType.update,
                          indexTodo: index,
                          todo: todo,
                          todos: homeCubit.todos,
                        ),
                      );

                      if (isRefresh == const HomeState.backRefresh(true)) {
                        homeCubit.onInit();
                      }
                    },
                    onDelete: () {
                      DeleteDialog().show(
                        context: context,
                        onTapConfirm: () {
                          homeCubit.onDeleteTodo(index);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
