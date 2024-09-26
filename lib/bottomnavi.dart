// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_1project/component.dart';
import 'package:my_1project/predict.dart';
import 'package:my_1project/profilepages/homepage.dart';

Color appcolor = Colors.grey;
const TextStyle devicepage1 = TextStyle(
  fontSize: 30,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0, m = 0;
  final load = [Page1(), Page2(), Page3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load[i],
      bottomNavigationBar: BottomNavigationBar(
        // selectedLabelStyle: TextStyle(color: Colors.white),
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        //  selectedIconTheme: IconThemeData(color: Colors.white),
        // unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black45,
        elevation: 56,
        onTap: (value) {
          i = value;
          setState(() {});
        },
        currentIndex: i,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/pulse-oximeter.png",
                color: i == 0 ? Colors.white : Colors.black,
                height: 35,
                width: 100,
              ),
              label: 'Pulse'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/blood-pressure.png",
                color: i == 1 ? Colors.white : Colors.black,
                height: 35,
                width: 100,
              ),
              label: 'Blood Pressure'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/ecg.png",
                color: i == 2 ? Colors.white : Colors.black,
                height: 35,
                width: 100,
              ),
              label: 'ECG'),
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  Page1({super.key});
  // int m = 0;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int m = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage1()));
              },
              icon: Icon(Icons.arrow_back_ios_sharp)),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 20, top: 8, bottom: 8, left: 8),
              child: Image.asset("assets/images/cardiogram.png"),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(child: Text('Device Connection', style: devicepage)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.black,
          ),
          SizedBox(
            height: 50,
          ),
          Text('Pulse Device', style: devicepage1),
          Container(
            width: 200,
            margin: EdgeInsets.all(18),
            child: ElevatedButton(
              onPressed: () {
                m = 1;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                "Connect",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          if (m == 1)
            Sensordetails(
              text1: 'PULSE RATE',
              text2: '64 / BPM',
            ),
          SizedBox(
            height: 80,
          ),
        ]),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int m1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 20, top: 8, bottom: 8, left: 8),
            child: Image.asset("assets/images/cardiogram.png"),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Homepage1()));
            },
            icon: Icon(Icons.arrow_back_ios_sharp)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Device Connection',
              style: devicepage,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.black,
          ),
          SizedBox(
            height: 50,
          ),
          FittedBox(
            child: Text(
              'BLOOD PRESSURE DEVICE',
              style: devicepage1,
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.all(18),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  m1 = 1;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                "Connect",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          if (m1 == 1)
            Sensordetails(
              text1: 'BLOOD PRESSURE RATE',
              text2: '120 / mm Hg',
            ),
          SizedBox(
            height: 80,
          ),
        ]),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int m2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage1()));
              },
              icon: Icon(Icons.arrow_back_ios_sharp)),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 20, top: 8, bottom: 8, left: 8),
              child: Image.asset("assets/images/cardiogram.png"),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text('Device Connection', style: devicepage),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.black,
          ),
          SizedBox(
            height: 50,
          ),
          Text('ECG Device', style: devicepage1),
          Container(
            width: 200,
            margin: EdgeInsets.all(18),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (m2 >= 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Predict()));
                  }
                  m2 += 1;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                "Connect",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          if (m2 == 1)
            Sensordetails(
              text1: 'ECG STATUS',
              text2: 'STATUS',
            ),
          SizedBox(
            height: 80,
          ),
        ]),
      ),
    );
  }
}

class Sensordetails extends StatelessWidget {
  String text1, text2;
  Sensordetails({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 10,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                text2,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              )
            ],
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: const Offset(
                  5.0,
                  5.0,
                ), //Offset
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
