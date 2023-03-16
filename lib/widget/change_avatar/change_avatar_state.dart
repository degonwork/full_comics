// import 'package:equatable/equatable.dart';
// import 'package:image_picker/image_picker.dart';

// class ChangeAvatarState extends Equatable{
//   const   ChangeAvatarState({ this.imageSource, this.avatarPath, this.buttonSave});
//   final ImageSource? imageSource;
//   final String? avatarPath;
//   final Function? buttonSave;
//   ChangeAvatarState copyWith({
//     ImageSource? imageSource,
//     String? avatarPath,
//     Function? buttonSave,
//   }){
//     return  ChangeAvatarState(
//       imageSource : imageSource ?? this.imageSource,
//       avatarPath : avatarPath ?? this.avatarPath,
//       buttonSave : buttonSave ?? this.buttonSave,
//       );
//   }
//   @override
//   List<Object?> get props => [imageSource,avatarPath,buttonSave];
// }