import 'package:expanse_manager/data/dataprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


TextEditingController Email = TextEditingController();
TextEditingController Password = TextEditingController();
TextEditingController Username = TextEditingController();
bool _obscureText = true;


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}


class _loginState extends State<login> {

  void login ()async{

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Email.text.toString(),
          password: Password.text.toString()
      );
      Provider.of<dataprovider  >(context, listen: false).setUser(Email.text.toString());
      loginnotifier();


      Navigator.pushNamed(context, "hp");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        plsregister();

      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        wrongpassword();

      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Navigator.pushNamed(context, "hp");
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }




  @override
  Widget build(BuildContext context) {
    final dp1=Provider.of<dataprovider>(context,listen: false);
    dp1.setdata(Username.text.toString(), Email.text.toString(), Password.text.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pushReplacementNamed(context, "landingpage");
            },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.017),
        color: Colors.transparent,
        child: Column(
          children: [
            Gap(MediaQuery.of(context).size.height * 0.02),
            Container(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 1,
              child: Text(
                "Hey,\nWelcome\nBack",
                style: GoogleFonts.rubik(
                    fontSize: MediaQuery.of(context).size.height * 0.05,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.02),
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              height: MediaQuery.of(context).size.height * 0.08,
              //color: Colors.yellow,
              child: TextField(
                controller: Username,
                style: TextStyle(color: Colors.grey.shade400),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    prefixIcon: Icon(
                      Icons.email_outlined,
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
            Gap(MediaQuery.of(context).size.height * 0.01),
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              height: MediaQuery.of(context).size.height * 0.08,
              //color: Colors.yellow,
              child: TextField(
                controller: Email,
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
                controller: Password,
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
            Container(
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 1,
              // color: Colors.yellow,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "fp");
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: MediaQuery.of(context).size.height * 0.02),
                ),
              ),
            ),
            Gap(MediaQuery.of(context).size.width * 0.1),
            Container(
              width: MediaQuery.of(context).size.width * 0.93,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                child: Text(
                  "Login",
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
                onPressed: () {
                  signInWithGoogle();
                },
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
                  Text("Don't you have an Account",style: TextStyle(
                    color: Colors.grey.shade600
                  ),),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, "register");
                  }, child: Text("Sign-up",style: TextStyle(
                    color: Colors.grey.shade300
                  ),))
                ],
              ),
            )


          ],
        ),
      ),
    );
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

}
