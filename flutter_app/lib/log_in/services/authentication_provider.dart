import "package:firebase_auth/firebase_auth.dart";

abstract class AuthenticationProvider {
  Future<UserCredential> signIn();
  Future signOut();
}
