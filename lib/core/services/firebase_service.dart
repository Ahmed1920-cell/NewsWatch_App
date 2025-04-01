import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseService{
  FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  FirebaseService(this._auth,this._googleSignIn);


  Future<User?> signInWithGoogle() async {
    try {

      var googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }


      final  google_Auth = await googleUser.authentication;


      final  credential = GoogleAuthProvider.credential(
        accessToken: google_Auth.accessToken,
        idToken: google_Auth.idToken,
      );


      final  userCredential = await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      return user;
    } catch (e) {
      throw "Error signing in with Google: $e";

    }
  }

  //Login
  Future login({required String email, required String password}) async{
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = credential.user;
    return user;
  }

  ////Sign Up
  Future register(String UserName,String email, String password, String phone) async{
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

        User? user = credential.user;
        if(user!=null){
          await user.updateDisplayName(UserName);
          await user.reload();
          user=await _auth.currentUser;
          return user;
        }
    }on FirebaseAuthException catch (e){

      if (e.code == 'invalid-email') {
        throw Exception('Invalid email');
      }
      if (e.code == 'email-already-in-use') {
        throw Exception('Hi, User not found');
      } else if (e.code == 'weak-password') {
        throw Exception ( "Your password is weak");
      }
      else{
        throw Exception("email and password are not correct");
      }
    }
  }

  //Load User
  Future Reload() async{
    try {
      User? user=await _auth.currentUser;
      await user!.reload();
      user=await _auth.currentUser;
      return user;
    }catch(e){
      throw "Check your internet";
    }
  }


//Sign Out
  Future sign_out() async {
    try{
      await _auth.signOut();
    }catch(e){
      throw Exception("Try Again");
    }
  }

  //Check user
  Future<User?> getUser()  async{
      return await _auth.currentUser;
  }


}