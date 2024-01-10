// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAwwKwXwYkCBy6xtNIDgxZluMkRhlV5NF8',
    appId: '1:810780933333:web:58686502d65ba73139b65c',
    messagingSenderId: '810780933333',
    projectId: 'expansemanager-fd39b',
    authDomain: 'expansemanager-fd39b.firebaseapp.com',
    storageBucket: 'expansemanager-fd39b.appspot.com',
    measurementId: 'G-8RPG8HC30N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCS6H104aV-p1GOJEg0yd4pZnohP4BFY2M',
    appId: '1:810780933333:android:3de5c591f645056639b65c',
    messagingSenderId: '810780933333',
    projectId: 'expansemanager-fd39b',
    storageBucket: 'expansemanager-fd39b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXe0hgdK0AGLKPPX3b_XIz2_4EvfAoB2k',
    appId: '1:810780933333:ios:a17dd8324ee9b24739b65c',
    messagingSenderId: '810780933333',
    projectId: 'expansemanager-fd39b',
    storageBucket: 'expansemanager-fd39b.appspot.com',
    iosBundleId: 'com.example.expanseManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXe0hgdK0AGLKPPX3b_XIz2_4EvfAoB2k',
    appId: '1:810780933333:ios:d9ba102965240fc239b65c',
    messagingSenderId: '810780933333',
    projectId: 'expansemanager-fd39b',
    storageBucket: 'expansemanager-fd39b.appspot.com',
    iosBundleId: 'com.example.expanseManager.RunnerTests',
  );
}