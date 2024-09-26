// ignore_for_file: file_names, prefer_const_constructors, unnecessary_null_comparison, sort_child_properties_last, use_build_context_synchronously
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:my_1project/component.dart';
import 'package:my_1project/forget.dart';
import 'package:my_1project/profilepages/homepage.dart';

class Login extends StatefulWidget {
  final Function()? OnTap;
  const Login({super.key, this.OnTap});

  @override
  State<Login> createState() => _HomepState();
}

class _HomepState extends State<Login> {
  String email = '', password = '';
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();

  login() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ));
    try {
      //print('hi');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage1())));
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
          backgroundColor: Color.fromARGB(255, 77, 75, 75),
        ),
      );
    }
  }

  int m = 0;
  var val = true;
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), borderSide: BorderSide());
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade300,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Icon(
                    Icons.lock,
                    size: 150,
                    color: Colors.black87,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    elevation: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 15,
                            sigmaY: 15,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(17.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: emailc,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'Mail ID is empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white70,
                                    prefixIcon: Icon(
                                      Icons.mail_lock_outlined,
                                      color: Colors.black87,
                                    ),
                                    hintText: 'Enter Your Mail ID:',
                                    hintStyle: font,
                                    enabledBorder: border,
                                    focusedBorder: border,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: passwordc,
                                  obscureText: val,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'password is empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white70,
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          m++;

                                          if (m % 2 == 0) {
                                            val = false;
                                          } else {
                                            val = true;
                                          }
                                          setState(() {});
                                        },
                                        child: val
                                            ? Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: Colors.black87,
                                              )
                                            : Icon(
                                                Icons.visibility_off_outlined,
                                                color: Colors.black87,
                                              )),
                                    prefixIcon: Icon(
                                      Icons.keyboard_alt_rounded,
                                      color: Colors.black87,
                                    ),
                                    hintText: 'Password:',
                                    hintStyle: font,
                                    enabledBorder: border,
                                    focusedBorder: border,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            email = emailc.text;
                            password = passwordc.text;
                          });
                        }

                        login();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            // letterSpacing: 2,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    child: FittedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '        Don\'t have an account?',
                            overflow: TextOverflow.ellipsis,
                            style: font,
                          ),
                          TextButton(
                              onPressed: widget.OnTap,
                              child: Text('Signup', style: font))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
