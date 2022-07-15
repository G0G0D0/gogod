// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:Gogodo/Pages/HomePage.dart';
// import 'package:Gogodo/Widgets/ProgressWidget.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'rounded_button.dart';
// import 'HomePage.dart';
// import 'registerationScreen.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
//
// class LoginScreen extends StatefulWidget {
//   static const String id = 'login_screen';
//   LoginScreen({Key  key}) : super (key : key);
//
//   @override
//   LoginScreenState createState() => LoginScreenState();
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
// class LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences preferences;
//   bool isLoggedIn = false;
//   bool isLoading = false;
//   FirebaseUser currentUser;
//   AnimationController controller;
//   Animation animation;
//   NativeAd nativeAd;
//   bool isLoaded=false;
//
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     nativeAd=NativeAd(adUnitId: "ca-app-pub-1836626178823657/8909511879"
//       , factoryId: "listTile", listener: NativeAdListener(
//           onAdLoaded: (_)
//           {
//             setState(() {
//               isLoaded=true;
//             });
//             print("Ad Loaded");
//           },
//
//           onAdFailedToLoad: (ad,error){
//             print("Ad Failed To Load");
//             ad.dispose();
//
//           }
//       ),
//       request: AdRequest(),);
//     nativeAd.load();
//   }
//
//
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     isSignedIn();
//
//     controller =
//         AnimationController(duration: Duration(seconds: 1), vsync: this);
//     animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(
//         controller);
//
//     controller.forward();
//     controller.addListener(() {
//       setState(() {});
//     });
//   }
//
//   void isSignedIn() async {
//     this.setState(() {
//       isLoggedIn = true;
//     });
//     preferences = await SharedPreferences.getInstance();
//
//     isLoggedIn = await googleSignIn.isSignedIn();
//     if (isLoggedIn) {
//       Navigator.push(context, MaterialPageRoute(builder: (context) =>
//           HomeScreen(currentUserId: preferences.getString("id"))));
//     }
//     this.setState(() {
//       isLoading = false;
//     });
//   }
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
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             // Container(
//             //
//             //   height: 500,
//             //   //width: 800,
//             //   child: isLoaded? AdWidget(ad: nativeAd,):
//             //   Center(
//             //     child: Text("Add Is Loading..."),
//             //   ),
//             // ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//
//
//
//                 // Hero(
//                 // tag: 'logo',
//                 // child: Container(
//                 // child: Image.asset('images/logo.png'),
//                 // height: 60.0,
//                 // ),
//                 // ),
//                 Center(
//                   child: TypewriterAnimatedTextKit(
//                     text: ['Gogodo'],
//                     textStyle: TextStyle(
//                       fontSize: 45.0,
//                       //fontFamily: 'Bangers',
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                 ),
//
//
//               ],
//             ),
//
//             SizedBox(
//               height: 8.0,
//             ),
//
//             Center(
//               child: TypewriterAnimatedTextKit(
//                 text: ['For Clients'],
//                 textStyle: TextStyle(
//                   fontSize: 15.0,
//                   //fontFamily: 'Bangers',
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//
//             Container(
//
//               height: 500,
//               //width: 800,
//               child: isLoaded? AdWidget(ad: nativeAd,):
//               Center(
//                 //child: Text("Add Is Loading..."),
//               ),
//             ),
//
//
//
//             // SizedBox(
//             //   height: 1.0,
//             // ),
//             GestureDetector(
//               onTap: controlSignIn,
//               child: RoundedButton(
//                 title: 'Sign in as a client',
//                 colour: Colors.lightBlueAccent,
//
//                 // onPressed: () {
//                 //
//                 // },
//               ),
//             ),
//
//             Center(
//               child: Linkify(
//                 text: "Help - https://youtu.be/05U4Ng2ExcI",
//                 style: TextStyle(color: Colors.black),
//                 onOpen: (link) {
//                   launch(link.url);
//                   print("opened succesfully ${link.url}");
//                 },
//                 linkStyle: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline),
//               ),
//             ),
//
//             SizedBox(
//               height: 28.0,
//             ),
//
//             Center(
//               child: Linkify(
//                 text: "Privacy Policy - https://g0g0d0.github.io/Gogodo-Privacy-Policy/",
//                 style: TextStyle(color: Colors.black),
//                 onOpen: (link) {
//                   launch(link.url);
//                   print("opened succesfully ${link.url}");
//                 },
//                 linkStyle: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline),
//               ),
//             ),
//
//
//
//             // GestureDetector(
//             //   //onTap: controlIn,
//             //   child: RoundedButton(
//             //     title: 'Sign in as a freelancer',
//             //     colour: Colors.lightBlueAccent,
//             //
//             //      // onPressed: () {
//             //      //   Navigator.pushNamed(context, RegisterPortal.id);
//             //      // },
//             //    ),
//             //  ),
//
//
//            ],
//          ),
//        ),
//      );
//    }
//
//   Future<Null> controlSignIn() async
//   {
//     preferences = await SharedPreferences.getInstance();
//     this.setState(() {
//       isLoading = true;
//     });
//
//     GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     GoogleSignInAuthentication googleAuthentication = await googleUser
//         .authentication;
//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//         idToken: googleAuthentication.idToken,
//         accessToken: googleAuthentication.idToken);
//     FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(
//         credential)).user;
//     if (firebaseUser != null) {
//       final QuerySnapshot resultQuery = await Firestore.instance.collection(
//           "users").where("id", isEqualTo: firebaseUser.uid).getDocuments();
//       final List<DocumentSnapshot> documentSnapshots = resultQuery.documents;
//
//       if (documentSnapshots.length == 0) {
//         Firestore.instance.collection("users")
//             .document(firebaseUser.uid)
//             .setData({
//           "nickname": firebaseUser.displayName,
//           "photoUrl": firebaseUser.photoUrl,
//           "id": firebaseUser.uid,
//           "aboutMe": "i am using gogodo",
//           "createdAt": DateTime
//               .now()
//               .millisecondsSinceEpoch
//               .toString(),
//           "Discussingwith": null,
//
//
//         });
//
//         currentUser = firebaseUser;
//         await preferences.setString("id", currentUser.uid);
//         await preferences.setString("nickname", currentUser.displayName);
//         await preferences.setString("photoUrl", currentUser.photoUrl);
//       }
//       else {
//         currentUser = firebaseUser;
//         await preferences.setString("id", documentSnapshots[0] ["id"]);
//         await preferences.setString(
//             "nickname", documentSnapshots[0] ["nickname"]);
//         await preferences.setString(
//             "photoUrl", documentSnapshots[0] ["photoUrl"]);
//         await preferences.setString(
//             "aboutMe", documentSnapshots[0] ["aboutMe"]);
//       }
//       //Fluttertoast.showToast(msg: "you've successfully signed in.");
//       FlutterToast.showToast(
//           msg: "you've successfully signed in",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0
//       );
//       this.setState(() {
//         isLoading = false;
//       });
//
//       Navigator.push(context, MaterialPageRoute(
//           builder: (context) => HomeScreen(currentUserId: firebaseUser.uid)));
//     }
//     else {
//       //Fluttertoast.showToast(msg: "Try again , sign in failed.");
//       FlutterToast.showToast(
//           msg: "Try again, sign in failed",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0
//       );
//       this.setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//
//
//
//
// }
//
//
// //{
//
//
//
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topRight,
// //             end: Alignment.bottomLeft,
// //             colors: [Colors.white,Colors.white],
// //
// //           )
// //         ),
// //         alignment: Alignment.center,
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //            children: <Widget> [
// //
// //                Text(
// //                 'Gogodu',
// //                 style: TextStyle(fontSize: 82.0, color: Colors.black, fontFamily: "Signatra"),
// //               ),
// //             GestureDetector(
// //               child: Center(
// //                 child: Column(
// //                    children: [
// //                     Container(
// //                       width: 270,
// //                       height: 65.0,
// //                       decoration: BoxDecoration(
// //                         image: DecorationImage(
// //                            image: AssetImage("assets/images/google_signin_button.png"),
// //                                fit: BoxFit.cover,
// //                         ),
// //                       ),
// //                     ),
// //                     Padding(padding: EdgeInsets.all(1.0),
// //                     child: circularProgress(),
// //                     )
// //                 ],
// //                 ),
// //               ),
// //             ),
// //         ],
// //         ),
// //       )
// //     );
// //
// //
// //   }
// //
// // }
