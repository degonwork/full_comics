import 'package:flutter/material.dart';
import 'package:full_comics/config/size_config.dart';

class Chapter extends StatelessWidget {
  const Chapter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: SizeConfig.screenHeight / 37.8,
            ),
            const Text(
              'Mới nhất',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
             SizedBox(
              height:  SizeConfig.screenHeight / 37.8,
            ),
            Container(
              padding: EdgeInsets.zero,
              height:  SizeConfig.screenHeight / 15.12,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      height:  SizeConfig.screenHeight / 18.9,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        'Chapter 201',
                        style: TextStyle(fontSize: 25),
                      )),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      height:  SizeConfig.screenHeight / 18.9,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        'Chapter 200',
                        style: TextStyle(fontSize: 25),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.5,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Danh sách',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list_outlined))
                ],
              ),
            ),
             SizedBox(
              height:  SizeConfig.screenHeight / 50.4,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Chapter 01',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 02',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 03',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 04',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 05',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 06',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 07',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 08',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 09',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 10',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 11',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 12',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 13',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 14',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 15',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 16',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    'Chapter 17',
                    style: TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
