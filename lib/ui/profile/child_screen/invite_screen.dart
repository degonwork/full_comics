import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_comics/config/size_config.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    String copyBroad = 'JFAPFA';
    Future<void> copyClipBoard() async{
      Clipboard.setData(ClipboardData(text: copyBroad));
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        duration:const  Duration(seconds: 3),
        backgroundColor: Colors.blue.withOpacity(0.5),
        content: const Text('Đã sao chép mã giới thiệu')));
    }
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.amberAccent,
                centerTitle: true,
                title: const Text(
                  'Giới thiệu bạn bè',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight / 15.12),
                  height: SizeConfig.screenHeight / 7.56,
                  width: SizeConfig.screenWidth / 3.6,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/vo_luyen_dinh_phong/unnamed.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight / 37.8),
              Center(
                child: Text(
                  'Mã giới thiệu của tôi',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 25),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight / 151.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    copyBroad,
                    style:const  TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth / 36,
                  ),
                  TextButton(
                      onPressed:copyClipBoard,
                      child: const Text(
                        'Sao chép',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ))
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight / 37.8,
              ),
              Center(
                child: Container(
                  height: SizeConfig.screenHeight / 12.6,
                  width: SizeConfig.screenWidth / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.redAccent.withOpacity(0.9),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Giới thiệu bạn bè',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 20),
                      )),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight / 75.6),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth / 12),
                child: const Center(
                  child: Text(
                      'Giới thiệu bạn bè qua Facebook,SMS... bằng mã giới thiệu của bạn sẽ được tặng điểm hoạt động.',textAlign: TextAlign.center,),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight / 37.8,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: SizeConfig.screenHeight / 75.6,
                  left: SizeConfig.screenWidth / 36,
                  right: SizeConfig.screenWidth / 36,
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth / 18),
                height: SizeConfig.screenHeight / 3.78,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.white.withOpacity(0.2)),
                    ]),
                child: Column(
                  children: [
                    const Text(
                        'Nhập mã giới thiệu của bạn bè , bạn sẽ được cộng thêm điểm hoạt động',textAlign: TextAlign.center,),
                    SizedBox(
                      height: SizeConfig.screenHeight / 75.6,
                    ),
                    const TextField(
                      // autofocus: true,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: ' Mã giới thiệu ',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.white,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight / 50.4,
                    ),
                    InkWell(
                      child: Container(
                        height: SizeConfig.screenHeight / 15.12,
                        width: SizeConfig.screenWidth / 1.8,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text(
                          'Chấp nhận',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
