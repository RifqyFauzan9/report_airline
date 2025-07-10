import '../model/profile.dart';
import '../service/firebase_auth_service.dart';
import 'package:flutter/widgets.dart';

import '../static/firebase_auth_status.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  final FirebaseAuthService _service;

  FirebaseAuthProvider(this._service);

  String? _message;
  Profile? _profile;
  FirebaseAuthStatus _authStatus = FirebaseAuthStatus.unauthenticated;

  String? get message => _message;
  Profile? get profile => _profile;
  FirebaseAuthStatus? get authStatus => _authStatus;

  Future signInUser(String email, String password) async {
    try {
      _authStatus = FirebaseAuthStatus.authenticating;
      notifyListeners();

      final result = await _service.signInUser(email, password);
      final user = result.user;

        if (user != null) {
          _profile = Profile(
            uid: user.uid,
            displayName: user.displayName,
            email: user.email,
            photoUrl: user.photoURL,
          );

          _authStatus = FirebaseAuthStatus.authenticated;
          _message = 'Sign in Success';
        } else {
          _authStatus = FirebaseAuthStatus.error;
          _message = 'User data not found in Firestore.';
        }

    } catch (e) {
      _message = e.toString();
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }


  Future signOutUser() async {
    try {
      _authStatus = FirebaseAuthStatus.signingOut;
      notifyListeners();

      await _service.signOut();

      _authStatus = FirebaseAuthStatus.unauthenticated;
      _message = 'Sign out success';
    } catch (e) {
      _message = e.toString();
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }

  Future updateProfile(BuildContext context) async {
    final user = await _service.userChanges();
    if (user != null) {
      _profile = Profile(
        uid: user.uid,
        displayName: user.displayName,
        email: user.email,
        photoUrl: user.photoURL,
      );
    }
    notifyListeners();
  }
}