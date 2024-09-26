// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class ConTainer extends StatelessWidget {
  dynamic title;
  dynamic content;
  ConTainer({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueGrey.shade700],
            //begin: Alignment.bottomLeft,
            // end: Alignment.topRight,
          ),
          borderRadius: BorderRadiusDirectional.circular(20)),
      width: 150,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: FittedBox(
                  child: Text(
                    title + ':',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '$content',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
