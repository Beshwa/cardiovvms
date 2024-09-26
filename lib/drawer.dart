//import 'dart:html';

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_1project/component.dart';
import 'package:my_1project/launchscreen.dart';
import 'package:my_1project/profilepages/homepage.dart';
import 'package:my_1project/profilepages/profile.dart';

class Draw extends StatefulWidget {
  const Draw({super.key});

  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  final UserCredential = FirebaseAuth.instance.currentUser!;
  signout() async {
    final user = await FirebaseAuth.instance;
    return user.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => Launchscreen())));
  }

  //final user = FirebaseFirestore.instance.collection('User').doc();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // elevation: 4,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black45,
            ), //BoxDecoration
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Icon(
                    Icons.person,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
                FittedBox(
                  child: Text(
                    '${UserCredential.email}',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
              ],
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 30,
            ),
            title: const Text(
              'H O M E',
              style: font,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Homepage1()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              size: 30,
            ),
            title: const Text(
              'M Y P R O F I L E',
              style: font,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyProfile()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 30,
            ),
            title: const Text(
              'L O G O U T',
              style: font,
            ),
            onTap: () {
              signout();
            },
          ),
        ],
      ),
    );
    //Drawer;
  }
}
