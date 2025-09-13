import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/data/Firebase_Exception.dart';

class AuthServices {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //SignUP
  Future<User?> signUp(String email, String password) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      ).timeout(Duration(seconds: 10));
      return userCredential.user;
    } catch (e){
      throw FirebaseExceptions.handleException(e);
    }
  }

  //Login
  Future<User?> login(String email, String password ) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).timeout(Duration(seconds: 10));
      return userCredential.user;
    } catch (e) {
      throw FirebaseExceptions.handleException(e);
    }
  }

  //Logout
 Future<void> logout() async {
    try{
      await _auth.signOut().timeout(Duration(seconds: 10));
    } catch (e) {
      throw FirebaseExceptions.handleException(e);
    }
 }

 //current user
 User? getcurrentuser() {
    return _auth.currentUser;
 }

}