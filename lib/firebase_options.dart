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
    apiKey: 'AIzaSyCV8cTQwDGlQHaJMfakpLQXLsVk8TYb0h8',
    appId: '1:964460792854:web:132859fa420234ecf03937',
    messagingSenderId: '964460792854',
    projectId: 'music-app-90905',
    authDomain: 'music-app-90905.firebaseapp.com',
    storageBucket: 'music-app-90905.appspot.com',
    measurementId: 'G-P87J3TBJVV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYbFMvHB7U0IpDsugTpV5P98WAXaERjZQ',
    appId: '1:964460792854:android:82344b6e5c3e5ca8f03937',
    messagingSenderId: '964460792854',
    projectId: 'music-app-90905',
    storageBucket: 'music-app-90905.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDugnX0yzN2JzeGlPxrBSP86KCGNOYhW8',
    appId: '1:964460792854:ios:121548d261e75de6f03937',
    messagingSenderId: '964460792854',
    projectId: 'music-app-90905',
    storageBucket: 'music-app-90905.appspot.com',
    iosClientId: '964460792854-puag8dllqi8veohhukp9t2igb8rt5mmq.apps.googleusercontent.com',
    iosBundleId: 'com.example.musicApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDugnX0yzN2JzeGlPxrBSP86KCGNOYhW8',
    appId: '1:964460792854:ios:121548d261e75de6f03937',
    messagingSenderId: '964460792854',
    projectId: 'music-app-90905',
    storageBucket: 'music-app-90905.appspot.com',
    iosClientId: '964460792854-puag8dllqi8veohhukp9t2igb8rt5mmq.apps.googleusercontent.com',
    iosBundleId: 'com.example.musicApp',
  );
}
