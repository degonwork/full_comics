import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/root_app/bottombar_bloc/bottombar_bloc.dart';
import 'package:full_comics/root_app/bottombar_bloc/bottombar_event.dart';
import 'package:full_comics/root_app/bottombar_bloc/bottombar_state.dart';
import 'package:full_comics/root_app/widget/bottombar.dart';
import '../ui/case/case_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/library/library_screen.dart';
import '../ui/profile/profile_screen.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listScreen = const [
      HomeScreen(),
      LibraryScreen(),
      CaseScreen(),
      ProfileScreen(),
    ];
    return BlocBuilder<BottombarBloc, BottombarState>(
        builder: (context, state) {
      return Scaffold(
        body: state.currentScreen,
        bottomNavigationBar: Bottombar(
          currentIndex: state.navigatorValue,
          onTap: (int value) {
            context
                .read<BottombarBloc>()
                .add(ChangeBottombarEvent(listScreen[value], value));
          },
        ),
      );
    });
  }
}
