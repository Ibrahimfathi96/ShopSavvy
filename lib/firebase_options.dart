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
    apiKey: 'AIzaSyCXmPG-mmm-iNk-cdPb7I0_SDodH32UitQ',
    appId: '1:516437365566:web:4eb63731ff5c339c7f126f',
    messagingSenderId: '516437365566',
    projectId: 'shopsavvy-b9b62',
    authDomain: 'shopsavvy-b9b62.firebaseapp.com',
    storageBucket: 'shopsavvy-b9b62.appspot.com',
    measurementId: 'G-BHLZFPLQRP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEzwzDrrhBI08Kts5y7m90gNZuRwPdNr8',
    appId: '1:516437365566:android:3cb5fcd61f7318e07f126f',
    messagingSenderId: '516437365566',
    projectId: 'shopsavvy-b9b62',
    storageBucket: 'shopsavvy-b9b62.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ73hdLjULVthCEn-nSeXtLegFK-M81og',
    appId: '1:516437365566:ios:25a7000fa7360c747f126f',
    messagingSenderId: '516437365566',
    projectId: 'shopsavvy-b9b62',
    storageBucket: 'shopsavvy-b9b62.appspot.com',
    iosClientId: '516437365566-5dd0g4fso49rb94nafdh1c8gudbifk5c.apps.googleusercontent.com',
    iosBundleId: 'com.IBMF.ecommerceApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZ73hdLjULVthCEn-nSeXtLegFK-M81og',
    appId: '1:516437365566:ios:25a7000fa7360c747f126f',
    messagingSenderId: '516437365566',
    projectId: 'shopsavvy-b9b62',
    storageBucket: 'shopsavvy-b9b62.appspot.com',
    iosClientId: '516437365566-5dd0g4fso49rb94nafdh1c8gudbifk5c.apps.googleusercontent.com',
    iosBundleId: 'com.IBMF.ecommerceApplication',
  );
}
