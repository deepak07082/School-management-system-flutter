import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth_Service {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlesignin = GoogleSignIn();

  void googlesignin() async {
    final GoogleSignInAccount googleuser = await _googlesignin.signIn();
    final GoogleSignInAuthentication authentication =
        await googleuser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken,
    );
    final User user =
        (await _firebaseAuth.signInWithCredential(credential).then((value) {
      print(value);
    }));
  }
}
