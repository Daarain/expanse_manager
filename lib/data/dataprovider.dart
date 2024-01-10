import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dataprovider extends ChangeNotifier{

late String? Username;
late String? Email;
late String? Password;


void setdata(String username,String email,String password){
Username=username;
Email=email;
Password=password;
}

String? get username=>Username;
String? get email=>Email;
String? get password=>Password;


Future<void> loadUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Username = prefs.getString('username');
  notifyListeners();
}

Future<void> setUser(String username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Username = username;
  prefs.setString('username', username);
  notifyListeners();
}

Future<void> clearUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Username = null;
  prefs.remove('username');
  notifyListeners();
}


Future<void> loademail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Email = prefs.getString('email');
  notifyListeners();
}

Future<void> setemail(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Email = email;
  prefs.setString('email', email);
  notifyListeners();
}

Future<void> clearemail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Email = null;
  prefs.remove('email');
  notifyListeners();
}









}