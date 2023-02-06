part of 'task_bloc.dart';

class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeTaskEvent extends TaskEvent {
  final Widget currentScreen;

  ChangeTaskEvent(
    this.currentScreen,
  );

  @override
  List<Object?> get props => [
        currentScreen,
      ];
}
