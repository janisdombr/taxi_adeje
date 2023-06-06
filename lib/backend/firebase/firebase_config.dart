import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAKzSY4au8bF6g712bMrjGLHdL5mqzebDE",
            authDomain: "taxiadeje-c9831.firebaseapp.com",
            projectId: "taxiadeje-c9831",
            storageBucket: "taxiadeje-c9831.appspot.com",
            messagingSenderId: "887433417009",
            appId: "1:887433417009:web:b1f1d6237c810a8a5be010",
            measurementId: "G-9SZJMC9ESD"));
  } else {
    await Firebase.initializeApp();
  }
}
