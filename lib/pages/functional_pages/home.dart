
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

List<ListTile> listTiles = [];
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.pushNamed(context, 'ae');
        },
        child: Icon(Icons.add),
      ),
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
          ),
          leadingWidth: MediaQuery.of(context).size.width * 0.06,
          title: Text(
            "Dashboard",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.03),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width * 0.1,
              child: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, "profile");
                },
                  icon: Image.asset("Assets/image/Github.png"),),
            ),
            IconButton(onPressed: (){
            logout();
            }, icon: Icon(Icons.logout_outlined,color: Colors.black,))
          ],
        ),
        body: Column(
          children: [
            Gap(
              MediaQuery.of(context).size.height*0.02
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.1 ,

                    top:MediaQuery.of(context).size.height*0.01 ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                      spreadRadius: 3,
                      offset: Offset(5,5)
                    )
                  ],
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.07),
                    color: Colors.black),
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.83,
                child: Row(

                  children: [
                    Text("Rs ",
                    style: TextStyle(
                     color: Colors.white,
                    fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.035),
                    ),

                    Text(
                      " XXXXX",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.045),
                    ),
                  ],
                ),
              ),
            ),
            Gap(
                MediaQuery.of(context).size.height*0.02
            ),
           Container(
             // color: Colors.yellow,
             width: MediaQuery.of(context).size.width*0.9,
             child: Text("All Expenses",style: GoogleFonts.akshar(fontWeight: FontWeight.bold,color: Colors.black,fontSize: MediaQuery.of(context).size.height*0.024),),
           ),


            Container(
           //   color: Colors.red,
              height: MediaQuery.of(context).size.height*0.65,
              child:  SingleChildScrollView(
                child:Text("Place for listview")
              )
            )



          ],
        ));
  }
  Future<void> logout() async {


    await FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(context, 'landingpage');

  }
}
