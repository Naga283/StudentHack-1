// ignore_for_file: prefer_const_constructors

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hakcthon2user/database/dataRetrievalScreen.dart';
import 'package:hakcthon2user/screens/subjectsPage.dart';
import 'package:hakcthon2user/styles/bottomMainPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Authentication/authentication.dart';
import '../Authentication/login.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("English"),value: "English"),
    DropdownMenuItem(child: Text("Telugu"),value: "Telugu"),
    DropdownMenuItem(child: Text("Hindi"),value: "Hindi"),
   
  ];
  return menuItems;
}
   
  @override
  Widget build(BuildContext context) {
    var db= FirebaseDatabase.instance.ref().child("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc");
    var selectedValue = "English";
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20,top: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              
               SizedBox(height: 20,),
                Text("Profile",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w600),),
               
                         SizedBox(height: 20,),
                         TextNames(name1: 'Full Name', name2: 'Naga',),
                         SizedBox(height: 10,),
                         TextNames(name1: 'Email', name2: 'nagabhakar759@gmail.com',),
                         SizedBox(height: 10,),
                         TextNames(name1: 'Password', name2: '*****8',),
                          Row(
                            children: [
                              Text("Language:"),
                              DropdownButton(items: dropdownItems, value: selectedValue, onChanged: (String? value) { 
                                setState(() {
          selectedValue = value!;
        });
                               },)
                            ],
                          )
                         
                        
              
            ],
          ),
          
        ),
      ),
        
    )

    ;
  }
}

class TextNames extends StatelessWidget {
  const TextNames({
    Key? key, required this.name1, required this.name2,
  }) : super(key: key);
final String name1;
final String name2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileMainNames(profileSubName: name1,),
    SizedBox(height: 5,),
    ProfileSubNames(profileMainame: name2,),
    SizedBox(height: 5,),
    Divider(thickness: 2,),
      ],
    );
  }
}

class ProfileSubNames extends StatelessWidget {
  const ProfileSubNames({
    Key? key, required this.profileMainame,
  }) : super(key: key);
final String profileMainame;
  @override
  Widget build(BuildContext context) {
    return Text(profileMainame,style: TextStyle(fontSize: 20),);
  }
}

class ProfileMainNames extends StatelessWidget {
  const ProfileMainNames({
    Key? key, required this.profileSubName,
  }) : super(key: key);
final String profileSubName;
  @override
  Widget build(BuildContext context) {
    return Text(profileSubName,style: TextStyle(fontSize: 18,color: Colors.grey[350]),);
  }
}

