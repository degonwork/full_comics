import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/screens/home_screen.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<ChangeTaskEvent>(_onChangeTaskState);
  }

  void _onChangeTaskState(
    ChangeTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    try {
      emit(
        TaskState(
          currentScreen: event.currentScreen,
        ),
      );
    } catch (e) {
      emit(TaskErrorState());
    }
  }
}
