// import 'package:formz/formz.dart';

// enum PasswordValidtionError{invalid}
// class Password extends FormzInput<String, PasswordValidtionError> {
//   const Password.pure() : super.pure('value');
//   const Password.dirty([super.value = '']) : super.dirty();
//   static final _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
//   @override
//   PasswordValidtionError? validator(String? value){
//     return _passwordRegExp.hasMatch(value ?? '') ? null : PasswordValidtionError.invalid;
//   }
// }