import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/ui/home/child_screen/new_manga/new_manga_screen.dart';

import 'package:full_comics/ui/manga_detail/manga_detail.dart';

import '../ui/home/child_screen/all_new_manga/all_new_manga.dart';

class MangaAppoint extends StatelessWidget {
  const MangaAppoint({super.key});

  // late Future<HotComics> futureComics;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> allManga = [
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
        "id": 1,
        "title": "Trinity seven",
        "numberChap": 128,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
        "id": 2,
        "title": "Hunter",
        "numberChap": 248,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/cach-xem-phim-7-vien-ngoc-rong-phu-de-tieng-viet-tren-ung-dung-pops-thumbnail.jpg",
        "id": 3,
        "title": "Songuku",
        "numberChap": 565,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
        "id": 1,
        "title": "Trinity seven",
        "numberChap": 621,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
        "id": 1,
        "title": "Trinity seven",
        "numberChap": 814,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/cach-xem-phim-7-vien-ngoc-rong-phu-de-tieng-viet-tren-ung-dung-pops-thumbnail.jpg",
        "id": 3,
        "title": "Songuku",
        "numberChap": 663,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
        "id": 2,
        "title": "Hunter",
        "numberChap": 1122,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
        "id": 2,
        "title": "Hunter",
        "numberChap": 754,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/cach-xem-phim-7-vien-ngoc-rong-phu-de-tieng-viet-tren-ung-dung-pops-thumbnail.jpg",
        "id": 3,
        "title": "Songuku",
        "numberChap": 325,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
        "id": 1,
        "title": "Trinity seven",
        "numberChap": 211,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
        "id": 2,
        "title": "Hunter",
        "numberChap": 655,
      },
      {
        "urlImage":
            "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
        "id": 2,
        "title": "Hunter",
        "numberChap": 114,
      },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Truyện đề cử',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 400),
                          transitionsBuilder:
                            (context, animation, secAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        }, pageBuilder: (context, animation, secAnimation) {
                          return const AllNewManga();
                        }));
                  },
                  child: const Text(
                    "Xem thêm",
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ],
            ),
            const NewManga(),
            SizedBox(
              height: SizeConfig.screenHeight / 75.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tiểu thuyết mới',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Xem thêm",
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: allManga.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.asset(
                        allManga[index]["urlImage"],
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 75.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Truyện hot nhất',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Xem thêm",
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: allManga.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.asset(
                        allManga[index]["urlImage"],
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
