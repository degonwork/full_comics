import 'package:equatable/equatable.dart';
import 'package:full_comics/data/models/service_models/user.dart';



enum AppStatus {
  authenticated,
  unauthenticated,
}

class AuthFirebaseState extends Equatable {
  final AppStatus status;
  final User user;

  const AuthFirebaseState._({required this.status, this.user = const User()});

  const AuthFirebaseState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AuthFirebaseState.authenticated({required User user})
      : this._(status: AppStatus.authenticated, user: user);

  @override
  List<Object?> get props => [status, user];
}