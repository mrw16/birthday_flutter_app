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
    apiKey: 'AIzaSyCL9dcFc1NZwvnzPbYHJid_IwFQbgDz-ac',
    appId: '1:864993710252:web:1f0253aa85f53770aecf09',
    messagingSenderId: '864993710252',
    projectId: 'birthdayapp-f3932',
    authDomain: 'birthdayapp-f3932.firebaseapp.com',
    storageBucket: 'birthdayapp-f3932.appspot.com',
    measurementId: 'G-V7LV7RFSWG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6UiMeT88SqHbfc638vMksBxRTo-0vllw',
    appId: '1:864993710252:android:eec3926970ccd6b3aecf09',
    messagingSenderId: '864993710252',
    projectId: 'birthdayapp-f3932',
    storageBucket: 'birthdayapp-f3932.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGHrMx965OFgTKuWzbv7Hd_9PLv7-nbRI',
    appId: '1:864993710252:ios:2073fe8df63478d1aecf09',
    messagingSenderId: '864993710252',
    projectId: 'birthdayapp-f3932',
    storageBucket: 'birthdayapp-f3932.appspot.com',
    iosClientId: '864993710252-ndgslt15hhlb41bh90vsqireu1iq0h3i.apps.googleusercontent.com',
    iosBundleId: 'com.example.birthdayApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGHrMx965OFgTKuWzbv7Hd_9PLv7-nbRI',
    appId: '1:864993710252:ios:2073fe8df63478d1aecf09',
    messagingSenderId: '864993710252',
    projectId: 'birthdayapp-f3932',
    storageBucket: 'birthdayapp-f3932.appspot.com',
    iosClientId: '864993710252-ndgslt15hhlb41bh90vsqireu1iq0h3i.apps.googleusercontent.com',
    iosBundleId: 'com.example.birthdayApp',
  );
}
