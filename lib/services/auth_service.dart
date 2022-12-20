import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String?> signIn(String email, String password) async {
    try {
     await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Logged Successfully";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(String mobileNo, String password) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: mobileNo, password: password);
      return "Logged Successfully";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logout() async {
   await _firebaseAuth.signOut();
  }
}
