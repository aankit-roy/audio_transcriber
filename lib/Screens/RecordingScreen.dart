import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:record/record.dart';
// import 'package:audioplayers/audioplayers.dart';
class RecordingScreen extends StatefulWidget{
  @override
  State<RecordingScreen> createState() => _RecordingScreen();
}

class _RecordingScreen extends State<RecordingScreen> {
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



                Text("10:05:00",style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),),
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
                      onPressed: (){

                      },
                      icon: Icon(Icons.pause,size: 40,color: Colors.black87,),
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
                        onPressed: (){

                        },
                        icon: const Icon(Icons.done,size: 40,color: Colors.black87,),
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
            SizedBox(height: 50,)




          ],
        ),
      ),

    );
  }
}