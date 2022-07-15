// import 'dart:async';
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:Gogodo/Pages/HomePage.dart';
// import 'package:Gogodo/Pages/LoginPage.dart';
// import 'package:Gogodo/Widgets/ProgressWidget.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'rounded_button.dart';
// import 'RoundButton.dart';
// import 'HomePage.dart';
// import 'registerationScreen.dart';
//
//
// class LogReg extends StatefulWidget {
//   static const String id = 'log_Reg';
//   LogReg({Key  key}) : super (key : key);
//
//   @override
//   LogRegState createState() => LogRegState();
// }
//
// // class LoginScreenState {
// // }
//
//
//
//
//
//
// class LogRegState extends State<LogReg>
//     with SingleTickerProviderStateMixin {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences preferences;
//   bool isLoggedIn = false;
//   bool isLoading = false;
//   FirebaseUser currentUser;
//   AnimationController controller;
//   Animation animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//    // isSignedIn();
//
//     controller =
//         AnimationController(duration: Duration(seconds: 1), vsync: this);
//     animation = ColorTween(begin: Colors.green, end: Color.fromARGB(255, 126, 217, 86)).animate(
//         controller);
//
//     controller.forward();
//     controller.addListener(() {
//       setState(() {});
//     });
//   }
//
//   // void isSignedIn() async {
//   //   this.setState(() {
//   //     isLoggedIn = true;
//   //   });
//   //   preferences = await SharedPreferences.getInstance();
//   //
//   //   isLoggedIn = await googleSignIn.isSignedIn();
//   //   if (isLoggedIn) {
//   //     Navigator.push(context, MaterialPageRoute(builder: (context) =>
//   //         HomeScreen(currentUserId: preferences.getString("id"))));
//   //   }
//   //   this.setState(() {
//   //     isLoading = false;
//   //   });
//   // }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: animation.value,
//        body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: Hero(
//                     tag: 'logo',
//                     child: Container(
//                     child: Image.asset('images/logoss.png'),
//                     height: 300.0,
//                       width: 350.0,
//
//                     ),
//                      ),
//                   ),
//                   // Center(
//                   //   child: TypewriterAnimatedTextKit(
//                   //     text: ['Gogodo'],
//                   //     textStyle: TextStyle(
//                   //       fontSize: 45.0,
//                   //       fontFamily: 'Bangers',
//                   //       fontStyle: FontStyle.italic ,
//                   //       color: Colors.white,
//                   //       fontWeight: FontWeight.w900,
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//
//               // SizedBox(
//               //   height: 8.0,
//               // ),
//
//               // Center(
//               //   child: TypewriterAnimatedTextKit(
//               //     text: ['Power Your Project'],
//               //     textStyle: TextStyle(
//               //       fontSize: 15.0,
//               //       //fontFamily: 'Bangers',
//               //         fontStyle: FontStyle.italic,
//               //       fontWeight: FontWeight.w900,
//               //       color: Colors.white
//               //     ),
//               //   ),
//               // ),
//
//               // SizedBox(
//               //   height: 48.0,
//               // ),
//
//                  GestureDetector(
//
//                   //onTap: controlSignIn,
//
//                     //children: [Expanded( )],
//                     child: RoundButton(
//
//                       title: 'User',
//                       colour: Colors.black,
//                       onPressed: () {
//                         Navigator.pushNamed(context, LoginScreen.id);
//                       },
//
//
//                     ),
//
//                 ),
//
//
//               SizedBox(
//                 height: 3.0,
//               ),
//
//               GestureDetector(
//
//                   //onTap: controlIn,
//                   child: RoundedButton(
//                     title: 'Freelancer',
//                     colour: Colors.white,
//
//                     onPressed: () {
//                       Navigator.pushNamed(context, RegisterPortal.id);
//                     },
//                   ),
//
//                 ),
//
//
//
//             ],
//           ),
//         ),
//
//     );
//   }
//
//   // Future<Null> controlSignIn() async
//   // {
//   //   preferences = await SharedPreferences.getInstance();
//   //   this.setState(() {
//   //     isLoading = true;
//   //   });
//   //
//   //   GoogleSignInAccount googleUser = await googleSignIn.signIn();
//   //   GoogleSignInAuthentication googleAuthentication = await googleUser
//   //       .authentication;
//   //   final AuthCredential credential = GoogleAuthProvider.getCredential(
//   //       idToken: googleAuthentication.idToken,
//   //       accessToken: googleAuthentication.idToken);
//   //   FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(
//   //       credential)).user;
//   //   if (firebaseUser != null) {
//   //     final QuerySnapshot resultQuery = await Firestore.instance.collection(
//   //         "users").where("id", isEqualTo: firebaseUser.uid).getDocuments();
//   //     final List<DocumentSnapshot> documentSnapshots = resultQuery.documents;
//   //
//   //     if (documentSnapshots.length == 0) {
//   //       Firestore.instance.collection("users")
//   //           .document(firebaseUser.uid)
//   //           .setData({
//   //         "nickname": firebaseUser.displayName,
//   //         "photoUrl": firebaseUser.photoUrl,
//   //         "id": firebaseUser.uid,
//   //         "aboutMe": "i am using gogodo",
//   //         "createdAt": DateTime
//   //             .now()
//   //             .millisecondsSinceEpoch
//   //             .toString(),
//   //         "Discussingwith": null,
//   //
//   //
//   //       });
//   //
//   //       currentUser = firebaseUser;
//   //       await preferences.setString("id", currentUser.uid);
//   //       await preferences.setString("nickname", currentUser.displayName);
//   //       await preferences.setString("photoUrl", currentUser.photoUrl);
//   //     }
//   //     else {
//   //       currentUser = firebaseUser;
//   //       await preferences.setString("id", documentSnapshots[0] ["id"]);
//   //       await preferences.setString(
//   //           "nickname", documentSnapshots[0] ["nickname"]);
//   //       await preferences.setString(
//   //           "photoUrl", documentSnapshots[0] ["photoUrl"]);
//   //       await preferences.setString(
//   //           "aboutMe", documentSnapshots[0] ["aboutMe"]);
//   //     }
//   //     Fluttertoast.showToast(msg: "you've successfully signed in.");
//   //     this.setState(() {
//   //       isLoading = false;
//   //     });
//   //
//   //     Navigator.push(context, MaterialPageRoute(
//   //         builder: (context) => HomeScreen(currentUserId: firebaseUser.uid)));
//   //   }
//   //   else {
//   //     Fluttertoast.showToast(msg: "Try again , sign in failed.");
//   //     this.setState(() {
//   //       isLoading = false;
//   //     });
//   //   }
//   // }
//
//
//
// }
