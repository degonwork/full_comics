import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/data/models/banner.dart';
import 'package:full_comics/main.dart';

class NotifiScreen extends StatelessWidget {
  const NotifiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.028),
          child: Column(
            children: [
               SizedBox(
                height: SizeConfig.screenHeight * 0.0265,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      navigatorKey.currentState!.pop(context);
                    },
                    iconSize: 30,
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  const Center(
                    child: Text(
                      'Tất cả',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                   SizedBox(width: SizeConfig.screenWidth / 12,),
                  // const Icon(Icons.notifications_active,size: 30,color: Colors.white,),
                ],
              ),
              const Divider(
                thickness: 0.6,
                color: Colors.white,
              ),
               SizedBox(height: SizeConfig.screenHeight * 0.0132),
              ListTile(
                onTap: () => _gotDetailsNotifiPage(context),
                title: const Text('Có chap mới'),
                leading: Hero(
                  tag: 'hero-rectangle',
                  child: _blueRectangle(const Size(80, 80)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _blueRectangle(Size size) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(banner[1].thumnail),fit: BoxFit.cover),
      ),
      height: size.height,
      width: size.width,
      // color: Colors.yellow,
    );
  }

  void _gotDetailsNotifiPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: 'hero-rectangle',
                        child: _blueRectangle(const Size(200, 200)))
                  ],
                ),
              ),
            )));
  }
}
