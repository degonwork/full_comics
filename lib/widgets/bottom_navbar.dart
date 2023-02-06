import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int initialIndex;
  final Function(int) onTap;
  const BottomNavBar(
      {super.key, required this.initialIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xFFFDFDFD),
      child: DefaultTabController(
        initialIndex: initialIndex,
        length: 4,
        child: TabBar(
          tabs: [
            Tab(
              child: Column(
                children: const [
                  Icon(Icons.home_filled, color: Colors.amber, size: 30),
                  Text("Home", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Tab(
              child: Column(
                children: const [
                  Icon(Icons.library_books, color: Colors.amber, size: 30),
                  Text("Library", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Tab(
              child: Column(
                children: const [
                  Icon(Icons.cases_outlined, color: Colors.amber, size: 30),
                  Text("Case", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Tab(
              child: Column(
                children: const [
                  Icon(Icons.person, color: Colors.amber, size: 30),
                  Text("Profile", style: TextStyle(color: Colors.black54)),
                ],
              ),
            )
          ],
          onTap: onTap,
        ),
      ),
    );
  }
}
