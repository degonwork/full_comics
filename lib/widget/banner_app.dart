import 'package:flutter/material.dart';
import 'package:full_comics/data/models/banner.dart';
class BannerApp extends StatefulWidget {
  const BannerApp({super.key});

  @override
  State<BannerApp> createState() => _BannerAppState();
}

class _BannerAppState extends State<BannerApp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.zero,
          height: 150,
          child: PageView.builder(
            onPageChanged: (index){
              setState(() {
                selectedIndex = index;
              });
            },
            itemCount: banner.length,
            itemBuilder: ((context, index){
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(banner[index].thumnail),
                  fit: BoxFit.cover,
                  ),
                ),
              );
            }
            ),
          ),
        ),
  const   SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(banner.length, (index) => Indicator(
                isActive: selectedIndex == index ? true : false,
              ),
              ),
            ],
          ),
      ],
    );
  }
}
class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 350),
      margin:const EdgeInsets.symmetric(horizontal: 4),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffffffff) : const Color(0xffffffff).withOpacity(0.5),
      ),
    );
  }
}

// 2
