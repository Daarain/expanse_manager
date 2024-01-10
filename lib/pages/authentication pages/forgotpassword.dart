import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController Email=TextEditingController();
class fp extends StatefulWidget {
  const fp({super.key});

  @override
  State<fp> createState() => _fpState();
}

class _fpState extends State<fp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.017),
        child: Column(
          children: [
            Gap(MediaQuery.of(context).size.height * 0.02),
            Container(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 1,
              child: Text(
                "Forgot \nPassword?",
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
            Gap(MediaQuery.of(context).size.height * 0.1),
            Container(
              width: MediaQuery.of(context).size.width * 0.93,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                     resetpassword();
                },
                child: Text(
                  "Send Mail",
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


          ],
        ),
      ),

    );
  }
  Future<void> resetpassword() async {

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: Email.text.toString());

  }


}
