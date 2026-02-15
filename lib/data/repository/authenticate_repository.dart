import 'package:dailyflow/data/data_source/firebase_auth_service.dart';

abstract class AuthenticateRepository {
  Future<void> logInWithEmailAndPassword({String? email, String? password});
  Future<void> logInWithGoogle();
}

class AuthenticateRepositoryImpl implements AuthenticateRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthenticateRepositoryImpl({required this.firebaseAuthService});
  @override
  Future<void> logInWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    try {
      await firebaseAuthService.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      await firebaseAuthService.logInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }
}
