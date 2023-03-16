import 'package:flutter/material.dart';

class CaseScreen extends StatefulWidget {
  const CaseScreen({super.key});

  @override
  State<CaseScreen> createState() => _CaseScreenState();
}

class _CaseScreenState extends State<CaseScreen> with SingleTickerProviderStateMixin{
  static const List<Tab> tabs = <Tab>[
      Tab(text: 'Đang đọc'),
      Tab(text: 'Yêu thích',),
      Tab(text: 'Đọc offline',),
    ];
    late TabController _tabController;
    @override 
    void initState(){
      super.initState();
      _tabController =TabController(length: tabs.length, vsync: this);
    }
    @override
    void dispose(){
      _tabController.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child:  Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.yellow,Colors.blue])
            ),
          ),
          bottom: TabBar(
            tabs: tabs,
            controller: _tabController,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow,
                Colors.cyan,
                Colors.indigo,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              )
          ),
          child: TabBarView(
            controller: _tabController,
            children: const [
              Reading(),
              Favourite(),
              ReadOffline(),
            ],
          ),
        ),
      ),
    );
  }
}

class Reading extends StatelessWidget {
  const Reading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      // color: Colors.red,
    );
  }
}
class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
    );
  }
}
class ReadOffline extends StatelessWidget {
  const ReadOffline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
    );
  }
}