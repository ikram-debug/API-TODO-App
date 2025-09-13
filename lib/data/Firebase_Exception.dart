import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class FirebaseExceptions implements Exception {
  final String message;
  FirebaseExceptions(this.message);

  @override
  String toString() => message;

  /// Factory method to handle different errors
  factory FirebaseExceptions.handleException(dynamic e) {
    if (e is SocketException) {
      return FirebaseExceptions("No Internet Connection");
    } else if (e is FirebaseAuthException) {
      switch (e.code) {
        case "invalid-email":
          return FirebaseExceptions("The email address is badly formatted.");
        case "user-disabled":
          return FirebaseExceptions("This user has been disabled.");
        case "user-not-found":
          return FirebaseExceptions("No user found with this email.");
        case "wrong-password":
          return FirebaseExceptions("Incorrect password.");
        case "email-already-in-use":
          return FirebaseExceptions("This email is already in use.");
        case "weak-password":
          return FirebaseExceptions("Password is too weak.");
        case "operation-not-allowed":
          return FirebaseExceptions("Operation not allowed.");
        default:
          return FirebaseExceptions("Firebase Error: ${e.message}");
      }
    } else {
      return FirebaseExceptions("Unexpected error: $e");
    }
  }
}
