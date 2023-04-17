


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/config/size_config.dart';
// import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_bloc.dart';
// import 'package:full_comics/authenticaiton_firebase/bloc/auth_firebase_state.dart';
import 'package:full_comics/data/models/service_models/auth_firebase_model-service/authentication_firebase.dart';
// import 'package:full_comics/data/models/validation_bloc/validation_bloc.dart';
// import 'package:full_comics/data/authentication_repository/authentication_repository.dart';

import 'package:full_comics/ui/login/bloc/auth_event.dart';
// import 'package:full_comics/ui/home/home_screen.dart';
// import 'package:full_comics/ui/library/library_screen.dart';
// import 'package:full_comics/ui/login/bloc/auth_bloc.dart';
// import 'package:full_comics/ui/login/bloc/auth_event.dart';
// import 'package:full_comics/ui/login/bloc/auth_state.dart';
import 'package:full_comics/ui/login/cubit/login_cubit.dart';
import 'package:full_comics/ui/sign_up_screen/sign_up_screen.dart';
import 'package:full_comics/widget/custom_button.dart';

// import 'package:full_comics/widget/custom_textfield.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../authenticaiton_firebase/bloc/auth_firebase_bloc.dart';
import 'bloc/auth_bloc.dart';

// import 'package:path/path.dart';
// import 'package:flutter/src/widgets/framework.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static MaterialPage page() {
    return const MaterialPage(
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(context.read<AuthenticationSerivce>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Error')),
              );
          }
        },
        child: const LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthBloc? _authBloc;
  //  AuthenticationSerivce? _authenticationSerivce;
  //  AppBloc? _appBloc;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool passToggle = true;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? account;
  // ValidationBloc _validationBloc = ValidationBloc();

  @override
  void initState() {
    super.initState();
    // _validationBloc = ValidationBloc();
    // _appBloc = BlocProvider.of<AppBloc>(context);
    // _authWithGoogle(context);
    // _authenticationSerivce = AuthenticationSerivce();
    _authBloc = BlocProvider.of(context);
    // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
    //   setState(() {
    //     this.account = account;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.cyan,
              Colors.indigo,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          padding:  EdgeInsets.only(
            top: SizeConfig.screenHeight / 75.6,
            left: SizeConfig.screenWidth / 24,
            right: SizeConfig.screenWidth / 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              verticalDirection: VerticalDirection.down,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // navigatorKey.currentState!.popAndPushNamed('$RootApp');
                      },
                      child: const Text(
                        'Quay lại',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Đăng nhập ',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                       SizedBox(
                        height: SizeConfig.screenHeight / 75.6 ,
                      ),
                      SizedBox(
                        width: SizeConfig.screenHeight * 0.132,
                        height: SizeConfig.screenWidth / 3.6,
                        child: Image.asset(
                            'assets/vo_luyen_dinh_phong/unnamed.png'),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  height: SizeConfig.screenHeight / 75.6,
                ),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth / 36,
                              vertical: SizeConfig.screenHeight / 75.6,
                              ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Vui lòng điền email của bạn";
                              }
                              return null;
                            },
                            onChanged:
                                context.read<LoginCubit>().onEmailChanged,
                            controller: email,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'Tên đăng nhập/Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                         SizedBox(
                          height: SizeConfig.screenHeight / 75.6,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 36),
                          child: TextFormField(
                            onChanged:
                                context.read<LoginCubit>().onPasswordChanged,
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
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Quên mật khẩu ?',
                              style: TextStyle(color: Colors.yellow),
                            )),
                         SizedBox(
                          height: SizeConfig.screenHeight / 75.6,
                        ),
                        CustomButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                            context.read<LoginCubit>().state.status ==
                                    LoginStatus.loading
                                ? const CircularProgressIndicator()
                                : context
                                    .read<LoginCubit>()
                                    .onLoginWithEmailAndPasswordPressed();
                            _authBloc!.add(LoginEvent(
                                password: password.text, email: email.text));
                          
                            }
                          },
                        
                          text: 'Đăng nhập',
                        ),
                         SizedBox(
                          height: SizeConfig.screenHeight / 37.8,
                        ),
                        const Center(child: Text('Bạn có thể đăng nhập với')),
                         SizedBox(
                          height: SizeConfig.screenHeight / 75.6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth / 4.5,
                              height: SizeConfig.screenHeight / 9.45,
                              child: IconButton(
                                icon: Image.asset(
                                    'assets/vo_luyen_dinh_phong/google_PNG19635.png',
                                    fit: BoxFit.cover),
                                onPressed: () async{
                                 context.read<LoginCubit>().onLoginWithGoogle();
                                },
                              ),
                            ),
                             SizedBox(
                              width: SizeConfig.screenWidth / 36,
                            ),
                            IconButton(
                              iconSize: 50,
                              icon: const Icon(Icons.facebook_rounded),
                              onPressed: ()async {
                               context.read<LoginCubit>().onLoginWithFacebook();
                              },
                            ),
                          ],
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Bạn chưa có tài khoản ?'),
                               SizedBox(
                                width: SizeConfig.screenWidth / 36,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, PageRouteBuilder(
                                      transitionDuration: const Duration(milliseconds: 400),
                                      transitionsBuilder: (context,animation,secAnimation,child){
                                        return SlideTransition(
                                          position: Tween<Offset>(begin:const Offset(1, 0),end: Offset.zero).animate(animation),
                                          child: child,
                                          );
                                      },
                                      pageBuilder: (context,animation,secAnimation){
                                        return const SignUpScreen();
                                      }
                                      ));
                                  },
                                  child: const Text(
                                    'Đăng ký ngay',
                                    style: TextStyle(
                                      color: Colors.yellow,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
