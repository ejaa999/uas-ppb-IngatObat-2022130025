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
    apiKey: 'AIzaSyCk6LV18YzOEaK1dwA5RkLvR0O0puw218w',
    appId: '1:519124185127:web:53fbc07085c8b2f28e9e02',
    messagingSenderId: '519124185127',
    projectId: 'ingatobatku',
    authDomain: 'ingatobatku.firebaseapp.com',
    databaseURL: 'https://ingatobatku-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ingatobatku.firebasestorage.app',
    measurementId: 'G-RRC9TPDDL0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDJrPOVWwws_O5wC77iEQDn5-te2pUuiA',
    appId: '1:519124185127:android:40398c67891661058e9e02',
    messagingSenderId: '519124185127',
    projectId: 'ingatobatku',
    databaseURL: 'https://ingatobatku-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ingatobatku.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8GbVtt1DclaVlCxHMBC-TG0tfEqxF1X0',
    appId: '1:519124185127:ios:564cedef0444a96b8e9e02',
    messagingSenderId: '519124185127',
    projectId: 'ingatobatku',
    databaseURL: 'https://ingatobatku-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ingatobatku.firebasestorage.app',
    iosClientId: '519124185127-of7j8qhhgok7iq86cli2ub2e4v9f2k1p.apps.googleusercontent.com',
    iosBundleId: 'com.example.ingatObatku',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8GbVtt1DclaVlCxHMBC-TG0tfEqxF1X0',
    appId: '1:519124185127:ios:564cedef0444a96b8e9e02',
    messagingSenderId: '519124185127',
    projectId: 'ingatobatku',
    databaseURL: 'https://ingatobatku-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ingatobatku.firebasestorage.app',
    iosClientId: '519124185127-of7j8qhhgok7iq86cli2ub2e4v9f2k1p.apps.googleusercontent.com',
    iosBundleId: 'com.example.ingatObatku',
  );
}
