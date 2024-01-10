


import 'package:firebase_auth/firebase_auth.dart';


import 'package:expanse_manager/pages/authentication%20pages/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



Future<void> register() async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: Email.toString(),
      password: Password.toString(),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
void loginnotifier(){
  Fluttertoast.showToast(
      msg: 'Login Successfull',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      fontSize: 16,
      textColor: Colors.white);

}
void plsregister(){
  Fluttertoast.showToast(
      msg: 'Please Register',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      fontSize: 16,
      textColor: Colors.white);
}
void wrongpassword(){
  Fluttertoast.showToast(
      msg: 'Please Enter correct Password',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      fontSize: 16,
      textColor: Colors.white);
}


void alreadyinuse() {
  Fluttertoast.showToast(
      msg: 'Email already is use',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      fontSize: 16,
      textColor: Colors.white);
}

void errorwhilecreatinguser() {
  Fluttertoast.showToast(
      msg: 'Problem while creating an account',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      fontSize: 16,
      textColor: Colors.white);
}

void dynamictoast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      fontSize: 16,
      textColor: Colors.white);
}

void userexists() {
  Fluttertoast.showToast(
      msg: "User already exists",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      fontSize: 16,
      textColor: Colors.white);
}
void textfieldsempty() {
  Fluttertoast.showToast(
      msg: "Fill the textfields and then try registering",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      fontSize: 16,
      textColor: Colors.white);
}
