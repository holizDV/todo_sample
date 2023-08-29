import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/todos.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  late Box<Todos> todos;

  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  Future<void> onInit() async {
    emit(const HomeState.loading());

    await Future.delayed(const Duration(milliseconds: 500));
    todos = Hive.box<Todos>("todos_box");
    if (todos.isEmpty) {
      emit(const HomeState.emptyData());
    } else {
      emit(const HomeState.loaded());
    }
  }

  Future<void> onDeleteTodo(int index) async {
    todos.deleteAt(index);
    onInit();
  }

  Future<void> onAddTodo(int index, Box<Todos> todo) async {
    if (titleCtrl.text.isEmpty || descriptionCtrl.text.isEmpty) {
      return;
    }
    emit(const HomeState.addLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    final newTodo = Todos(titleCtrl.text.trim(), descriptionCtrl.text.trim());
    await todo.add(newTodo);
    emit(const HomeState.addLoaded());
    emit(const HomeState.backRefresh(true));
  }

  Future<void> onUpdateTodo({
    required int index,
    required Box<Todos> todo,
  }) async {
    if (titleCtrl.text.isEmpty || descriptionCtrl.text.isEmpty) {
      return;
    }
    emit(const HomeState.addLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    final updateTodo =
        Todos(titleCtrl.text.trim(), descriptionCtrl.text.trim());
    await todo.putAt(index, updateTodo);
    emit(const HomeState.addLoaded());
    emit(const HomeState.backRefresh(true));
  }

  void setValueTodo(Todos todo) {
    titleCtrl.text = todo.title;
    descriptionCtrl.text = todo.description;
  }
}
