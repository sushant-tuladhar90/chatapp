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
    apiKey: 'AIzaSyDlXdaMfKm8C61ImxRaT5Gm6iW6n0RTzrw',
    appId: '1:1033943431956:web:f78210920c29b6ffcd2001',
    messagingSenderId: '1033943431956',
    projectId: 'chatapp-7d0d5',
    authDomain: 'chatapp-7d0d5.firebaseapp.com',
    storageBucket: 'chatapp-7d0d5.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAna3pXHz3DF9eDVgM4X6YejNXVKg85IMo',
    appId: '1:1033943431956:android:3d306907a88c6e12cd2001',
    messagingSenderId: '1033943431956',
    projectId: 'chatapp-7d0d5',
    storageBucket: 'chatapp-7d0d5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQMfOkonA2P3kNR5y7Ti3rvytR2YWdavw',
    appId: '1:1033943431956:ios:d14d64617e650cbdcd2001',
    messagingSenderId: '1033943431956',
    projectId: 'chatapp-7d0d5',
    storageBucket: 'chatapp-7d0d5.firebasestorage.app',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDlXdaMfKm8C61ImxRaT5Gm6iW6n0RTzrw',
    appId: '1:1033943431956:web:38376447c651c002cd2001',
    messagingSenderId: '1033943431956',
    projectId: 'chatapp-7d0d5',
    authDomain: 'chatapp-7d0d5.firebaseapp.com',
    storageBucket: 'chatapp-7d0d5.firebasestorage.app',
  );
}