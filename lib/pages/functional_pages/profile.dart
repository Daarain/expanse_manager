import 'package:expanse_manager/data/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final dataprovider1 = Provider.of<dataprovider>(context);
    final username = dataprovider1.Username;
    final password = dataprovider1.Password;
    final Email= dataprovider1.Email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.03),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                // alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width * 0.6,

                // color: Colors.yellow,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "Assets/image/profile.png",
                    scale: 1,
                  ),
                ),
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.01),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                      fontWeight: FontWeight.bold),
                )),
            Gap(MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: EdgeInsets.only(left: 1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(20)),

                child: Row(
                  children: [
                    Gap(MediaQuery.of(context).size.width * 0.07),
                    Text(
                      "Username:-$username",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                  ],
                ),
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.03),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20)),

              child: Row(
                children: [
                  Gap(MediaQuery.of(context).size.width * 0.07),
                  Text(
                    "E-mail:-$Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
