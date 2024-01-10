import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expanse_manager/data/dataprovider.dart';
import 'package:expanse_manager/pages/authentication%20pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class addexpanse extends StatefulWidget {
  const addexpanse({super.key});

  @override
  State<addexpanse> createState() => _addexpanseState();
}

TextEditingController amount = TextEditingController();
TextEditingController expanse = TextEditingController();
TextEditingController description = TextEditingController();

class _addexpanseState extends State<addexpanse> {
  @override
  Widget build(BuildContext context) {
    final dataprovider1 = Provider.of<dataprovider>(context);
    final username = dataprovider1.Username;
    void addexpanse() {
      try {
        FirebaseFirestore.instance
            .collection("Users")
            .doc(username)
            .collection("transactions")
            .doc("transactions")
            .set({
          "Expanse": amount.text.toString(),
          "amount": expanse.text.toString(),
          "description": description.text.toString()
        });
        expanse.clear();
        amount.clear();
        description.clear();
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'hp');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Amount",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.03),
        ),
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.25,
        child: FloatingActionButton(
          onPressed: () {
            addexpanse();
          },
          backgroundColor: Colors.black,
          child: Text("Enter",
              style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Gap(MediaQuery.of(context).size.height * 0.05),
            Container(
              width: MediaQuery.of(context).size.width * 0.84,
              height: MediaQuery.of(context).size.height * 0.1,
              // color: Colors.yellow,
              child: TextField(
                  controller: amount,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.currency_rupee,
                        color: Colors.black,
                      ),
                      labelText: "Amount",
                      hintText: "Enter the amount",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.025,
                          horizontal:
                              MediaQuery.of(context).size.height * 0.03),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3))),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ]),
            ),
            Gap(MediaQuery.of(context).size.height * 0.02),
            Container(
              width: MediaQuery.of(context).size.width * 0.84,
              height: MediaQuery.of(context).size.height * 0.1,
              // color: Colors.yellow,
              child: TextField(
                controller: expanse,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.book,
                      color: Colors.black,
                    ),
                    labelText: "Expanse",
                    hintText: "Expanse made for",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.025,
                        horizontal: MediaQuery.of(context).size.height * 0.03),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3))),
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.02),
            Container(
              width: MediaQuery.of(context).size.width * 0.84,
              height: MediaQuery.of(context).size.height * 0.1,
              // color: Colors.yellow,
              child: TextField(
                controller: description,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.description,
                      color: Colors.black,
                    ),
                    labelText: "Description",
                    hintText: "Description of the expanse",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.025,
                        horizontal: MediaQuery.of(context).size.height * 0.03),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
