import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_bloc.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_state.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';
import 'package:full_comics/main.dart';
import 'package:full_comics/ui/home/child_screen/notifi_screen/notifi_screen.dart';

import 'package:full_comics/ui/profile/child_screen/rate_screen.dart';
import 'package:full_comics/ui/profile/child_screen/setup_screen.dart';
import 'package:full_comics/ui/profile/child_screen/invite_screen.dart';
import 'package:full_comics/widget/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? imageFile;
  final ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    List<Widget> listNavigator = const [
      NotifiScreen(),
      InviteScreen(),
      RateScreen(),
      SetupScreen(),
    ];
    final ImagePicker image = ImagePicker();
    final user = context.select((AppBloc appBloc) => appBloc.state.user);
    List<String> list = const [
      'Thông báo',
      'Giới thiệu bạn bè',
      'Đánh giá ứng dụng',
      'Cài đặt'
    ];
    List<Icon> icons = const [
      Icon(Icons.notifications),
      Icon(Icons.share),
      Icon(Icons.star),
      Icon(Icons.settings),
    ];
    void takePhoto(ImageSource source) async {
      final pickedFile = await image.pickImage(source: source);
      setState(() {
        imageFile = File(pickedFile!.path);
      });
    }

    return SafeArea(
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin:  EdgeInsets.only(
                    top: SizeConfig.screenHeight / 75.6,
                    left: SizeConfig.screenWidth / 18,
                    right: SizeConfig.screenWidth /18,
                      ),
                  padding:
                       EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth / 24,
                        vertical: SizeConfig.screenHeight / 50.4
                         ),
                  height: MediaQuery.of(context).size.height / 2.85,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [
                         CircleAvatar(
                            radius: SizeConfig.screenWidth / 9,
                            child: user.photo != null
                                ? CircleAvatar(
                                    radius: 40,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.network(
                                        user.photo!,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      showBottomSheet(
                                        builder: (context) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                            ),
                                            height: SizeConfig.screenHeight / 5.4,
                                            width: SizeConfig.screenWidth,
                                            margin:  EdgeInsets.symmetric(
                                              horizontal: SizeConfig.screenWidth / 18,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text(
                                                  "Chọn ảnh từ",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton.icon(
                                                      onPressed: () =>
                                                          takePhoto(ImageSource
                                                              .camera),
                                                      icon: const Icon(
                                                          Icons.camera),
                                                      label: const Text(
                                                          "Chụp ảnh"),
                                                    ),
                                                    ElevatedButton.icon(
                                                      onPressed: () =>
                                                          takePhoto(ImageSource
                                                              .gallery),
                                                      icon: const Icon(
                                                          Icons.image),
                                                      label: const Text(
                                                          "Thư viện"),
                                                    ),
                                                  ],
                                                ),
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: imageFile != null
                                                      ? const Icon(Icons
                                                          .save_alt_outlined)
                                                      : const Icon(
                                                          Icons.cancel),
                                                  label: imageFile != null
                                                      ? const Text('Lưu')
                                                      : const Text(' Hủy bỏ'),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        context: context,
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 40,
                                      backgroundImage: imageFile != null
                                          ? Image.file(File(imageFile!.path))
                                              .image
                                          : Image.asset(
                                                  'assets/vo_luyen_dinh_phong/person_icon.png')
                                              .image,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: imageFile != null
                                            ? Image.file(
                                                File(imageFile!.path),
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                'assets/vo_luyen_dinh_phong/person_icon.png',
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                          ),
                          Column(
                            children: [
                              const Text(
                                'Xin chào',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                               SizedBox(
                                height: SizeConfig.screenHeight / 75.6,
                              ),
                              Column(
                                children: [
                                  BlocBuilder<AppBloc, AuthFirebaseState>(
                                    builder: (context, state) => state.status ==
                                            AppStatus.authenticated
                                        ? Text('${user.email}')
                                        : const Text('Cùng nhau khám phá nhé'),
                                  ),
                                  const Divider(),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      //  SizedBox(
                      //   height: SizeConfig.screenHeight / 50.4,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: SizeConfig.screenHeight / 15.12 ,
                                width: SizeConfig.screenWidth / 3.6,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Nạp xu',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal),
                                      )),
                                ),
                              ),
                               SizedBox(
                                height: SizeConfig.screenHeight / 37.8,
                              ),
                              Container(
                                height: SizeConfig.screenHeight / 15.12,
                                width: SizeConfig.screenWidth / 7.2,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/vo_luyen_dinh_phong/37060092c38af527b818fdcdc659e3eb.png'))),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: SizeConfig.screenHeight / 15.12,
                                width: SizeConfig.screenWidth / 3.6,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Ví',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal),
                                      )),
                                ),
                              ),
                               SizedBox(
                                height: SizeConfig.screenHeight / 37.8,
                              ),
                              Container(
                                height: SizeConfig.screenHeight / 15.12,
                                width: SizeConfig.screenWidth / 7.2,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/vo_luyen_dinh_phong/848597.png'))),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  height: SizeConfig.screenHeight / 75.6,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  margin:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 18),
                  padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        icons.length,
                        (index) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () => navigatorKey.currentState!.push(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              listNavigator[index])),
                                  child: Row(
                                    children: [
                                      icons[index],
                                       SizedBox(
                                        width: SizeConfig.screenWidth / 18,
                                      ),
                                      Text(
                                        list[index],
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.5,
                                ),
                              ],
                            )),
                  ),
                ),
                 SizedBox(
                  height: SizeConfig.screenHeight / 75.6,
                ),
                CustomButton(
                    onPressed: () {
                      context.read<AuthenticationSerivce>().signOut();
                    },
                    text: 'Đăng xuất'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
