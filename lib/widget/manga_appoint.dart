import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:full_comics/data/models/banner.dart';
import 'package:full_comics/main.dart';
import 'package:full_comics/ui/manga_detail/manga_detail.dart';

class MangaAppoint extends StatelessWidget {
  const MangaAppoint({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [
      {"image": "assets/vo_luyen_dinh_phong/anh de.jpg"},
      {"image": "assets/vo_luyen_dinh_phong/anh de.jpg"},
      {"image": "assets/vo_luyen_dinh_phong/anh de.jpg"},
      {"image": "assets/vo_luyen_dinh_phong/anh de.jpg"},
      {"image": "assets/vo_luyen_dinh_phong/anh de.jpg"},
      {"image": "assets/vo_luyen_dinh_phong/anh de.jpg"},
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          // verticalDirection: VerticalDirection.down,
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
                  itemCount: data.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => const MangaDetail()));
                      },
                      child: Card(
                        borderOnForeground: true,
                        // shape: RoundedRectangleBorder(
                        //   // borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ),
                        child: Image.asset(
                          data[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 8,
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
                  itemCount: data.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        data[index]["image"],
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 8,
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
                  itemCount: data.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        data[index]["image"],
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
