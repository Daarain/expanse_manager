import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expanse_manager/data/dataprovider.dart';
import 'package:expanse_manager/pages/methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}


TextEditingController Email=TextEditingController();
TextEditingController Password=TextEditingController();
TextEditingController Username=TextEditingController();
bool _obscureText=true;


class _registerState extends State<register> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: (){Navigator.pushNamed(context, "landingpage");
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      body: Container(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.017),
        color: Colors.transparent,
        child: Column(children: [
          Gap(MediaQuery.of(context).size.height * 0.02),
          Container(
            // color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            child: Text(
              "Ready to get started?\nSign-Up now!",
              style: GoogleFonts.rubik(
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          Gap(MediaQuery.of(context).size.height * 0.07),
          Container(
            width: MediaQuery.of(context).size.width * 0.94,
            height: MediaQuery.of(context).size.height * 0.08,
            //color: Colors.yellow,
            child: TextField(
              controller:Username ,
              style: TextStyle(color: Colors.grey.shade400),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade900,
                  prefixIcon: Icon(
                    Icons.supervised_user_circle_sharp,
                    color: Colors.grey,
                  ),
                  labelText: "Username",
                  hintText: "Enter Username",
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: MediaQuery.of(context).size.height * 0.018),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.025,
                      horizontal: MediaQuery.of(context).size.width * 0.025),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.84),
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                        width: 3,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.84),
                      borderSide:
                      BorderSide(color: Colors.grey.shade600, width: 3))),
            ),
          ),
          Gap(MediaQuery.of(context).size.width * 0.02),
          Container(
            width: MediaQuery.of(context).size.width * 0.94,
            height: MediaQuery.of(context).size.height * 0.08,
            //color: Colors.yellow,
            child: TextField(
              controller:Email ,
              style: TextStyle(color: Colors.grey.shade400),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade900,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  labelText: "E-mail",
                  hintText: "Enter E-mail",
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: MediaQuery.of(context).size.height * 0.018),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.025,
                      horizontal: MediaQuery.of(context).size.width * 0.025),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.84),
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                        width: 3,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.84),
                      borderSide:
                      BorderSide(color: Colors.grey.shade600, width: 3))),
            ),
          ),
          Gap(MediaQuery.of(context).size.width * 0.02),
          Container(
            width: MediaQuery.of(context).size.width * 0.94,
            height: MediaQuery.of(context).size.height * 0.09,
            // color: Colors.yellow,
            child: TextField(
              controller:Password ,
              obscureText: _obscureText,
              style: TextStyle(color: Colors.grey.shade400),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade900,
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.grey,
                 ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  labelText: "Password",
                  hintText: "Enter Password",
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: MediaQuery.of(context).size.height * 0.018),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.025,
                      horizontal: MediaQuery.of(context).size.width * 0.025),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.84),
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                        width: 3,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.84),
                      borderSide:
                      BorderSide(color: Colors.grey.shade600, width: 3))),
            ),
          ),
          Gap(MediaQuery.of(context).size.width * 0.1),
          Container(
            width: MediaQuery.of(context).size.width * 0.93,
            height: MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
              onPressed: () {
                register();

              },
              child: Text(
                "Sign-Up",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.3)),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Gap(MediaQuery.of(context).size.width * 0.05),
          Container(
            child: Text(
              "or continue with",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),
          Gap(MediaQuery.of(context).size.width * 0.05),
          Container(
            width: MediaQuery.of(context).size.width * 0.93,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade600, width: 3),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.2),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.2),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset("Assets/image/google.png",scale: 2,),
                    onPressed: () {},
                  ),
                  Text("Google")
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account",style: TextStyle(
                    color: Colors.grey.shade600
                ),),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, "login");
                }, child: Text("Login",style: TextStyle(
                    color: Colors.grey.shade300
                ),))
              ],
            ),
          )




        ],),
      ),
    );
  }
  Future<void> register() async {
    try {
      // final usernameExists = await doesUsernameExist();
      final usernameExists = await doesUsernameExist();
      final emailExists = await doesEmailExist();
      if (Email.text.isEmpty || Password.text.isEmpty || Username.text.isEmpty) {
        // Handle the case where any field is empty, show a message or prevent registration
        textfieldsempty();
        return;
      }else{
      if (usernameExists || emailExists) {
        // Username or email already exists. Handle this case.
        userexists();
        return;
      }else{
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: Email.text.toString(),
            password: Password.text.toString()
        );
        // if(){}
        Provider.of<dataprovider>(context, listen: false).setUser(Email.text.toString());

        FirebaseFirestore.instance.collection("Users").doc(Username.text.toString()).set(
            {
              "Email":Email.text.toString(),
              "Password":Password.text.toString(),
              "Username":Username.text.toString()
            }
        );
        Navigator.pushNamed(context, "login");
        if(userCredential.user!=null){
          User? user=userCredential.user;
          dynamictoast('Account created with the email:-${user?.email}');

        }else{
          errorwhilecreatinguser();
        }

      }}







    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        alreadyinuse();
      }
    } catch (e) {
      print(e);
    }
  }
  Future<bool> doesUsernameExist() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .where("Username", isEqualTo: Username.text.toString())
          .get();

    return querySnapshot.docs.isNotEmpty;
  }

// Helper function to check if an email already exists in Firestore.
  Future<bool> doesEmailExist() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .where("Email", isEqualTo: Email.text.toString())
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
}
