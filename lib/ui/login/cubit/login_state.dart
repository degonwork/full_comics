part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;
  final String email;
  final String password;

  const LoginState({
    this.errorMessage,
    this.email = "",
    this.password = "",
    this.status = LoginStatus.initial,
  });

  LoginState copyWith(
      {String? errorMessage,
      String? email,
      String? password,
      LoginStatus? status}) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, email, password];
}