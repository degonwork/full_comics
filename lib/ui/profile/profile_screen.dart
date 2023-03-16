// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_bloc.dart';
import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_state.dart';
import 'package:full_comics/data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';

// import 'package:full_comics/main.dart';
// import 'package:full_comics/ui/login/cubit/login_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:full_comics/data/authentication_repository/authentication_repository.dart';
// import 'package:full_comics/ui/login/bloc/auth_bloc.dart';
// import 'package:full_comics/ui/login/bloc/auth_state.dart';
// import 'package:full_comics/ui/login/login_screen.dart';
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
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ],
                    // color: Colors.red,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox.square(
                            dimension: 70,
                            child: user.photo != null
                                ? Image.network(
                                    user.photo!,
                                    fit: BoxFit.cover,
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
                                            height: 140,
                                            width: 375,
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 20,
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
                                     
                                      backgroundImage: imageFile != null
                                          ? Image.file(File(imageFile!.path))
                                              .image
                                          : Image.asset(
                                                  'assets/vo_luyen_dinh_phong/person_icon.png')
                                              .image,
                                      backgroundColor: Colors.white,
                                      radius: 50,
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
                              const SizedBox(
                                height: 10,
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
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 100,
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
                              const Icon(Icons.card_giftcard, size: 50)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 100,
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
                              const Icon(
                                Icons.wallet_outlined,
                                size: 50,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      icons[index],
                                      const SizedBox(
                                        width: 20,
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
                const SizedBox(
                  height: 10,
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
