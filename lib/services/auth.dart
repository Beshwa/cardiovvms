// ignore_for_file: camel_case_types, await_only_futures, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_1project/Login.dart';
import 'package:my_1project/signup.dart';

class Login_or_Register extends StatefulWidget {
  const Login_or_Register({super.key});

  @override
  State<Login_or_Register> createState() => _LoginorcreateState();
}

class _LoginorcreateState extends State<Login_or_Register> {
  bool a = true;
  loadpage() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return Login(
        OnTap: loadpage,
      );
    } else {
      return Signup(
        OnTap: loadpage,
      );
    }
  }
}

class firebaseservice {
  final CollectionReference usernote =
      FirebaseFirestore.instance.collection('User');
  dynamic docc;
  Future<void> createnote() async {
    return await usernote.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'Username': '/-/-/-/-/-/',
      'Weight': 0,
      'Cholestrol': 0,
      'Sugarlevel': 0,
      'Smoking': '/-/-/-/-/-/',
      'Gender': '/-/-/-/-/-/',
      'Timestamp': Timestamp.now(),
    });
  }
}
