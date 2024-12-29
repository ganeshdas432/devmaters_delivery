// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD0NYVoJa1v7bE1-LtYQmB72_AlOvUaUpY',
    appId: '1:528911413255:web:a66542b690464f6f0f7aa2',
    messagingSenderId: '528911413255',
    projectId: 'devmasters-delivery',
    authDomain: 'devmasters-delivery.firebaseapp.com',
    storageBucket: 'devmasters-delivery.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeW9AgSCntoVEAIVwz8YrQ5j0aISmw2Vo',
    appId: '1:528911413255:android:ceb9397338e1515d0f7aa2',
    messagingSenderId: '528911413255',
    projectId: 'devmasters-delivery',
    storageBucket: 'devmasters-delivery.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-uKlW6LOZDPnaw-twPlOV_lNc4cZ7uAw',
    appId: '1:528911413255:ios:85cd65f57150591b0f7aa2',
    messagingSenderId: '528911413255',
    projectId: 'devmasters-delivery',
    storageBucket: 'devmasters-delivery.appspot.com',
    iosBundleId: 'c',
  );
}
