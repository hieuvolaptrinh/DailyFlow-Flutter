import 'package:bloc/bloc.dart';
import 'package:dailyflow/data/repository/authenticate_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticateRepository authenticateRepository;

  LoginCubit({required this.authenticateRepository})
    : super(const LoginState());

  Future<void> login(String email, String password) async {
    // copyWith() giúp tạo state mới từ state cũ
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      // Gọi repository để login với Firebase
      await authenticateRepository.logInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Nếu thành công, emit state success
      emit(
        state.copyWith(
          status: LoginStatus.success,
          message: 'Login successful!',
        ),
      );
    } catch (e) {
      // Nếu có lỗi, emit state failure
      emit(state.copyWith(status: LoginStatus.failure, message: e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      // Gọi repository để login với Google
      await authenticateRepository.logInWithGoogle();

      // Nếu thành công
      emit(
        state.copyWith(
          status: LoginStatus.success,
          message: 'Google login successful!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          message: 'Google login failed: ${e.toString()}',
        ),
      );
    }
  }

  void resetState() {
    emit(const LoginState());
  }
}
