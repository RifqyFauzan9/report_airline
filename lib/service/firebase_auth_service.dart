import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;

  FirebaseAuthService(
      FirebaseAuth? auth,
      ) : _auth = auth ??= FirebaseAuth.instance;

  Future<UserCredential> signInUser(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result;
    } on FirebaseAuthException catch (e) {
      final errorMessage = switch (e.code) {
        "invalid-email" => "The email address is not valid.",
        "user-disabled" => "User disabled.",
        "user-not-found" => "No user found with this email.",
        "wrong-password" => "Wrong email/password combination.",
        'email_not_verified' => 'Email belum verified',
        _ => "Login failed. Please try again.",
      };
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw 'Logout failed. Please try again.';
    }
  }

  Future<User?> userChanges() => _auth.userChanges().first;
}
