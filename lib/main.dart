import 'dart:convert';
import 'dart:io';

import 'package:audio_transcriber/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:audio_transcriber/Screens/RecordingScreen.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: depend_on_referenced_packages
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';


import 'Util/DataModel.dart';
import 'package:path_provider/path_provider.dart';

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

  // @override
  // void initState() {
  //    initRecorder();
  //   super.initState();
  // }
  // @override
  // void dispose() {
  //    recorder.closeRecorder();
  //   super.dispose();
  // }
  // final recorder=FlutterSoundRecorder();
  // //accessing microphone
  // Future initRecorder() async {
  //   final status=await Permission.microphone.request();
  //   if(status!=PermissionStatus.granted){
  //     throw "Permission not granted";
  //   }
  //   await recorder.openRecorder();
  //   recorder.setSubscriptionDuration(const Duration(milliseconds: 1000));
  // }
  //
  // Future<String> startRecording() async {
  //   final filePath = await getTemporaryDirectory().then((dir) {
  //     return dir.path + '/your_audio_filename.mp3';
  //   });
  //
  //   await recorder.startRecorder(toFile: filePath);
  //   return filePath; // Return the file path
  // }
  //
  // Future<void> stopRecording() async {
  //   await recorder.stopRecorder();
  // }

  // Future startRecord() async{
  //   await recorder.startRecorder(toFile: "audio");
  // }
  // Future stopRecord()async{
  //   final filePath =await recorder.startRecorder();
  //   final file= File(filePath);
  //   print("Recorded file path: $file");
  // }


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
           // if(recorder.isRecording){
           //  stopRecording();
           //  setState(() {
           //
           //  });
           //
           //
           // }
           // else {
           //   startRecording();
           //   setState(() {
           //
           //   });
           // }

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
