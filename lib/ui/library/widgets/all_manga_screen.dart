import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';


class AllManga extends StatefulWidget {
  const AllManga({super.key});

  @override
  State<AllManga> createState() => _AllMangaState();
}

class _AllMangaState extends State<AllManga> {
  final List<Map<String ,dynamic>> allManga = [
  {
    "urlImage": "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
    "id"      : 1,
    "title"   : "Trinity seven",
    "numberChap" : 128,
  },
  {
     "urlImage": "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
    "id"      : 2,
    "title"   : "Hunter",
    "numberChap" : 248,
  },
  {
    "urlImage": "assets/vo_luyen_dinh_phong/cach-xem-phim-7-vien-ngoc-rong-phu-de-tieng-viet-tren-ung-dung-pops-thumbnail.jpg",
    "id"      : 3,
    "title"   : "Songuku",
    "numberChap" : 565,
  },
  {
    "urlImage": "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
    "id"      : 1,
    "title"   : "Trinity seven",
    "numberChap" : 621,
  },
  {
    "urlImage": "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
    "id"      : 1,
    "title"   : "Trinity seven",
    "numberChap" : 814,
  },
   {
    "urlImage": "assets/vo_luyen_dinh_phong/cach-xem-phim-7-vien-ngoc-rong-phu-de-tieng-viet-tren-ung-dung-pops-thumbnail.jpg",
    "id"      : 3,
    "title"   : "Songuku",
    "numberChap" : 663,
  },
  {
     "urlImage": "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
    "id"      : 2,
    "title"   : "Hunter",
    "numberChap" : 1122,
  },
  {
     "urlImage": "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
    "id"      : 2,
    "title"   : "Hunter",
    "numberChap" : 754,
  },
  {
    "urlImage": "assets/vo_luyen_dinh_phong/cach-xem-phim-7-vien-ngoc-rong-phu-de-tieng-viet-tren-ung-dung-pops-thumbnail.jpg",
    "id"      : 3,
    "title"   : "Songuku",
    "numberChap" : 325,
  },
  {
    "urlImage": "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
    "id"      : 1,
    "title"   : "Trinity seven",
    "numberChap" : 211,
  },
   {
     "urlImage": "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
    "id"      : 2,
    "title"   : "Hunter",
    "numberChap" : 655,
  },
  {
     "urlImage": "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
    "id"      : 2,
    "title"   : "Hunter",
    "numberChap" : 114,
  },
];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  SingleChildScrollView(
      child: GridView.builder(
         physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: allManga.length,
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing:20,
         childAspectRatio: 1 / 1.5,
          crossAxisCount: 2,
          ),
        itemBuilder: (context,index){
         return SizedBox(
          height: SizeConfig.screenHeight * 0.29,
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.screenHeight * 0.225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(allManga[index]["urlImage"]),fit: BoxFit.fill),
                ),
              ),
              Text(allManga[index]["title"],style: const TextStyle(color: Colors.white,fontSize: 20),),
              Text("${allManga[index]["numberChap"]} chương"),
              const Divider(),
            ],
          ),
         );
        }
        ),
    );
  }
}