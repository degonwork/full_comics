// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:full_comics/widget/change_avatar/change_avatar_state.dart';
// import 'package:image_picker/image_picker.dart';

// class ChangeAvatarCubit extends Cubit<ChangeAvatarState> {
//   final _imagePicker = ImagePicker();
  
//    ChangeAvatarCubit() : super(const ChangeAvatarState());
//    onChangeAvatar(ImageSource imageSource, String avatarPath)async {
//     final pickedImage = await _imagePicker.pickImage(source: imageSource);
//     emit(state.copyWith(
//         imageSource: imageSource,
//         avatarPath: pickedImage!.path,
//     ));
//    }
//    onSave(Function buttonSave) async{
//     emit(state.copyWith(buttonSave: buttonSave));
//    }
// }