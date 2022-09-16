import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_app/common/view_model.dart";
import "package:flutter_app/log_in/services/authentication_provider.dart";

class UserModel extends ViewModel {
  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<User> signIn(AuthenticationProvider provider) async {
    try {
      loading = true;
      notifyListeners();
      await provider.signIn();

      return currentUser!;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future signOut(AuthenticationProvider provider) async {
    await provider.signOut();
    notifyListeners();
  }
}
