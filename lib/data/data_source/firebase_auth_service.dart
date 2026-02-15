import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> logInWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      // Bắt đầu quá trình đăng nhập Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // Người dùng hủy đăng nhập
        throw Exception('Google sign-in was cancelled');
      }

      // Lấy authentication details từ request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Tạo credentials mới
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Đăng nhập vào Firebase với credentials
      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }
}
