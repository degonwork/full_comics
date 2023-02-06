import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/blocs/task/task_bloc.dart';
import 'package:full_comics/config/app_constants.dart';
import 'package:full_comics/widgets/bottom_navbar.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return Scaffold(
          body: state.currentScreen!,
          bottomNavigationBar: BottomNavBar(
              initialIndex: state.navigatorValue,
              onTap: (value) {
                context
                    .read<TaskBloc>()
                    .add(ChangeTaskEvent(AppConstants.screens[value]));
              }));
    });
  }
}
