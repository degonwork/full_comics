import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';

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
    SizeConfig().init(context);
    return   Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.04),
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
          child: Column(
            
            children: [
              TabBar(
                controller: _tabController,
                tabs: tabs,
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                ),
                ),
              Expanded(
                child: TabBarView(
                  physics: const ClampingScrollPhysics(),
                  controller: _tabController,
                  children: const [
                    Reading(),
                    Favourite(),
                    ReadOffline(),
                  ],
                  ),
              ),
            ],
          ),
          // child: TabBarView(
          //   controller: _tabController,
          //   children: const [
          //     Reading(),
          //     Favourite(),
          //     ReadOffline(),
          //   ],
          // ),
        ),
      ),
    );
  }
}

class Reading extends StatelessWidget {
  const Reading({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      scrollDirection: Axis.vertical,
    //   child: Column(
    //     children: [
    //       Container(
    //         height: 60,
    //         width: double.infinity,
    //         color: Colors.red,
    //       ),
    // const      SizedBox(height: 20,),
    //         Container(
    //         height: 100,
    //          width: double.infinity,
    //         color: Colors.red,
    //       ),
    //       const SizedBox(height: 100,),
    //         Container(
    //         height: 20,
    //          width: double.infinity,
    //         color: Colors.red,
    //       ),
    //       const SizedBox(height: 200,),
    //         Container(
    //         height: 20,
    //          width: double.infinity,
    //         color: Colors.amber,
    //       ),
    //       const SizedBox(height: 200,),
    //         Container(
    //         height: 20,
    //          width: double.infinity,
    //         color: Colors.amber,
    //       ),
    //       const SizedBox(height: 200,),
    //         Container(
    //         height: 20,
    //          width: double.infinity,
    //         color: Colors.amber,
    //       ),
    //     ],
    //   ),
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