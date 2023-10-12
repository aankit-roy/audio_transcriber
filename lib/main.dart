import 'package:audio_transcriber/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:audio_transcriber/Screens/RecordingScreen.dart';

// ignore: depend_on_referenced_packages
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'Util/DataModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 238, 238, 1.0),

      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //
      //
      //   icons: iconList,
      //   activeIndex: pageIndex,
      //   gapLocation: GapLocation.end,
      //   notchSmoothness: NotchSmoothness.defaultEdge,
      //
      //   onTap: (index) => setState(() => pageIndex = index),
      //   activeColor: Colors.blue,
      //
      //   //other params
      // ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.mic,
            color: Colors.black,
          ),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context){
              return RecordingScreen();
            }


            ));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: SafeArea(child: HomeScreen()),
    );
  }
}
