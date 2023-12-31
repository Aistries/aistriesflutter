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
    apiKey: 'AIzaSyCgbjWX3u6HWLd743X8ViMp8SaqQeJzifw',
    appId: '1:810097521200:web:df8c6384de9fc038a6f3f5',
    messagingSenderId: '810097521200',
    projectId: 'aistries-921f1',
    authDomain: 'aistries-921f1.firebaseapp.com',
    databaseURL: 'https://aistries-921f1-default-rtdb.firebaseio.com',
    storageBucket: 'aistries-921f1.appspot.com',
    measurementId: 'G-TC17QX85Y1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWs94JIYV6QsH7WN58CgQtgZ6EniG-340',
    appId: '1:810097521200:android:9b837c4142f9bf64a6f3f5',
    messagingSenderId: '810097521200',
    projectId: 'aistries-921f1',
    databaseURL: 'https://aistries-921f1-default-rtdb.firebaseio.com',
    storageBucket: 'aistries-921f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAr-0GW7YEYps9z7-xsT6i0TQPj9mh8zM4',
    appId: '1:810097521200:ios:501345b64597b582a6f3f5',
    messagingSenderId: '810097521200',
    projectId: 'aistries-921f1',
    databaseURL: 'https://aistries-921f1-default-rtdb.firebaseio.com',
    storageBucket: 'aistries-921f1.appspot.com',
    androidClientId: '810097521200-fr4mqugbt3o9vl1oi0c630pb9a1p91po.apps.googleusercontent.com',
    iosClientId: '810097521200-ud90586t7ipgps3ti27f987jqt6h9qoq.apps.googleusercontent.com',
    iosBundleId: 'com.example.finaldemoaist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAr-0GW7YEYps9z7-xsT6i0TQPj9mh8zM4',
    appId: '1:810097521200:ios:014f0c1f30a97b24a6f3f5',
    messagingSenderId: '810097521200',
    projectId: 'aistries-921f1',
    databaseURL: 'https://aistries-921f1-default-rtdb.firebaseio.com',
    storageBucket: 'aistries-921f1.appspot.com',
    androidClientId: '810097521200-fr4mqugbt3o9vl1oi0c630pb9a1p91po.apps.googleusercontent.com',
    iosClientId: '810097521200-f4fsersf82cespaguvb15jpmklr9jmvv.apps.googleusercontent.com',
    iosBundleId: 'com.example.finaldemoaist.RunnerTests',
  );
}
