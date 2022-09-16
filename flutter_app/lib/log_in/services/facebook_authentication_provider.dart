import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_app/log_in/services/authentication_provider.dart";
import "package:flutter_facebook_auth/flutter_facebook_auth.dart";

class FacebookAuthenticationProvider extends AuthenticationProvider {
  static final _instance = FacebookAuthenticationProvider._internal();

  factory FacebookAuthenticationProvider() => _instance;

  FacebookAuthenticationProvider._internal();

  @override
  Future<UserCredential> signIn() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  @override
  Future signOut() async {
    // TODO: implement signOut
    return await FirebaseAuth.instance.signOut();
  }
}
