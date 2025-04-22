import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBTFvT5ahswZI90lzIiJW5jzNObQL94568",
    appId: "1:793462176850:web:6c249c2e1ecc06018c738b",
    messagingSenderId: "793462176850",
    projectId: "bursadiskon-e7786",
    authDomain: "bursadiskon-e7786.firebaseapp.com",
    storageBucket: "bursadiskon-e7786.firebasestorage.app",
    measurementId: "G-N8ET58BJT3",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCwauceJrVQf_rX3Cen0lcH_xwlFrJD2v0",
    appId: "1:793462176850:android:bfcdd793d05325288c738b",
    messagingSenderId: "793462176850",
    projectId: "bursadiskon-e7786",
    storageBucket: "bursadiskon-e7786.firebasestorage.app",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyAWK6mySJE6S3VH5DAxGVV9L130JDlH9GM",
    appId: "1:793462176850:ios:c5ce75edcb8ad73b8c738b",
    messagingSenderId: "793462176850",
    projectId: "bursadiskon-e7786",
    storageBucket: "bursadiskon-e7786.firebasestorage.app",
    iosBundleId: "com.example.bursaDiskon",
  );

  static const FirebaseOptions macos = ios;
}
