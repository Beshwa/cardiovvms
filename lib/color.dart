// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Green extends StatelessWidget {
  const Green({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 146, 235, 154),
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Center(
            child: Text(
              'Your Zone',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 7, 128, 11),
            radius: 85,
            child: Text(
              'GREEN',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color.fromARGB(255, 7, 128, 11),
                ),
                SizedBox(
                  width: 25,
                ),
                FittedBox(
                  child: Text(
                    'You are in Safe Zone',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color.fromARGB(255, 7, 128, 11),
                ),
                SizedBox(
                  width: 25,
                ),
                FittedBox(
                  child: Text(
                    'Follow your diet as usual ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Red extends StatelessWidget {
  const Red({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 134, 134),
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Center(
            child: Text(
              'Your Zone',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 237, 68, 56),
            radius: 85,
            child: Text(
              'RED',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color.fromARGB(255, 237, 68, 56),
                ),
                SizedBox(
                  width: 25,
                ),
                FittedBox(
                  child: Text(
                    'You are not safe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color.fromARGB(255, 237, 68, 56),
                ),
                SizedBox(
                  width: 25,
                ),
                FittedBox(
                  child: Text(
                    'Contact your doctor',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
