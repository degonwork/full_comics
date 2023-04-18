import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final List<Map<String, dynamic>> allManga = [
    {
      "urlImage": "assets/vo_luyen_dinh_phong/trinity-seven-ss2-thumbnail.jpg",
      "id": 1,
      "title": "Trinity seven",
    },
    {
      "urlImage":
          "assets/vo_luyen_dinh_phong/f79f1858-8cc9-4f4d-9119-7826a5bbb0a7.jpg",
      "id": 2,
      "title": "Hunter",
    },
    {
      "urlImage":
          "assets/vo_luyen_dinh_phong/cach-xem-phim-7-vien-ngoc-rong-phu-de-tieng-viet-tren-ung-dung-pops-thumbnail.jpg",
      "id": 3,
      "title": "Songuku",
    }
  ];
  List<Map<String, dynamic>> searchManga = [];
  @override
  void initState() {
    searchManga = allManga;
    super.initState();
  }

  void runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
    } else {
      results = allManga
          .where((manga) =>
              manga["name"].toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
      setState(() {
        searchManga = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const TextField(
      // onTap: () {
      //   showBottomSheet(
      //       context: context,
      //       builder: (_) {
      //         return Expanded(
      //             child: searchManga.isNotEmpty
      //                 ? ListView.builder(
      //                     itemCount: searchManga.length,
      //                     itemBuilder: (context, index) => Card(
      //                       elevation: 1,
      //                       margin: const EdgeInsets.symmetric(vertical: 2),
      //                       child: ListTile(
      //                         leading: CircleAvatar(
      //                           radius: 30,
      //                           backgroundImage: NetworkImage(
      //                               searchManga[index]["image"]),
      //                           backgroundColor: Colors.transparent,
      //                         ),
      //                         title: Text(searchManga[index]["title"]),
      //                       ),
      //                     ),
      //                   )
      //                 : const Text(
      //                     'Khong tim thay ',
      //                     style: TextStyle(fontSize: 24),
      //                   ));
      //       });
      // },
      // onChanged: (value) => runFilter(value),
      // decoration: const InputDecoration(
      //   border: InputBorder.none,
      //   prefixIcon: Icon(Icons.search),
      //   hintText: 'Tìm kiếm truyện, thể loại ...',
      // ),
    );
  }
}
