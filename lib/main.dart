import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/data/di/api_client.dart';
import 'package:full_comics/data/repo/authentication_repository/authentication_repository.dart';
import 'package:full_comics/data/repo/manga_repo/all_new_manga_repo.dart';
import 'package:full_comics/data/repo/manga_repo/hot_commic_repo.dart';
import 'package:full_comics/data/repo/manga_repo/new_commic_repo.dart';
import 'package:full_comics/root_app/bottombar_bloc/bottombar_bloc.dart';
import 'package:full_comics/root_app/root_app.dart';
import 'package:full_comics/ui/case/case_screen.dart';
import 'package:full_comics/ui/home/child_screen/all_new_manga/cubit/fetch_all_new_manga_cubit.dart';
import 'package:full_comics/ui/home/child_screen/hot_manga/cubit/fetch_hot_manga_cubit.dart';
import 'package:full_comics/ui/home/child_screen/new_manga/cubit/fetch_new_manga_cubit.dart';
import 'package:full_comics/ui/home/home_screen.dart';
import 'package:full_comics/ui/home/child_screen/notifi_screen/notifi_screen.dart';
import 'package:full_comics/ui/library/library_screen.dart';
import 'package:full_comics/ui/login/bloc/auth_bloc.dart';
import 'package:full_comics/ui/login/cubit/login_cubit.dart';
import 'package:full_comics/ui/login/login_screen.dart';
import 'package:full_comics/ui/profile/profile_screen.dart';
import 'package:full_comics/ui/sign_up_screen/cubit/sign_up_cubit.dart';
import 'package:full_comics/ui/sign_up_screen/sign_up_screen.dart';
import 'package:full_comics/ui/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => NewCommicRepo(apiClient: ApiClient())),
        RepositoryProvider(create: (context) => HotCommicRepo(apiClient: ApiClient())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FetchAllNewMangaCubit>(
              create: (context) =>
                  FetchAllNewMangaCubit(allNewMangaRepo: AllNewMangaRepo())
                    ..fetchAllNewManga()),
          BlocProvider<FetchNewMangaCubit>(
              create: (context) =>
                  FetchNewMangaCubit(newCommicRepo: context.read<NewCommicRepo>())
                    ..fetchNewManga()),
          BlocProvider<FetchHotCommicCubit>(
              create: (context) =>
                  FetchHotCommicCubit(hotMangaRepo: context.read<HotCommicRepo>())
                    ..fetchHotCommics()),
          BlocProvider(
            create: (context) => AuthBloc(AuthRepo()),
          ),

          BlocProvider(
            create: (context) => BottombarBloc(),
          ),
          // BlocProvider(
          //     create: (context) => LoginCubit(AuthenticationSerivce())),
          // BlocProvider(
          //     create: (context) => SignUpCubit(AuthenticationSerivce())),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: '$SplashScreen',
          routes: {
            '$SplashScreen': (_) => const SplashScreen(),
            '$RootApp': (_) => const RootApp(),
            '$HomeScreen': (_) => const HomeScreen(),
            '$CaseScreen': (_) => const CaseScreen(),
            '$LibraryScreen': (_) => const LibraryScreen(),
            '$ProfileScreen': (_) => const ProfileScreen(),
            '$LoginScreen': (_) => const LoginScreen(),
            '$SignUpScreen': (_) => const SignUpScreen(),
            // '$MangaDetail':(_) => const MangaDetail(),
            '$NotifiScreen': (_) => const NotifiScreen(),
          },
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
