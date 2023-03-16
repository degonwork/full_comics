import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_state.dart';
import 'package:full_comics/data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';
import 'package:full_comics/data/models/service_models/user.dart';
import 'package:full_comics/main.dart';
import 'package:full_comics/ui/login/cubit/login_cubit.dart';
import 'package:full_comics/ui/login/login_screen.dart';
import 'package:full_comics/ui/sign_up_screen/sign_up_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:full_comics/data/authentication_repository/user_repository.dart';
// import 'package:full_comics/data/models/user_model.dart';
// import 'package:full_comics/ui/login/bloc/login_bloc.dart';
// import 'package:full_comics/ui/login/bloc/login_event.dart';
// import 'package:full_comics/ui/login/bloc/login_state.dart';
// import 'package:full_comics/ui/manga_detail/manga_detail.dart';
import 'package:full_comics/widget/banner_app.dart';
import 'package:full_comics/widget/manga_appoint.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../authenticaiton_firebase/bloc/auth_firebase_bloc.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  
  // @override
  // void initState(){
  //   super.initState();
   
  // }
  @override
  Widget build(BuildContext context) {
    final user  = context.select((AppBloc appBloc) => appBloc.state.user);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow,
                Colors.cyan,
                Colors.indigo,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white30,

                          ),
                          child: BlocBuilder<AppBloc,AuthFirebaseState>(
                            builder:
                             (context,state) => state.status == AppStatus.authenticated  ? const Text("Xin chào",style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                             ),) : TextButton(onPressed: (){
                               navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
                            }, child: const Text("Đăng nhập",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),)),
                            ),
                          // child: BlocProvider<LoginCubit>(
                          //   create: (context) =>
                          //       LoginCubit(AuthenticationSerivce()),
                          //   child: BlocBuilder<LoginCubit, LoginState>(
                          //     builder: (context, state) {
                          //       // state.status == LoginStatus.success ? const Text('Xin chao') : TextButton(onPressed: (){}, child: const Text('data'));
                              
                          //       return TextButton(
                          //           onPressed: () {
                          //            navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
                          //           },
                          //           child: const Text('Đăng nhập'));
                          //     },
                          //   ),
                          // ),
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search_outlined)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                Icons.notifications_active_outlined)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 90),
                alignment: AlignmentDirectional.topStart,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    children: const [
                      BannerApp(),
                      SizedBox(
                        height: 10,
                      ),
                      MangaAppoint(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
