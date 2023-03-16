import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
class Bottombar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Bottombar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 10.0,
            color: const Color(0xffd9d9d9).withOpacity(0.25),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          iconSize: 28,
          backgroundColor: const Color(0xfffdfdfd),
          fixedColor: Colors.black,
          showSelectedLabels: true,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              
              icon: Icon(Icons.home_outlined),
              label: "Trang chủ",
            ),
            BottomNavigationBarItem(
              
              icon: Icon(Icons.library_books),
              label: 'Thư viện',
            ),
            
            BottomNavigationBarItem(
             
              icon: Icon(Icons.cases_outlined),
              label: 'Tủ sách',
            ),
            BottomNavigationBarItem(
              
              icon: Icon(Icons.person),
              label: 'Cá nhân',
            ),
          ],
        ),
      ),
    );
  }
}