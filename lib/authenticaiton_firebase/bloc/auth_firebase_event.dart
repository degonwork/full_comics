import 'package:equatable/equatable.dart';
import 'package:full_comics/data/models/service_models/user.dart';

class AuthFirebaseEvent extends Equatable{
  const AuthFirebaseEvent();
  @override
  List<Object> get props => [];
}
class UserFirebaseChanged extends AuthFirebaseEvent{
  final User user;
  const UserFirebaseChanged(this.user);
}

class UserFirebaseLogout extends AuthFirebaseEvent{}