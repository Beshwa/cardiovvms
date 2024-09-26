// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, unused_field, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, unused_local_variable, deprecated_member_use

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:my_1project/component.dart';
import 'package:my_1project/profilepages/homepage.dart';
import 'package:my_1project/services/auth.dart';
//import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  final Function()? OnTap;
  const Signup({super.key, required this.OnTap});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = '', password = '', username = '';
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();
  TextEditingController usernamec = TextEditingController();
  TextEditingController passc = TextEditingController();

  register() async {
    if (password != null && email != '' && username != '') {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CircularProgressIndicator(),
              ));
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        User? user = userCredential.user;
        user?.updateProfile(displayName: username);
        firebaseservice().createnote();
        if (context.mounted) Navigator.pop(context);
        snakbar('Registered Succesfully.');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage1(),
            ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          Navigator.pop(context);
          snakbar('Your Mail ID is Invalid.');
        } else if (e.code == 'weak-password') {
          Navigator.pop(context);
          snakbar('Your Password is weak.');
        } else if (e.code == 'email-already-in-use') {
          Navigator.pop(context);
          snakbar('Email already exist');
        }
      }
    }
  }

  final _formkey = GlobalKey<FormState>();

  Future veri() async {
    await FirebaseAuth.instance.currentUser!
        .sendEmailVerification()
        .then((value) => snakbar('Verification Mail sent.'));
    return;
  }

  snakbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Color.fromARGB(255, 77, 75, 75),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                      child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create your account',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
                  ),
                  SizedBox(height: 25),
                  Card(
                    color: Colors.black38,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Textfield(
                                  hint: 'Username',
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  control: usernamec,
                                  boo: false,
                                ),
                                SizedBox(height: 25),
                                Textfield(
                                  hint: 'Email',
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.black,
                                  ),
                                  control: emailc,
                                  boo: false,
                                ),
                                SizedBox(height: 25),
                                Textfield(
                                  hint: 'Password',
                                  icon: Icon(
                                    Icons.keyboard,
                                    color: Colors.black,
                                  ),
                                  control: passwordc,
                                  boo: true,
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = emailc.text;
                            password = passwordc.text;
                            username = usernamec.text;
                          });
                        }
                        register();
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.black87,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Already have an Account?', style: font),
                        TextButton(
                            onPressed: widget.OnTap,
                            child: Text(
                              'Signin',
                              style: font,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Textfield extends StatelessWidget {
  final String? hint;
  final dynamic icon;
  final dynamic control;
  final bool boo;

  const Textfield(
      {super.key,
      required this.hint,
      required this.icon,
      required this.control,
      required this.boo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: boo,
        validator: (value) {
          if (value == '' || value == null) {
            return 'Type Sommething';
          }

          return null;
        },
        controller: control,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          prefixIcon: icon,
          hintText: hint,
          hintStyle: font,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black87),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
