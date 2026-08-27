import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCkiZpB8LeaWIeH5JEjatv975cHaNU1Mdk",
            authDomain: "si-app-1cc07.firebaseapp.com",
            projectId: "si-app-1cc07",
            storageBucket: "si-app-1cc07.appspot.com",
            messagingSenderId: "677888734839",
            appId: "1:677888734839:web:e22afd611d177c727fb872",
            measurementId: "G-3YGJ090077"));
  } else {
    await Firebase.initializeApp();
  }
}
