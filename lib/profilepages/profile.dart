// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_1project/container.dart';
import 'package:my_1project/update.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String get user => _auth.currentUser!.displayName.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black45,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Draw()));
        //     },
        //     icon: Icon(
        //       Icons.arrow_back,
        //       size: 30,
        //     )),
        title: const Text(
          "M y P r o f i l e",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Center(
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),
            Card(
              color: Colors.black12,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(user, style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Details:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Container(
                  //margin: EdgeInsets.all(5),
                  // width: 120,
                  // height: 40,

                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.grey
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Update()));
                    },
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                // side: BorderSide(
                // color: Color.fromARGB(221, 32, 31, 31), width: 1)
              ),
              elevation: 10,
              color: Colors.black26,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('User')
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<DocumentSnapshot>
                                    streamSnapshot) {
                              if (streamSnapshot.hasData) {
                                var value = streamSnapshot.data!;
                                return ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (ctx, index) => Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ConTainer(
                                              title: 'Username',
                                              content: value.get('Username'),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            ConTainer(
                                              title: 'Gender',
                                              content: value.get('Gender'),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ConTainer(
                                              title: 'Weight',
                                              content: value.get('Weight'),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            ConTainer(
                                              title: 'Cholesterol',
                                              content: value.get('Cholestrol'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FittedBox(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ConTainer(
                                                title: 'SugLevel',
                                                content:
                                                    value.get('Sugarlevel'),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              ConTainer(
                                                title: 'smoking',
                                                content: value.get('Smoking'),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
