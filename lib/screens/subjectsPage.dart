import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hakcthon2user/database/dataRetrievalScreen.dart';
import 'package:hakcthon2user/screens/subjectsPage.dart';
import 'package:hakcthon2user/styles/bottomMainPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Authentication/authentication.dart';
import '../Authentication/login.dart';
class SubjectsScreens extends StatefulWidget {
  const SubjectsScreens({Key? key}) : super(key: key);

  @override
  State<SubjectsScreens> createState() => _SubjectsScreensState();
}

class _SubjectsScreensState extends State<SubjectsScreens> {
   
  @override
  Widget build(BuildContext context) {
    var db= FirebaseDatabase.instance.ref().child("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc");
    
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20,top: 20,right: 20),
          child: ListView(
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
           margin: EdgeInsets.only(right: 10,top: 10),
           decoration: BoxDecoration(
             border: Border.all(
                   width: 2,
                   color: Colors.blue.shade50,
                   
             ),
             borderRadius: BorderRadius.circular(10)
           ),
           child: IconButton(onPressed: (){
          Navigator.of(context).pop();
           }, icon: Icon(Icons.arrow_back_ios,color: Colors.blue[100],)),
               ),
                 ],
               ) ,
               SizedBox(height: 20,),
                Text("Mathematics",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w600),),
               
                         SizedBox(height: 10,),
                         Text("-This material developed by AU",style: TextStyle(fontSize: 20),),
                         SizedBox(height: 15,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Card(
                               shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
                               color: Colors.amber,
                               child: Image.asset("assests/images/commonSubjects.png"),
                             ),
                             SizedBox(height: 15,),
                             GestureDetector(
                               onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RetreiveData()));
                               },
                               child: Text("The full form of MATH is “Mathematics“. Mathematics is the science that deals with the logic of form, quantity, and disposition. Mathematics includes the study of topics such as quantity (number theory), structure (algebra), space (geometry) and change (mathematical analysis). It does not have a generally accepted definition. Mathematicians look for and use patterns to formulate new conjectures; They solve the truth or falsity of conjectures through mathematical tests.",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
                             ),
                           ],
                         ),
                        SizedBox(height: 15,),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                  onTap: ()=>
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RetreiveData())),
                  
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 120),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade500,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Text("Open",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                ),
              )
              
            ],
          ), 
          
        ),
      ),
      // bottomNavigationBar: Bottom(),     
    )

    ;
  }
}

