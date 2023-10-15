import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:tuple/tuple.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuple/tuple.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:avatar_glow/avatar_glow.dart';

class RecordingScreen extends StatefulWidget{
  @override
  State<RecordingScreen> createState() => _RecordingScreen();
}

class _RecordingScreen extends State<RecordingScreen> {

  final recorder=FlutterSoundRecorder();
  Duration recordedTime=Duration.zero;
  bool isPaused = false; // Track the pause state
  late Timer recordingTimer;

  bool isRecorderReady=false;
  @override
  void initState() {

    super.initState();
    initRecorder();
  }
  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  //accessing microphone
  Future initRecorder() async {
    final status=await Permission.microphone.request();
    if(status!=PermissionStatus.granted){
      throw "Permission not granted";
    }
    await recorder.openRecorder();
    isRecorderReady=true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future  startRecording() async {
    if(recorder.isPaused){
      await recorder.resumeRecorder();

    }
    else {
      await recorder.startRecorder(toFile: 'audio');

    }
      // await recorder.startRecorder(toFile: 'audio');





    // final filePath = await getTemporaryDirectory().then((dir) {
    //   return dir.path + '/your_audio_filename.mp3';
    // });

    // await recorder.startRecorder(toFile: filePath);
    // return filePath; // Return the file path


  }


  Future<void> pauseRecording() async {
    if (recorder.isRecording) {
      await recorder.pauseRecorder();
    }
  }

  Future  stopRecording() async {
    if(!isRecorderReady)
      return;
   final path = await recorder.stopRecorder();
    final audioFile=File(path!);
    print("Recording audio: $audioFile");
  }
  //
  // late final Record _recorder;
  // bool _isRecording = false;
  // String? _filePath;
  // _startRecording() async {
  //   bool hasPermission = await _recorder.hasPermission();
  //
  //   if (hasPermission) {
  //     setState(() {
  //       _isRecording = true;
  //       _filePath = null;
  //     });
  //
  //     await _recorder.start();
  //   }
  // }
  // _stopRecording() async {
  //   final path = await _recorder.stop();
  //
  //   log('Recording complete, path: $path');
  //
  //   if (path != null) {
  //     setState(() {
  //       _isRecording = false;
  //       _filePath = path;
  //     });
  //   }
  // }
  //
  // @override
  // void initState() {
  //   _recorder = Record();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _recorder.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 238, 238, 1.0),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children:<Widget>[
            SizedBox(height: 20,),
            Text("Recorder",style: TextStyle(
                fontSize: 30,
                color: Colors.black87
            ),),
            SizedBox(height: 150,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder<RecordingDisposition>(
                  stream: recorder.onProgress,

                  builder: (context,snapshot){
                  final duration=
                      snapshot.hasData ? snapshot.data!.duration:Duration.zero;
                  String twoDigits(int n) =>n.toString().padLeft(2,"0");
                  final twoDigitMinutes=twoDigits(duration.inMinutes.remainder(60));
                  final twoDigitSeconds=twoDigits(duration.inSeconds.remainder(60));
                  return Text("$twoDigitMinutes:$twoDigitSeconds",style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                  ),);

                },



                ),




                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white
                      ),

                    ),
                  ),
                ),
              ],
            ),

            Expanded(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,



                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                     shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(

                      onPressed: ()async{

                             if (recorder.isRecording) {
                                 await pauseRecording();
                                   } else {
                             await startRecording();
                                       }
                             setState(() {}); // Update the UI



                      },
                      icon: Icon(recorder.isPaused ?Icons.play_arrow


                          :Icons.pause,


                        size: 40,

                        color: Colors.black87,

                      ),
                    )




                  ),
                  Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        onPressed: () async{
                          if(recorder.isRecording){
                            await stopRecording();
                          }
                          else{
                            await startRecording();
                          }
                          setState(() {

                          });


                        },
                        icon:  Icon(recorder.isRecording ?
                            Icons.stop : Icons.mic,
                          size: 40,color: Colors.black87,),
                      )

                  ),
                  Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: const Icon(Icons.save,size: 40,color: Colors.black87,),
                      )




                  ),







                ],

              ),
            ),



          ],
        ),
      ),

    );
  }
}