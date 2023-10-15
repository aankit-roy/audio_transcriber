
import 'package:audio_transcriber/Util/DataModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';





 class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List <DataModel> itemList=[
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),
     (DataModel("First", "2:00" )),

     
   ];

   int pageIndex=0;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return SafeArea(
       bottom: false,
       child: Stack(
         children: <Widget>[
           CustomScrollView(
             slivers: <Widget>[
               SliverAppBar(
                 expandedHeight: 100,
                 pinned: true,

                 floating: false,
                 elevation: 0,


                 actions: [
                   Padding(
                     padding: const EdgeInsets.only(top: 10.0),
                     child: IconButton(onPressed:  (){

                     },

                       icon: const Icon(Icons.settings,color: Colors.black87,),


                     ),
                   )
                 ],
                 backgroundColor: const Color.fromRGBO(240, 238, 238, 1.0),
                 // bottom: PreferredSize(
                 //   preferredSize: Size.fromHeight(0.0),
                 //   child: Container(
                 //     child: Text("This is recording"),
                 //   ),
                 // ),
                 flexibleSpace: FlexibleSpaceBar(
                   centerTitle: true,
                   collapseMode: CollapseMode.pin,



                   title: Text("Recordings",style: TextStyle(

                       fontSize: 25,
                       fontWeight: FontWeight.w300,
                       color: Colors.black
                   ),
                     textAlign: TextAlign.left,

                   ),






                 ),
               ),
               SliverToBoxAdapter(

                 child: Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Container(
                     height: 50,
                     decoration: BoxDecoration(
                         color: Colors.white,


                         borderRadius: BorderRadius.circular(25.0)
                     ),
                     child: TextField(
                       decoration: InputDecoration(
                         border: InputBorder.none,
                         prefixIcon: const Icon(Icons.search,color: Colors.black54,),
                         hintText: "Search you're looking for",





                       ),

                     ),
                   ),
                 ),
               ),
               SliverList(
                   delegate: SliverChildBuilderDelegate(
                           (BuildContext context, int index){
                         DataModel dataModel= itemList[index];
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(

                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20.0),
                               color: Colors.white,
                             ),
                             child: ListTile(




                               title: Text(dataModel.Title,style: TextStyle(

                                   fontSize: 20,
                                   fontWeight: FontWeight.bold
                               ),),
                               subtitle: Text(dataModel.Time),

                               leading: const Icon(Icons.music_note,color: Colors.black,),

                               trailing: Container(
                                 decoration: BoxDecoration(
                                     shape: BoxShape.circle,color: Color.fromRGBO(240, 238, 238, 1.0)
                                 ),
                                 child: IconButton(

                                   onPressed: (){

                                   }, icon: const Icon(Icons.play_arrow,color: Colors.black,),


                                 ),
                               ),



                             ),
                           ),
                         );

                       },
                       childCount: itemList.length

                   )

               )


             ],
           )

         ],
       ),



     );

  }
}