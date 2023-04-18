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
    apiKey: 'AIzaSyBaN9W3V6-MHftnleejELa7oJUWfAxOwU8',
    appId: '1:958769104885:web:31ea2e60a3eb0038db82bc',
    messagingSenderId: '958769104885',
    projectId: 'full-comics',
    authDomain: 'full-comics.firebaseapp.com',
    storageBucket: 'full-comics.appspot.com',
    measurementId: 'G-95YBLGRWLP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiI7n2JgqZObYEI5Ctnl_lDVDTO9rcl4k',
    appId: '1:958769104885:android:74b66997d93f239edb82bc',
    messagingSenderId: '958769104885',
    projectId: 'full-comics',
    storageBucket: 'full-comics.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGo8a59LwGzbICuxDl-rTSqWodSJGcUXc',
    appId: '1:958769104885:ios:c59ea1dfdfbaac46db82bc',
    messagingSenderId: '958769104885',
    projectId: 'full-comics',
    storageBucket: 'full-comics.appspot.com',
    iosClientId: '958769104885-duqtsti2cs6tv654g0i4acf2slbj6kph.apps.googleusercontent.com',
    iosBundleId: 'com.example.fullComics',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGo8a59LwGzbICuxDl-rTSqWodSJGcUXc',
    appId: '1:958769104885:ios:c59ea1dfdfbaac46db82bc',
    messagingSenderId: '958769104885',
    projectId: 'full-comics',
    storageBucket: 'full-comics.appspot.com',
    iosClientId: '958769104885-duqtsti2cs6tv654g0i4acf2slbj6kph.apps.googleusercontent.com',
    iosBundleId: 'com.example.fullComics',
  );
}