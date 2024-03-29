import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:full_comics/data/authentication_repository/authentication_repository.dart';
import 'package:full_comics/data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';
import 'package:full_comics/data/models/validation_bloc/validation_bloc.dart';
import 'package:full_comics/main.dart';
import 'package:full_comics/root_app/root_app.dart';
// import 'package:full_comics/ui/home/home_screen.dart';
import 'package:full_comics/ui/sign_up_screen/cubit/sign_up_cubit.dart';
import 'package:full_comics/ui/sign_up_screen/cubit/sign_up_state.dart';
import 'package:full_comics/widget/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static MaterialPage page() {
    return const MaterialPage(
      child: SignUpForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(context.read<AuthenticationSerivce>()),
      child: const SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey  _formKey2 = GlobalKey();
  // final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool passToggle = true;
  // final ValidationBloc _validationBloc = ValidationBloc();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status == SignUpStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
        }
      },
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
          padding: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          navigatorKey.currentState!.pop(context);
                        },
                        child: const Text(
                          'Quay lại',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ),
                const Center(
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/vo_luyen_dinh_phong/unnamed.png'),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                    key: _formKey2,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 15),
                          //   child: TextFormField(
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     textInputAction: TextInputAction.next,
                          //     validator: (value) {
                          //       if (value!.isEmpty) {
                          //         return "Tên đăng nhập phải có ít nhất 6 ký tự";
                          //       }
                          //       return null;
                          //     },
                          //     controller: userName,
                          //     decoration: InputDecoration(
                          //         prefixIcon: const Icon(
                          //           Icons.person,
                          //           color: Colors.black,
                          //         ),
                          //         hintText: 'Tên đăng nhập',
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(20))),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: TextFormField(
                              onChanged:
                                  context.read<SignUpCubit>().onEmailChanged,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Vui lòng điền email của bạn";
                                }
                                return null;
                              },
                              controller: email,
                              decoration: InputDecoration(
                                  // errorText: snapshot.hasError
                                  //     ? snapshot.error.toString()
                                  //     : null,
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: TextFormField(
                              onChanged:
                                  context.read<SignUpCubit>().onPasswordChanged,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Mật khẩu không được để trống";
                                }
                                return null;
                              },
                              obscureText: passToggle,
                              controller: password,
                              decoration: InputDecoration(
                                  // errorText: snapshot.hasError
                                  //     ? snapshot.error.toString()
                                  //     : null,
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passToggle = !passToggle;
                                      });
                                    },
                                    child: Icon(passToggle
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Mật khẩu',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: TextFormField(
                              onChanged: context.read<SignUpCubit>().onPasswordChanged,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Mật khẩu không được để trống";
                                }
                                return null;
                              },
                              obscureText: passToggle,
                              controller: confirmPassword,
                              decoration: InputDecoration(
                                  // errorText: snapshot.hasError
                                  //     ? snapshot.error.toString()
                                  //     : null,
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passToggle = !passToggle;
                                      });
                                    },
                                    child: Icon(passToggle
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Nhập lại mật khẩu',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            onPressed: () {
                              // if (_formKey2.currentState!.validate()) {
                              //   context.read<SignUpCubit>().onSignUpEmailAndPassword();
                              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(

                              //   content: Text("Đăng ký thành công",style: TextStyle(
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.normal,
                              //   ),)));
                              // }
                              context
                                  .read<SignUpCubit>()
                                  .onSignUpEmailAndPassword();
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                
                                content: Text("Đăng ký thành công",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),)));
                             
                            },
                            text: "Đăng ký",
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
