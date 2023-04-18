//
import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';

import 'package:full_comics/ui/manga_detail/widget/chapter.dart';
import 'package:full_comics/ui/manga_detail/widget/comment.dart';
import 'package:full_comics/ui/manga_detail/widget/infor.dart';

class MangaDetail extends StatefulWidget {
  const MangaDetail({super.key});

  @override
  State<MangaDetail> createState() => _MangaDetailState();
}

class _MangaDetailState extends State<MangaDetail>
    with SingleTickerProviderStateMixin {
  String? title;
  String? urlImage;
  int? chapNumber;
  List<String>? type;
  String? summary;
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Thông tin'),
    Tab(
      text: 'Chương',
    ),
    Tab(
      text: 'Bình luận',
    ),
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
              floating: false,
              snap: false,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 4,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Trinity-seven-ss2',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                background: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  TabBar(
                    controller: _tabController,
                    tabs: tabs,
                    unselectedLabelColor: Colors.black,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Container(
                        margin:  EdgeInsets.only(top: SizeConfig.screenHeight / 42),
                        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 18),
                        child: TabBarView(
                            physics: const ClampingScrollPhysics(),
                            controller: _tabController,
                            children: const [
                              Infor(),
                              Chapter(),
                              Comment(),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
