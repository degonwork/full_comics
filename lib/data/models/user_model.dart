
// }
// class UserModel{
//   UserModel({
//     required this.id,
//     required this.email,
//     required this.password,
//   });
//   final String id;
//   final String email;
//   final String password;
//   factory UserModel.fromJson(Map<String,dynamic> json) => UserModel(
//     id: json['id'],
//     email: json['email'],
//     password: json['password'],
//   );
//   Map<String, dynamic> toJson() => {
//     'id':id,
//     'email':email,
//     'password':password,
//   };
// }
class UserModel {
  final int id;
  final String userName;
  final String email;
  final String password;
 UserModel({required this.id,required this.userName,required this.email,required this.password});
 factory UserModel.fromJson(Map<String, dynamic> jsonMap){
  final data = UserModel(
    id: jsonMap['id'], userName: jsonMap['userName'], email: jsonMap['email'], password: jsonMap['password']);
    return data;
 }
}