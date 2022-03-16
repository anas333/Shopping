import 'package:firebase_auth/firebase_auth.dart';

class Authenticatoin {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future signin() async {
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      dynamic user = userCredential;

      return user;
    } catch (e) {
      throw Exception();
    }
  }
}
