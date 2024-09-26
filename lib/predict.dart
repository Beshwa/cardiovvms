// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_1project/bottomnavi.dart';
import 'package:my_1project/color.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  TextEditingController textedit = TextEditingController();
  dynamic value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          backgroundColor: appcolor,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.arrow_back_ios_sharp)),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 20, top: 8, bottom: 8, left: 8),
              child: Image.asset("assets/images/cardiogram.png"),
            ),
          ]),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 122, left: 40, right: 40),
            //   child: Center(
            //     child: Image.asset(
            //       'assets/images/medsymbol.png',
            //       color: Colors.white.withOpacity(0.3),
            //       colorBlendMode: BlendMode.modulate,
            //     ),
            //   ),
            // ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text('Your Result is Ready!', style: devicepage1),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(18),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          "Disease Prediction",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(18),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          "Risk Zone Prediction",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          value = textedit.text;
                          if (value == 'good') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Green()));
                          } else if (value == 'bad') {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Red()));
                          } else {
                            print('Enter good or bad');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            // padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'View',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 265,
              ),
              child: TextField(
                controller: textedit,
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Color.fromARGB(215, 20, 189, 189).withOpacity(0.1),
                  labelText: ' OUTPUT EX:Enter good or bad',
                  labelStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.5)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.5)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
