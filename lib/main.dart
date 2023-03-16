import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_bloc.dart';
import 'package:full_comics/data/authentication_repository/authentication_repository.dart';
// import 'package:full_comics/data/authentication_repository/authentication_repository.dart';
import 'package:full_comics/data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';
import 'package:full_comics/firebase_options.dart';
import 'package:full_comics/root_app/bottombar_bloc/bottombar_bloc.dart';
import 'package:full_comics/root_app/root_app.dart';
import 'package:full_comics/ui/case/case_screen.dart';
import 'package:full_comics/ui/home/home_screen.dart';
// import 'package:full_comics/ui/home/home_screen.dart';
import 'package:full_comics/ui/library/library_screen.dart';
import 'package:full_comics/ui/login/bloc/auth_bloc.dart';
// import 'package:full_comics/ui/home/home_screen.dart';
// import 'package:full_comics/ui/login/bloc/auth_bloc.dart';
// import 'package:full_comics/ui/login/bloc/auth_state.dart';
import 'package:full_comics/ui/login/cubit/login_cubit.dart';
import 'package:full_comics/ui/login/login_screen.dart';
import 'package:full_comics/ui/profile/profile_screen.dart';
import 'package:full_comics/ui/sign_up_screen/cubit/sign_up_cubit.dart';
// import 'package:full_comics/ui/sign_up_screen/cubit/sign_up_cubit.dart';
import 'package:full_comics/ui/sign_up_screen/sign_up_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authencationService = AuthenticationSerivce();
  await authencationService.user.first;
  runApp(MyApp(authenticationSerivce: authencationService));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.authenticationSerivce});
  final AuthenticationSerivce authenticationSerivce;

  @override
  State<MyApp> createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: AuthenticationSerivce(),
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<AppBloc>(
          //   create: (context) =>
          //       AppBloc(authenticationSerivce: AuthenticationSerivce()),
          // ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(AuthRepo()),
          ),
          BlocProvider(
            create: (context) => BottombarBloc(),
          ),
          BlocProvider(
              create: (context) => LoginCubit(AuthenticationSerivce())),
          BlocProvider(
              create: (context) => SignUpCubit(AuthenticationSerivce())),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          // initialRoute: '$RootApp',
          routes: {
            '$RootApp': (_) => const RootApp(),
            '$HomeScreen': (_) => const HomeScreen(),
            '$CaseScreen': (_) => const CaseScreen(),
            '$LibraryScreen': (_) => const LibraryScreen(),
            '$ProfileScreen': (_) => const ProfileScreen(),
            '$LoginScreen': (_) => const LoginScreen(),
            '$SignUpScreen': (_) => const SignUpScreen(),
          },
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
