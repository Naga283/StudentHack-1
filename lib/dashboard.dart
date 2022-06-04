import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hakcthon2user/database/dataRetrievalScreen.dart';
import 'package:hakcthon2user/questionPaper/questionPaper.dart';
import 'package:hakcthon2user/screens/courses.dart';
import 'package:hakcthon2user/styles/bottomMainPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'Authentication/authentication.dart';
import 'Authentication/login.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
   TextEditingController uniqueDigit = TextEditingController();
var _currentIndex = 0;
void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  // void _handleIndexChanged(int i) {
  //   setState(() {
  //     _selectedTab = _SelectedTab.values[i];
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    var db= FirebaseDatabase.instance.ref().child("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc");
    
    return 
      
     
       Scaffold(
         body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20,top: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Container(
             margin: EdgeInsets.only(right: 20,top: 10),
             decoration: BoxDecoration(
               border: Border.all(
                     width: 2,
                     color: Colors.blue.shade50,
                     
               ),
               borderRadius: BorderRadius.circular(10)
             ),
             child:Text("")
             
                     )]
                 ) ,
                 SizedBox(height: 20,),
                  Text("Welcome",style: TextStyle(fontSize: 30,color: Colors.grey[400],fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                      Text("Naga !",style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.w600),),
                           SizedBox(height: 20,),
                           Divider(thickness: 4,),
                           SizedBox(height: 10,),
                       Text("Dashboard",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                       SizedBox(height: 20,),
                       Flexible(
                         
                         child: GridView.count(crossAxisCount: 2,
                           
                    crossAxisSpacing: 4.0,  
                    mainAxisSpacing: 8.0,  
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Access Your Paper By Entering Code'),
            content: TextField(
              controller: uniqueDigit,
              decoration:InputDecoration(hintText: 'Enter Unique Id')),
              
            actions: [
              TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuestionPaper(lead: uniqueDigit.text,)));
                
              }, child: Text('Add'),
              
              )
            ],
        );
        });
                        },
                        child: CardView(name: 'Exams', col: Colors.blue, img: "assests/images/exams.png",)),
                             CardView(name: 'Results', col: Colors.blue.shade900, img: "assests/images/results.png",),
                    ]  
                    )  
                         ),
               
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: GestureDetector(
                    onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CourseScreen()));
                    },
                    child: Card(
                       shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
                      color: Colors.amber, 
                    child: Container(
                      margin: EdgeInsets.only(left: 20,top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Question Bank",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                          Image.asset( "assests/images/question1.png",height: 190,width: 400,),
                        ],
                      ),
                    ),
                    ))
                )
                
                
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
         Image.asset(img,)
        ],
      ),
    );
  }
}



enum _SelectedTab { home, favorite, search, person }