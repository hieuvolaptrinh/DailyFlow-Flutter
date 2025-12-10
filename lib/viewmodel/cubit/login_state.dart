part of 'login_cubit.dart';

// Equatable giúp so sánh state dễ dàng hơn
// Cách đơn giản: 1 class duy nhất, dùng enum để phân biệt trạng thái

// Enum để định nghĩa các trạng thái
enum LoginStatus {
  initial, // Mới mở app
  loading, // Đang login
  success, // Thành công
  failure, // Thất bại
}

// 1 class State duy nhất cho tất cả trạng thái
class LoginState extends Equatable {
  final LoginStatus status; // Trạng thái hiện tại
  final String? message; // Thông báo (thành công/lỗi)

  const LoginState({this.status = LoginStatus.initial, this.message});

  // Hàm tiện ích để tạo state mới từ state cũ
  LoginState copyWith({LoginStatus? status, String? message}) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
