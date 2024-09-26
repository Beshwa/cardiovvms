// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_1project/bottomnavi.dart';

import 'package:my_1project/drawer.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: Draw(),
      appBar: AppBar(
        backgroundColor: Colors.black45,
        centerTitle: true,
        // leading: Icon(Icons.menu),
        title: Text(
          'welcome',
          style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Stack(children: [
        Center(
          child: Image.asset(
            'assets/images/medsymbol.png',
            color: Colors.white.withOpacity(0.08),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: SizedBox(
            // width: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
