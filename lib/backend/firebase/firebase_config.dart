import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAcgR-9e1Gmtlln4UXFT-XfgEOdROOqqbk",
            authDomain: "project-t9rgzl.firebaseapp.com",
            projectId: "project-t9rgzl",
            storageBucket: "project-t9rgzl.appspot.com",
            messagingSenderId: "323852889773",
            appId: "1:323852889773:web:02795981d4f0193f316024"));
  } else {
    await Firebase.initializeApp();
  }
}
