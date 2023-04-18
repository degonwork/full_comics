import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/main.dart';

import 'package:full_comics/ui/library/widgets/banner_listview.dart';
import 'package:full_comics/ui/search_screen/search_screen.dart';


class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
       
        body: Container(
          height: SizeConfig.screenHeight,
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
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.amberAccent,
                flexibleSpace: Padding(
                  padding:  EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.0132,
                    right: SizeConfig.screenWidth / 18,
                    left: SizeConfig.screenWidth / 18 ,
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Khám phá',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      IconButton(
                        onPressed: () {
                          navigatorKey.currentState!.push(MaterialPageRoute(builder: (_) => const SearchScreen()));
                        }, icon: const Icon(Icons.search,color: Colors.blue,)),
                    ],
                  ),
                ),
                floating: false,
                snap: false,
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height / 12,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const BannerListview(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                       Container(
                        padding:  EdgeInsets.only(top: SizeConfig.screenHeight * 0.0132,left: SizeConfig.screenWidth / 18),
                        height: MediaQuery.of(context).size.height / 1.5,
                        decoration: BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ]
                        ),
                        margin:  EdgeInsets.only(
                          top: SizeConfig.screenHeight * 0.0265,
                          left: SizeConfig.screenWidth / 18,
                          right: SizeConfig.screenWidth / 18,
                          ),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text('Hot nhất tuần ',style: TextStyle(color: Colors.white,fontSize: 20),),
                              ],
                            ),
                          ],
                        ),
                       ),
                        SizedBox(height: SizeConfig.screenHeight * 0.0265),
                       Container(
                        margin:  EdgeInsets.only(
                          top: SizeConfig.screenHeight * 0.0265,
                          left: SizeConfig.screenWidth / 18,
                          right: SizeConfig.screenWidth / 18,
                          ),
                        padding:  EdgeInsets.only(top: SizeConfig.screenHeight * 0.0132,left: SizeConfig.screenWidth / 18,),
                        height: MediaQuery.of(context).size.height / 1.5,
                        decoration: BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ]
                        ),
                        child: Column(
                          children:  [
                            Row(
                              children:const [
                                 Text('Mới nhất',style: TextStyle(color: Colors.white,fontSize: 20),),
                              ],
                            ),
                          ],
                        ),
                       ),
                        SizedBox(height: SizeConfig.screenHeight * 0.0265),
                       Container(
                        margin:  EdgeInsets.only(
                          top: SizeConfig.screenHeight * 0.0265,
                          left: SizeConfig.screenWidth / 18,
                          right: SizeConfig.screenWidth / 18,
                          ),
                        padding:  EdgeInsets.only(top: SizeConfig.screenHeight * 0.0132,left: SizeConfig.screenWidth / 18,),
                        height: MediaQuery.of(context).size.height / 1.5,
                        decoration: BoxDecoration(
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ]
                        ),
                        child: Column(
                          children:  [
                            Row(
                              children:const [
                                 Text('Đề cử',style: TextStyle(color: Colors.white,fontSize: 20),),
                              ],
                            ),
                          ],
                        ),
                       ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
