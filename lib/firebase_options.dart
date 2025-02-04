// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCtL6eKAwjciKFW3fX4ueFUYGcAMkxIMnE',
    appId: '1:980365042776:web:478523c71838a53518562d',
    messagingSenderId: '980365042776',
    projectId: 'deentok',
    authDomain: 'deentok.firebaseapp.com',
    storageBucket: 'deentok.firebasestorage.app',
    measurementId: 'G-J7G7FRCCWF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2hk6CBBBycNDrrYB3jbUJySorwaveTNk',
    appId: '1:980365042776:android:96a217c6f8bccdcb18562d',
    messagingSenderId: '980365042776',
    projectId: 'deentok',
    storageBucket: 'deentok.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqZI9WoFP-Z05BWndoEJ5FnHoGVa2_SUk',
    appId: '1:980365042776:ios:90264c6a223abe9018562d',
    messagingSenderId: '980365042776',
    projectId: 'deentok',
    storageBucket: 'deentok.firebasestorage.app',
    iosBundleId: 'com.example.tiktokCloneHenry',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqZI9WoFP-Z05BWndoEJ5FnHoGVa2_SUk',
    appId: '1:980365042776:ios:15a9166d9edd486618562d',
    messagingSenderId: '980365042776',
    projectId: 'deentok',
    storageBucket: 'deentok.firebasestorage.app',
    iosBundleId: 'com.example.tiktokClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCtL6eKAwjciKFW3fX4ueFUYGcAMkxIMnE',
    appId: '1:980365042776:web:f8fb79fe5e2df38418562d',
    messagingSenderId: '980365042776',
    projectId: 'deentok',
    authDomain: 'deentok.firebaseapp.com',
    storageBucket: 'deentok.firebasestorage.app',
    measurementId: 'G-67LLPK0526',
  );

}