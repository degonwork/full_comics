import 'dart:async';

import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/root_app/root_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context,animation,secondaryAnimation,child){
          return SlideTransition(
            position: Tween<Offset>(begin:const Offset(1, 0),end: Offset.zero).animate(animation),
            child: child,
            );
        },
        pageBuilder: ((context, animation, secondaryAnimation) {
          return const RootApp();
        })
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Chào mừng bạn đến với App Truyện',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Image.asset(
              'assets/vo_luyen_dinh_phong/unnamed.png',
              height: SizeConfig.screenHeight / 2.52,
              width: SizeConfig.screenWidth / 1.2,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
