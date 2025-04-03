import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  //get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    //get current user
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }

  //sign-in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    //try sign-in user
    try{
      //sign user in
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email,
            password: password
        );
    return userCredential;
  }
  //catch any error
  on FirebaseAuthException catch (e){
    throw Exception(e.code);
    }
}

  //sing up

  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    //try sign-up user
    try{
      //sign user up
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    }
    //catch any error
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  //sign-out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

}