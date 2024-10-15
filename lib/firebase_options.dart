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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDPiRGaSmRRKLjCjwNHPbHci5ep4A0Qwmo',
    appId: '1:355493847430:web:b2778dc1f95dac7471cc07',
    messagingSenderId: '355493847430',
    projectId: 'newsapp-937ff',
    authDomain: 'newsapp-937ff.firebaseapp.com',
    storageBucket: 'newsapp-937ff.appspot.com',
    measurementId: 'G-XGJ23SFKDH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNm-nnyG5QsEKxGJmS0aFuGI-N_YGth9U',
    appId: '1:587786418153:android:c3a701d6c2895315367d78',
    messagingSenderId: '587786418153',
    projectId: 'newsapp-8c0f7',
    storageBucket: 'newsapp-8c0f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxBT45peXKFMFqshIF86oWcvZE5LVA9j4',
    appId: '1:587786418153:ios:af7b92bf77bd2113367d78',
    messagingSenderId: '587786418153',
    projectId: 'newsapp-8c0f7',
    storageBucket: 'newsapp-8c0f7.appspot.com',
    iosBundleId: 'com.example.tajakhabar',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPiRGaSmRRKLjCjwNHPbHci5ep4A0Qwmo',
    appId: '1:355493847430:web:3575ffaf2ab9db4471cc07',
    messagingSenderId: '355493847430',
    projectId: 'newsapp-937ff',
    authDomain: 'newsapp-937ff.firebaseapp.com',
    storageBucket: 'newsapp-937ff.appspot.com',
    measurementId: 'G-FYQGGWWVEK',
  );
}