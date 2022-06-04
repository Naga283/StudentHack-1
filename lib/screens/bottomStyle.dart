import 'package:flutter/material.dart';
class ContanerBut extends StatelessWidget {
  const ContanerBut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}