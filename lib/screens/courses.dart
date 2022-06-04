import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hakcthon2user/database/dataRetrievalScreen.dart';
import 'package:hakcthon2user/screens/bottomStyle.dart';
import 'package:hakcthon2user/screens/subjectsPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Authentication/authentication.dart';
import '../Authentication/login.dart';
import '../styles/bottomMainPage.dart';
class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
   var _selectedTab = _SelectedTab.home;
var _currentIndex = 0;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }
  @override
  Widget build(BuildContext context) {
    var db= FirebaseDatabase.instance.ref().child("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc");
    
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20,top: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               ContanerBut() ,
               SizedBox(height: 20,),
                Text("Find Your Suitable",style: TextStyle(fontSize: 30,color: Colors.grey[400],fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                    Text("Course here !",style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.w600),),
                         SizedBox(height: 20,),
                    // Text("Select",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                     Flexible(
                       
                       child: GridView.count(crossAxisCount: 2,
                       
                  crossAxisSpacing: 4.0,  
                  mainAxisSpacing: 10.0,  
                  children: <Widget>[
                    CardView(name: 'BDA', col: Colors.blue, img: "assests/images/CSE.png",),
                           CardView(name: 'Civil', col: Colors.blue.shade900, img: "assests/images/Civil.png", ),
                             CardView(name: 'Thermodynamics', col: Colors.blue.shade900, img: "assests/images/mech.png", ),
                               CardView(name: 'EEE', col: Colors.blue.shade900, img: "assests/images/mech.png", ),
                                 CardView(name: 'DLD', col: Colors.blue.shade900, img: "assests/images/mech.png",),
                                   GestureDetector(
                                     onTap: (){
                                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectsScreens()));
                                     },
                                     child: CardView(name: 'Mathematics', col: Colors.blue.shade600, img: "assests/images/commonSubjects.png", )),
                                        CardView(name: 'FLAT', col: Colors.yellow.shade900, img: "assests/images/mech.png",),
                  ]  
                  )  
                       ),
              
              
              
            
              
            ],
          ),
          
        ),
      ),
          
    )

    ;
  }
}



class CardView extends StatelessWidget {
  const CardView({
    Key? key, required this.col, required this.img, required this.name,
  }) : super(key: key);
final Color col;
final String img;
final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      color: col,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Container(
      margin: EdgeInsets.only(top: 10,left: 10),
      child: Text(name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),)),
         Flexible(child: Image.asset(img,))
        ],
      ),
    );
  }
}



enum _SelectedTab { home, favorite, search, person }