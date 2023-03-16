// Thêm thư viện equatable
import 'package:equatable/equatable.dart';

class User extends Equatable {
	// uid của người dùng
  final String? id;
	// tên người dùng nếu có
  final String? name;
	// email người dùng nếu có
  final String? email;
	// ảnh người dùng nếu có
  final String? photo;

  const User({
     this.id,
    this.name,
    this.email,
    this.photo,
  });
	// tạo người dùng trống, khi chưa xác thực,
	// object này sẽ dược trả về
  static User empty() => const User();
	
	// Kiểm tra user hiện tại có trống hay không
  bool get isEmpty => this == empty();
	
  bool get isNotEmpty => !isEmpty;
	
	// Phương thức ghi đè bắt buộc của Equatable
  @override
  List<Object?> get props => [id, name, email, photo];
}