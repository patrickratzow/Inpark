import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_app/log_in/services/authentication_provider.dart";
import "package:google_sign_in/google_sign_in.dart";

class GoogleAuthenticationProvider extends AuthenticationProvider {
  static final _instance = GoogleAuthenticationProvider._internal();

  factory GoogleAuthenticationProvider() => _instance;

  GoogleAuthenticationProvider._internal();

  @override
  Future<UserCredential> signIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
