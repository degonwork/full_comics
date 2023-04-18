import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/ui/library/widgets/all_manga_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin{
 static const List<Tab> tabs = <Tab>[
    Tab(text: 'Tất cả'),
    Tab(
      text: 'Hoàn thành',
    ),
    Tab(
      text: 'Truyện hot',
    ),
  ];
  late TabController _tabController  = TabController(length: tabs.length, vsync: this);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
 
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child:  const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon:  Icon(Icons.search),
                hintText: 'Tìm kiếm truyện, thể loại ...',
               
              ),
            ),
          ),
        ),
        body: Container(
           decoration:const BoxDecoration(
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
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.screenHeight / 50.4,
                    left: SizeConfig.screenWidth / 36,
                    right: SizeConfig.screenWidth / 36,
                    ),
                  height: SizeConfig.screenHeight / 25.2,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    children: [
                       Icon(Icons.filter_alt_sharp,color: Colors.black.withOpacity(0.7),),
                       tagType('Ngôn tình'),
                       tagType('Huyền huyễn'),
                       tagType('Truyện dân gian'),
                       tagType('Võng du'),
                       tagType('Bách hợp'),
                       tagType('Ngôn tình'),
                       tagType('Huyền huyễn'),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      margin:  EdgeInsets.only(top: SizeConfig.screenHeight / 50.4),
                      child: TabBar(
                        controller: _tabController,
                        tabs: tabs,
                        unselectedLabelColor: Colors.black,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: double.maxFinite,
                     
                         margin:  EdgeInsets.only(top: SizeConfig.screenHeight / 42),
                         padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 20),
                         child: TabBarView(
                           physics: const BouncingScrollPhysics(),
                            //  physics: const ClampingScrollPhysics(),
                             controller: _tabController,
                             children: const [
                             AllManga(),
                              
                             AllManga(),
                            
                             AllManga(),
                             ]),
                       ),
                    ),
                  ]
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
  Widget tagType(String title){
    return  InkWell(
      child: Container(
        margin:  EdgeInsets.only(left: SizeConfig.screenWidth / 36 ,right: SizeConfig.screenWidth / 72),
        decoration: BoxDecoration(
          color: Colors.brown.withOpacity(0.4),
          border: Border.all(width: 1,color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Container(
          margin:const  EdgeInsets.all(5),
          child: Text(title,style:const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}