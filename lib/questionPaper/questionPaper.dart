import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestionPaper extends StatefulWidget {
  const QuestionPaper({ Key? key, required this.lead }) : super(key: key);

final String lead;

  @override
  State<QuestionPaper> createState() => _QuestionPaperState();
}
class _QuestionPaperState extends State<QuestionPaper> {
  var _site ;
  var val;
  bool vis = false;
  int d=0;
  var dataa;
  int a =0;
  int mainindex=0;
   //late int len;
  var controller = ScrollController();
  Multipletest(int a){
   return ListView.builder(
      //  itemCount: len-1,
        itemBuilder: (BuildContext context,int index){


          return  StreamBuilder(
             stream: FirebaseFirestore.instance.collection(widget.lead).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return  Container(
             child: 
             Text(snapshot.data!.docs[a]["Question"][index+1]["QUESTION "].toString()),
                                       );
            }
              );
            
          
        
        }
        );
        
  }
  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(_scrollListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // toolbarHeight: 100,
  //       shape: RoundedRectangleBorder(
  // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
  // ),
        title: Text("Question Paper"),
      ),
      
     
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(widget.lead).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // dataa = snapshot.data?.docs;
          // print(dataa);
          if (snapshot.data != null) {
            
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            Flexible(
              child: ListView.builder(
                controller: controller,
                itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
        
                 itemBuilder: (BuildContext context, int index) { 
                   //len = snapshot.data!.docs[index];
                        
                         mainindex=index;
                  return Card(
                    margin: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 10),
                    elevation: 6,
                   shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
  ),
                    
                    child: Container(
                      margin: EdgeInsets.only(top: 20,left: 10,bottom: 10),
                      child: Column(children: [
                        Container(
                          width: 50,
                          child: Text(snapshot.data!.docs[index]["Question"][1]["QUESTION "].toString()),
                         // child: Multipletest(index),
                          // child: Text((index+1).toString()+") "+snapshot.data!.docs[index][0]["QUESTION "]+" ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          // ),
                          
                        ),
                        SizedBox(height: 10,),
                        Divider(
                          thickness: 2,
                        ),
                        Container(
                           width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.only(left:20,top: 10),
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.docs[index]["Question"][3][" OPTION A "].toString()),
                              Text(snapshot.data!.docs[index]["Question"][3]["OPTION B "].toString()),
                              Text(snapshot.data!.docs[index]["Question"][3]["OPTION C "].toString()),
                              Text(snapshot.data!.docs[index]["Question"][3]["OPTION D"].toString()),
                            ],
                          ),
                        ),
                        
                       
                        ]),
                    ),
                  );
                 },
              ),
            ),
            
          ],
        );
         } 
         else {
            return Center(child: CircularProgressIndicator(

              semanticsValue: "No Data ",
            ));
          }
        
         } )
    );
  }

 void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      
      Future<List<DocumentSnapshot>> fetchNextList(
      List<DocumentSnapshot> documentList) async {
    return (await FirebaseFirestore.instance
            .collection(widget.lead)
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(5)
            .get())
        .docs;
  }
    //  movieListBloc!.fetchNextMovies();
    }
  }
}