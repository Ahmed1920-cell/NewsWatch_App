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
    apiKey: 'AIzaSyBjrtbpJXJgsfKlmm0kvW3atw8HPw1-ljs',
    appId: '1:352432186238:web:7fd3a6463990cb6a65092f',
    messagingSenderId: '352432186238',
    projectId: 'news-59ceb',
    authDomain: 'news-59ceb.firebaseapp.com',
    storageBucket: 'news-59ceb.firebasestorage.app',
    measurementId: 'G-PFHZSXXT22',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGMitpyzszOEdlrgd360NaM6C4DNS_3L0',
    appId: '1:352432186238:android:fba262e6be1a600765092f',
    messagingSenderId: '352432186238',
    projectId: 'news-59ceb',
    storageBucket: 'news-59ceb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmsl20DBcysKo2HGsJBytOW3fCzaEpz2E',
    appId: '1:352432186238:ios:e3d9fb65095deeea65092f',
    messagingSenderId: '352432186238',
    projectId: 'news-59ceb',
    storageBucket: 'news-59ceb.firebasestorage.app',
    iosBundleId: 'com.example.news',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmsl20DBcysKo2HGsJBytOW3fCzaEpz2E',
    appId: '1:352432186238:ios:e3d9fb65095deeea65092f',
    messagingSenderId: '352432186238',
    projectId: 'news-59ceb',
    storageBucket: 'news-59ceb.firebasestorage.app',
    iosBundleId: 'com.example.news',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBjrtbpJXJgsfKlmm0kvW3atw8HPw1-ljs',
    appId: '1:352432186238:web:cccba54758af7c5965092f',
    messagingSenderId: '352432186238',
    projectId: 'news-59ceb',
    authDomain: 'news-59ceb.firebaseapp.com',
    storageBucket: 'news-59ceb.firebasestorage.app',
    measurementId: 'G-WJ5NF0K3P4',
  );
}
