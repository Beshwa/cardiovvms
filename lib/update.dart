// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_1project/profilepages/profile.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController Usernamec = TextEditingController();
  TextEditingController Weightc = TextEditingController();
  TextEditingController Cholestrolc = TextEditingController();
  TextEditingController Sugarlevelc = TextEditingController();
  TextEditingController Smokingc = TextEditingController();
  TextEditingController Genderc = TextEditingController();
  String username = '',
      weight = '',
      choles = '',
      sugar = '',
      smoke = '',
      gender = '';
  // final firebaseservice firestore = firebaseservice();
  update() async {
    try {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'Username': username,
        'Weight': weight,
        'Cholestrol': choles,
        'Sugarlevel': sugar,
        'Smoking': smoke,
        'Gender': gender,
        'Timestamp': Timestamp.now(),
      });
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: const [
        Colors.blueGrey,
        Colors.grey,
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
                icon: Icon(Icons.arrow_back_ios_sharp)),
            title: FittedBox(
              child: Text(
                'Update Your profile',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 31, 31, 32)),
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, top: 8, bottom: 8, left: 8),
                child: Image.asset("assets/images/cardiogram.png"),
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Textfield(
                hint: 'USERNAME',
                control: Usernamec,
              ),
              Textfield(
                hint: 'WEIGTH',
                control: Weightc,
              ),
              Textfield(
                hint: 'CHOLESTEROL',
                control: Cholestrolc,
              ),
              Textfield(
                hint: 'BLOOD SUGAR LEVEL',
                control: Sugarlevelc,
              ),
              Textfield(
                hint: 'Male Or Female',
                control: Genderc,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    username = Usernamec.text;
                    gender = Genderc.text;
                    smoke = Smokingc.text;
                    sugar = Sugarlevelc.text;
                    weight = Weightc.text;
                    choles = Cholestrolc.text;
                    print(username);
                    update();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  dynamic control;
  final String hint;
  Textfield({super.key, required this.hint, required this.control});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 35,
      ),
      child: TextField(
        controller: control,
        decoration: InputDecoration(
          filled: false,
          fillColor: Color.fromARGB(215, 20, 189, 189).withOpacity(0.1),
          labelText: hint,
          labelStyle:
              TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 20),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
