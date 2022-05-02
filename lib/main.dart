// @dart=2.9
import 'package:ambulance_tracker/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/Welcome/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Minnal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snaps) {
          if (!snaps.hasData) return  WelcomeScreen();
          return StreamBuilder<User>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return WelcomeScreen();
              return WelcomeScreen();
            },
          );
        },
      ),
    );
  }
}