// import 'package:firebase_core/firebase_core.dart';
// //import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:Gogodo/Pages/AccountSettingsPage.dart' as S;
// import 'package:Gogodo/Pages/ChattingPage.dart';
// import 'package:Gogodo/Pages/ConfirmationPage.dart';
// import 'package:Gogodo/Pages/HomePage.dart';
// import 'package:Gogodo/Pages/SecondPage.dart';
// import 'package:Gogodo/Pages/loginScreen.dart';
// import 'package:Gogodo/Pages/registerationScreen.dart';
// import 'Pages/LoginPage.dart';
// import 'Pages/PaymentGate.dart';
// import 'Pages/loginScreen.dart';
// import 'Pages/registerationScreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'Models/user.dart';
// import 'Pages/ConfirmationPage.dart';
//
//
//
// void main() async
// {
//
//   runApp(MyApp());
// }
//
// // DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("freelancer");
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       routes: {
//         PaymentGate.id : (context) => PaymentGate(),
//         LoginScreen.id : (context) => LoginScreen(),
//         //LoginPortal.id : (context)=> LoginPortal(),
//         RegisterPortal.id : (context)=> RegisterPortal(),
//         Chat.id : (context)=> Chat(),
//         HomeScreen.id: (context)=> HomeScreen(),
//         SecondScreen.id: (context)=> SecondScreen(),
//         Confirm.id: (context)=>Confirm(),
//         // Settings.id: (context)
//          //=> Settings(),
//
//       },
//       title: 'Telegram Clone',
//       theme: ThemeData(
//         primaryColor: Colors.lightBlueAccent,
//       ),
//
//       navigatorKey: GlobalVariable.navState,
//       //debugShowCheckedModeBanner: false,
//       home: RegisterPortal(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class GlobalVariable {
//   static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
// }
