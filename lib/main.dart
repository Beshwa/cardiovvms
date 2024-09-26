// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_1project/launchscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAZRWJuUmk8AC-hZLTglDVeInsw4Iq0C8U',
          appId: '1:536203000222:android:4e676275a5c4c6ffde3e8f',
          messagingSenderId: '536203000222',
          projectId: 'my1app-69db3'));
  runApp(const Project());
}

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.blueAccent,
            textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            useMaterial3: true),
        home: Launchscreen());
  }
}
