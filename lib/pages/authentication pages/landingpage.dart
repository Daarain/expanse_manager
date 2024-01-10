import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class landingpage extends StatefulWidget {
  const landingpage({super.key});

  @override
  State<landingpage> createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
             // color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset(
                  "Assets/image/Ip.png",
                  scale: .5,
                )),
            Gap(MediaQuery.of(context).size.height * 0.03),
            Container(
              child: Text(
                "Budget Buddy",
                style: GoogleFonts.sahitya(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.height * 0.05),
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.07),
            Container(
              // padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,

              // color: Colors.yellow,
              child: Text(
                "Budgeting Made Beautiful.BudgetBuddy Delivers Precision and Style to Your Finances.Uncover Opportunities,Realize Savings",
                style: GoogleFonts.acme(
                  color: Colors.white70,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.07),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: Colors.white30 ,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "login");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.width * 0.05 ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.1)),
                          backgroundColor: Colors.white),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "register");
                      },
                      child: Text(
                        "Sign-up",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.1)),
                          backgroundColor: Colors.transparent,
                          elevation: 0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
