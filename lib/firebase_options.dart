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
    apiKey: 'AIzaSyBOLRD0ZsRpcXHU0vAt2NnfBdcS2XSGZpA',
    appId: '1:127427050349:web:f9c304f8ba6be986ea7864',
    messagingSenderId: '127427050349',
    projectId: 'serkom-75aeb',
    authDomain: 'serkom-75aeb.firebaseapp.com',
    databaseURL: 'https://serkom-75aeb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'serkom-75aeb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6Ksf6uZ4tGTejXDy5kdswVUDPmS9M1lE',
    appId: '1:127427050349:android:903fbf53ed476c74ea7864',
    messagingSenderId: '127427050349',
    projectId: 'serkom-75aeb',
    databaseURL: 'https://serkom-75aeb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'serkom-75aeb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwNKVw_vI9SiCAnnnR4dsYvkkax_6ZzO4',
    appId: '1:127427050349:ios:3757761fbd3423c5ea7864',
    messagingSenderId: '127427050349',
    projectId: 'serkom-75aeb',
    databaseURL: 'https://serkom-75aeb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'serkom-75aeb.appspot.com',
    iosBundleId: 'com.example.kpuApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwNKVw_vI9SiCAnnnR4dsYvkkax_6ZzO4',
    appId: '1:127427050349:ios:49ac272c27fa0142ea7864',
    messagingSenderId: '127427050349',
    projectId: 'serkom-75aeb',
    databaseURL: 'https://serkom-75aeb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'serkom-75aeb.appspot.com',
    iosBundleId: 'com.example.kpuApp.RunnerTests',
  );
}