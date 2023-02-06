part of 'task_bloc.dart';

class TaskState extends Equatable {
  final Widget? currentScreen;
  final int navigatorValue;

  const TaskState({
    this.currentScreen = const HomeScreen(),
    this.navigatorValue = 0,
  });
  @override
  List<Object?> get props => [currentScreen, navigatorValue];
}

class TaskErrorState extends TaskState {
  @override
  List<Object?> get props => [];
}
