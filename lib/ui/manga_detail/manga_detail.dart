// import 'dart:html';

import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:full_comics/config/size_config.dart';

class MangaDetail extends StatefulWidget {
  const MangaDetail({super.key});

  @override
  State<MangaDetail> createState() => _MangaDetailState();
}

class _MangaDetailState extends State<MangaDetail>
    with SingleTickerProviderStateMixin {
  double count = 0;
//  final  _scrollController = ScrollController();
  // late AnimationController _controller;
  // late Animation<Offset> offsetAnimation;
  // @override
  // void initState(){
  //   super.initState();
  //   _controller = AnimationController(vsync: this,duration: const Duration(seconds: 2))..repeat(reverse: true);
  //   offsetAnimation = Tween<Offset>(begin: Offset.zero,end:const Offset(1.5, 0.0)).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  // }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    List listImage = [
      'assets/vo_luyen_dinh_phong/image(2).jpg',
      'assets/vo_luyen_dinh_phong/image(3).jpg',
      'assets/vo_luyen_dinh_phong/image(4).jpg',
      'assets/vo_luyen_dinh_phong/image(5).jpg',
      'assets/vo_luyen_dinh_phong/image(6).jpg',
      'assets/vo_luyen_dinh_phong/image(7).jpg',
      'assets/vo_luyen_dinh_phong/image(8).jpg',
      'assets/vo_luyen_dinh_phong/image(9).jpg',
      'assets/vo_luyen_dinh_phong/image(10).jpg',
      'assets/vo_luyen_dinh_phong/image(11).jpg',
      'assets/vo_luyen_dinh_phong/image(12).jpg',
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                count == 0 ? count = 1: count = 0;
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: scrollController,
                child: Column(
                  children: List.generate(listImage.length, (index) => SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(listImage[index],fit: BoxFit.cover,),
                  )),
                ),
               
              ),
            ),

            AnimatedOpacity(
              curve: Curves.linear,
              opacity: count,
              duration: const Duration(seconds: 1),
               
              child: Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Quay lại',
                      style: TextStyle(color: Colors.amber, fontSize: 20),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
