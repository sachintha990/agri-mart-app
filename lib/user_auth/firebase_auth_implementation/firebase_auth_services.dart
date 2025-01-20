import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        return credential.user!;
      } else {
        throw Exception("User is null");
      }
    } catch (e) {
      // ignore: avoid_print
      print("Some error occured");
    }
    return null;
  }

  Future<User?> signINWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        return credential.user!;
      } else {
        throw Exception("User is null");
      }
    } catch (e) {
      // ignore: avoid_print
      print("Some error occured");
    }
    return null;
  }
}
