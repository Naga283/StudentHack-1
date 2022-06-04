import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hakcthon2user/Authentication/emailOTp.dart';
import 'package:hakcthon2user/Authentication/login.dart';
import 'package:hakcthon2user/screens/courses.dart';
import 'package:hakcthon2user/screens/profile.dart';
import 'package:hakcthon2user/styles/bottomMainPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'dashboard.dart';
void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "WorkSan",
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Bottom(),
      
      ),
    );
  }
}
