

// ignore_for_file: prefer_null_aware_operators

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hakcthon2user/screens/bottomStyle.dart';

class RetreiveData extends StatefulWidget {
  const RetreiveData({ Key? key }) : super(key: key);

  @override
  State<RetreiveData> createState() => _RetreiveDataState();
}

class _RetreiveDataState extends State<RetreiveData> {
  var val;
  final dref = FirebaseDatabase.instance.ref().child("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc");
    late DatabaseReference databaseReference ;
    List r=[];
  
    
  // showData(){
  //   dref.once().then((event) {
  //     var val =event.snapshot.value as List;
  //     print(event.snapshot.value);
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    databaseReference = dref;
  }
  @override
  Widget build(BuildContext context) {
  //  print(showData());
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        actions:
        
        [
          ContanerBut()
        ]
        ),
      ),
      body: FirebaseAnimatedList(
        shrinkWrap: true,
        query: databaseReference, itemBuilder: (BuildContext context,DataSnapshot dataSnapshot,Animation animation,int index){
          var res =dataSnapshot.value as List; 
          r = res;
         
         
      return DataRetrieval(r: r);
      }),
      
    );

  }
}

class DataRetrieval extends StatefulWidget {
  const DataRetrieval({
    Key? key,
    required this.r,
  }) : super(key: key);

  final List r;

  @override
  State<DataRetrieval> createState() => _DataRetrievalState();
}

class _DataRetrievalState extends State<DataRetrieval> {
    bool ans = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
     stream: FirebaseDatabase.instance.ref().onValue,
      builder: (context,databaseEvent){
    
      
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
           itemCount:  widget.r.length !=0 ? widget.r.length:0,
          itemBuilder: (BuildContext context,int index) {
         
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Text("${index+1}) ",style: TextStyle(fontSize:20)),
                   Flexible(child: Text("${widget.r[index]["QUESTION "]}",style: TextStyle(fontSize:20),)),
               ],),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  padding: EdgeInsets.only(bottom: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: 10,),
                  Text("a) ${widget.r[index][" OPTION A "]}"),
                   Text("b) ${widget.r[index]["OPTION B "]}"),
                   Text("c) ${widget.r[index]["OPTION C "]}"),
                   Text("d) ${widget.r[index]["OPTION D"]}")
      
                    ],
                  ),
                )
               ,
               FlatButton(onPressed: (){
                 setState(() {
                   
                   if(ans == false){
                     ans = true;
                     
                     print(index+1);
                   }
                   else{
                     ans = false;
                   }
                 
                 });
               }, child: Text("View Option")),
               Visibility(
                 visible: ans,
                 child: Text("${widget.r[index]["CORRECT OPTION "]}"))
              ],
            ),
          );
        }),
      );
    });
  }
}