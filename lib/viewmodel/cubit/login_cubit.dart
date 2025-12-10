import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String email, String password) async {
    // copyWith() giúp tạo state mới từ state cũ
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 2));
      // Giả lập login thành công
      if (email == 'admin' && password == '123456') {
        emit(
          state.copyWith(
            status: LoginStatus.success,
            message: 'Login successful!',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            message: 'Invalid email or password',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          message: 'An error occurred: ${e.toString()}',
        ),
      );
    }
  }

  void resetState() {
    emit(const LoginState());
  }
}
