
import 'package:equatable/equatable.dart';
enum SignUpStatus {initial,loading,success,failure}
class SignUpState extends Equatable{
  final SignUpStatus status;
  final String email;
  final String password;
  final String confirmPassword;
  final String? errorMessage;
  const SignUpState({
    this.status = SignUpStatus.initial,
    this.errorMessage,
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
  });
  SignUpState copyWith({
    SignUpStatus? status,
    String? errorMessage,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return  SignUpState(
       status:status ?? this.status,
       errorMessage: errorMessage ?? this.errorMessage,
       email: email ?? this.email,
       password: password ?? this.password,
       confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
  @override
  List<Object?> get props => [status,email,password,errorMessage,confirmPassword];
}
