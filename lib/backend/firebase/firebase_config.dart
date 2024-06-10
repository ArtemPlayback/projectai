import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBb9qGEcU87nPm0uhZNTdje-WL8lCPAS6g",
            authDomain: "project-e33e5.firebaseapp.com",
            projectId: "project-e33e5",
            storageBucket: "project-e33e5.appspot.com",
            messagingSenderId: "991574124918",
            appId: "1:991574124918:web:a32ac79e10edb400467257",
            measurementId: "G-GSF3E8DN63"));
  } else {
    await Firebase.initializeApp();
  }
}
