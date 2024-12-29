import 'package:devmaters_delivery/Views/pages/homepage/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;




  Future<void> login(String email,String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email:email,
        password:password,
      );
      Get.snackbar("Success", "Login Successful");
      Get.to(Homepage());

    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
      Get.snackbar("Error", "$errorMessage");
      print(errorMessage);

    }
  }

  // Function to handle registration
  Future<void> register(String email,String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Registration Successful");
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists for that email.';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
      Get.snackbar("Error", "$errorMessage");
    }
  }




}