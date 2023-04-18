

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_state.dart';
import 'package:full_comics/config/size_config.dart';
// import 'package:full_comics/data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';
// import 'package:full_comics/data/models/service_models/user.dart';
import 'package:full_comics/main.dart';
import 'package:full_comics/ui/home/child_screen/hot_manga/hot_commic_screen.dart';
import 'package:full_comics/ui/home/child_screen/new_manga/new_manga_screen.dart';
import 'package:full_comics/ui/home/child_screen/notifi_screen/notifi_screen.dart';
import 'package:full_comics/ui/library/widgets/banner_listview.dart';
// import 'package:full_comics/ui/login/cubit/login_cubit.dart';
import 'package:full_comics/ui/login/login_screen.dart';
import 'package:full_comics/ui/search_screen/search_screen.dart';
import 'package:full_comics/widget/manga_appoint.dart';

// import 'package:firebase_auth/firebase_auth.dart';

import '../../authenticaiton_firebase/bloc/auth_firebase_bloc.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                padding:  EdgeInsets.only(top: SizeConfig.screenHeight * 0.026, left: SizeConfig.screenWidth * 0.041
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: BlocBuilder<AppBloc,AuthFirebaseState>(
                            builder:
                             (context,state) => state.status == AppStatus.authenticated  ? const Text("Xin chào",style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                             ),) : Container(
                              height: SizeConfig.screenHeight * 0.066,
                              width: SizeConfig.screenWidth / 3,
                              decoration: BoxDecoration(
                                color: Colors.amberAccent.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10),
                               boxShadow:   [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 6.0,
                                  spreadRadius: 2.0,
                                  offset:const   Offset(0, 0),
                                ),
                               ],
                              ),
                               child: TextButton(onPressed: (){
                                 Navigator.push(context, PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 400),
                                  transitionsBuilder: (context,animation,secAnimation,child){
                                    return ScaleTransition(
                                      scale: animation,
                                      alignment: Alignment.center,
                                      child: child,
                                      );
                                  },
                                  pageBuilder: (context,animation,secAnimation){
                                    return const LoginScreen();
                                  }
                                  ));
                                }, child: const Text("Đăng nhập",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                ),)),
                             ),
                            ),
                        ),
                        SizedBox(
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               IconButton(
                            onPressed: () {
                              navigatorKey.currentState!.push(createRoute());
                            },
                            icon: const Icon(Icons.search_outlined,color: Colors.blue,)),
                        IconButton(
                            onPressed: () {
                              navigatorKey.currentState!.push(MaterialPageRoute(builder: (_) => const NotifiScreen()));
                            },
                            icon: const Icon(
                                Icons.notifications_active_outlined,color:Colors.blue,)),
                            ],
                           ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: SizeConfig.screenHeight,
                padding:  EdgeInsets.only(top: SizeConfig.screenHeight * 0.0925),
                alignment: AlignmentDirectional.topStart,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    // verticalDirection: VerticalDirection.down,
                    children:   [
                      const BannerListview(),
                        SizedBox(
                        height: SizeConfig.screenHeight * 0.0132,
                      ),
                    //  NewManga(),
                     const   MangaAppoint(),
                      SizedBox(height: SizeConfig.screenHeight / 75.6,),
                    //  const HotCommic(),
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

Route createRoute(){
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context,animation,secondaryAnimation) => const SearchScreen(),
    transitionsBuilder: (context,animation,secondaryAnimation,child) {
       const begin = Offset(1.0, 0.0);
       const end   = Offset.zero;
       const curve = Curves.ease;
       var tween = Tween(begin: begin,end: end).chain(CurveTween(curve: curve));
       return SlideTransition(
        position: animation.drive(tween),
        child: child,
        )
        ;
    }
    );
}