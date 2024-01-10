import 'package:expanse_manager/data/dataprovider.dart';
import 'package:expanse_manager/firebase_options.dart';
import 'package:expanse_manager/pages/authentication%20pages/forgotpassword.dart';
import 'package:expanse_manager/pages/functional_pages/addexpansefile.dart';
import 'package:expanse_manager/pages/functional_pages/home.dart';
import 'package:expanse_manager/pages/authentication%20pages/landingpage.dart';
import 'package:expanse_manager/pages/authentication%20pages/login.dart';
import 'package:expanse_manager/pages/functional_pages/profile.dart';
import 'package:expanse_manager/pages/authentication%20pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => dataprovider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      "hp": (context) => home(),
      "ae": (context) => addexpanse(),
      "landingpage": (context) => landingpage(),
      "login": (context) => login(),
      "register": (context) => register(),
      'profile': (context) => profile(),
      "fp": (context) => fp()
    }, debugShowCheckedModeBanner: false, home: keepinguserloggedin());
  }
}

class keepinguserloggedin extends StatefulWidget {
  const keepinguserloggedin({super.key});

  @override
  State<keepinguserloggedin> createState() => _keepinguserloggedinState();
}

class _keepinguserloggedinState extends State<keepinguserloggedin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return home();
          } else {
            return landingpage();
          }
        },
      ),
    );
  }
}
