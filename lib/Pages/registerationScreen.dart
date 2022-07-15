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
// import 'InfoScreen.dart';
// import 'rounded_button.dart';
// import 'HomePage.dart';
// import 'registerationScreen.dart';
// import 'SecondPage.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
//
//
// class RegisterPortal extends StatefulWidget {
//   static const String id = 'register_portal';
//
//   RegisterPortal({Key key}) : super (key: key);
//
//   @override
//   RegisterPortalState createState() => RegisterPortalState();
//
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
// class RegisterPortalState extends State<RegisterPortal>
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
//           SecondScreen(currentUserId: preferences.getString("id"))));
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
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
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
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             SizedBox(
//               height: 8.0,
//             ),
//
//             Center(
//               child: TypewriterAnimatedTextKit(
//                 text: ['For Freelancers'],
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
//             //   height: 8.0,
//             // ),
//
//
//
//             // GestureDetector(
//             //   onTap: controlSignIn,
//             //   child: RoundedButton(
//             //     title: 'Sign in as a user',
//             //     colour: Colors.lightBlueAccent,
//             //
//             //     // onPressed: () {
//             //     //
//             //     // },
//             //   ),
//             // ),
//             //
//             // SizedBox(
//             //   height: 3.0,
//             // ),
//
//             GestureDetector(
//               onTap: controlSignIn,
//               child: RoundedButton(
//                 title: 'Sign in as a freelancer',
//                 colour: Colors.lightBlueAccent,
//
//                 // onPressed: () {
//                 //   Navigator.pushNamed(context, RegisterPortal.id);
//                 // },
//               ),
//             ),
//
//             Center(
//               child: Linkify(
//                 text: "Help - https://youtu.be/o9Ffx90ZyxE",
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
//           ],
//         ),
//       ),
//     );
//   }
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
//           "freelancers").where("id", isEqualTo: firebaseUser.uid).getDocuments();
//       final List<DocumentSnapshot> documentSnapshots = resultQuery.documents;
//
//
//
//
//
//       if (documentSnapshots.length == 0) {
//         String skilledIn;
//         String phoneNo;
//         String accountNumber;
//         String aadharNo;
//         String institute;
//         String ifscCode;
//
//         // final skilledIn = await Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
//         // final phoneNo = await Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
//         // final aadharNo = await Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
//         // final accountNumber = await Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
//         // final institute = await Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
//         // final ifscCode = await Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
//
//         Firestore.instance.collection("freelancers")
//             .document(firebaseUser.uid)
//             .setData({
//           "nickname": firebaseUser.displayName,
//           "photoUrl": firebaseUser.photoUrl,
//           "id": firebaseUser.uid,
//           "skilledIn": skilledIn,
//           "phoneNo": phoneNo,
//           "aadharNo": aadharNo,
//           "accountNumber" : accountNumber,
//           "institute" : institute,
//           "ifscCode" : ifscCode,
//           "level": "",
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
//        // await preferences.setString("skilledIn", currentUser.skilledIn);
//
//         //await preferences.setString("skilledIn", currentUser.displayName);
//       }
//       else {
//         currentUser = firebaseUser;
//         await preferences.setString("id", documentSnapshots[0] ["id"]);
//         await preferences.setString(
//             "nickname", documentSnapshots[0] ["nickname"]);
//         await preferences.setString(
//             "photoUrl", documentSnapshots[0] ["photoUrl"]);
//         await preferences.setString(
//             "skilledIn", documentSnapshots[0] ["skilledIn"]);
//         await preferences.setString(
//             "phoneNo", documentSnapshots[0] ["phoneNo"]);
//         await preferences.setString(
//             "aadharNo", documentSnapshots[0] ["aadharNo"]);
//         await preferences.setString(
//             "accountNumber", documentSnapshots[0] ["accountNumber"]);
//         await preferences.setString(
//             "institute", documentSnapshots[0] ["institute"]);
//         await preferences.setString(
//             "ifscCode", documentSnapshots[0] ["ifscCode"]);
//
//       }
//       //Fluttertoast.showToast(msg: "you've successfully signed in.");
//       FlutterToast.showToast(
//           msg: "You've successfully signed in",
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
//       Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(currentUserId: firebaseUser.uid)));
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
// }
//
//
// //
// //
// //
// //
// //
// //
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:fluttertoast/fluttertoast.dart';
// // // import 'package:Gogodo/Pages/ChattingPage.dart';
// // // import 'package:Gogodo/Pages/HomePage.dart';
// // // import 'package:Gogodo/main.dart';
// // // import 'rounded_button.dart';
// // // import 'loginScreen.dart';
// // //
// // // class RegisterPortal extends StatelessWidget {
// // //   static const String id = 'register_portal';
// // //   TextEditingController nameTextEditingController = TextEditingController();
// // //   TextEditingController emailTextEditingController = TextEditingController();
// // //   TextEditingController phoneTextEditingController = TextEditingController();
// // //   TextEditingController passwordTextEditingController = TextEditingController();
// // //   TextEditingController jobTextEditingController = TextEditingController();
// // //
// // //
// // //   // const ({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: Padding(
// // //         padding: EdgeInsets.all(8.0),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             SizedBox(height: 45.0,),
// // //             // Image(
// // //             //   image: AssetImage(""),
// // //             //   width: 390.0,
// // //             //   height: 250.0,
// // //             //   alignment: Alignment.center,
// // //             // ),
// // //             SizedBox(height: 1.0,),
// // //             Center(
// // //               child: Text(
// // //                 "Register as a freelancer",
// // //                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900 ),
// // //                 textAlign: TextAlign.center,
// // //               ),
// // //             ),
// // //             Padding(
// // //               padding: EdgeInsets.all(20.0),
// // //               child: Column(
// // //                 children: [
// // //
// // //                   SizedBox(height: 1.0,),
// // //                   TextField(
// // //                     controller: nameTextEditingController,
// // //                     keyboardType: TextInputType.text,
// // //                     decoration: InputDecoration(
// // //                       labelText: "Name",
// // //                       labelStyle: TextStyle(
// // //                         fontSize: 14.0,
// // //                       ),
// // //                       hintStyle: TextStyle(
// // //                         color: Colors.grey,
// // //                         fontSize: 10.0,
// // //                       ),
// // //                     ),
// // //                     style: TextStyle(fontSize: 14.0),
// // //                   ),
// // //
// // //
// // //                   SizedBox(height: 1.0,),
// // //                   TextField(
// // //                     controller: emailTextEditingController,
// // //                     keyboardType: TextInputType.emailAddress,
// // //                     decoration: InputDecoration(
// // //                       labelText: "Email",
// // //                       labelStyle: TextStyle(
// // //                         fontSize: 14.0,
// // //                       ),
// // //                       hintStyle: TextStyle(
// // //                         color: Colors.grey,
// // //                         fontSize: 10.0,
// // //                       ),
// // //                     ),
// // //                     style: TextStyle(fontSize: 14.0),
// // //                   ),
// // //
// // //                   SizedBox(height: 1.0,),
// // //                   TextField(
// // //                     controller: phoneTextEditingController,
// // //                     keyboardType: TextInputType.phone,
// // //                     decoration: InputDecoration(
// // //                       labelText: "Phone",
// // //                       labelStyle: TextStyle(
// // //                         fontSize: 14.0,
// // //                       ),
// // //                       hintStyle: TextStyle(
// // //                         color: Colors.grey,
// // //                         fontSize: 10.0,
// // //                       ),
// // //                     ),
// // //                     style: TextStyle(fontSize: 14.0),
// // //                   ),
// // //
// // //                   SizedBox(height: 1.0,),
// // //                   TextField(
// // //                     controller: jobTextEditingController,
// // //                     keyboardType: TextInputType.text,
// // //                     decoration: InputDecoration(
// // //                       labelText: "Job(CAD/Web development and app development/content writing)",
// // //                       labelStyle: TextStyle(
// // //                         fontSize: 14.0,
// // //                       ),
// // //                       hintStyle: TextStyle(
// // //                         color: Colors.grey,
// // //                         fontSize: 10.0,
// // //                       ),
// // //                     ),
// // //                     style: TextStyle(fontSize: 14.0),
// // //                   ),
// // //
// // //                   SizedBox(height: 1.0,),
// // //                   TextField(
// // //                     controller: passwordTextEditingController,
// // //                     obscureText: true,
// // //                     decoration: InputDecoration(
// // //                       labelText: "Password",
// // //                       labelStyle: TextStyle(
// // //                         fontSize: 14.0,
// // //                       ),
// // //                       hintStyle: TextStyle(
// // //                         color: Colors.grey,
// // //                         fontSize: 10.0,
// // //                       ),
// // //                     ),
// // //                     style: TextStyle(fontSize: 14.0),
// // //                   ),
// // //
// // //                   SizedBox(height: 1.0,),
// // //
// // //                   GestureDetector(
// // //                     // onTap: ,
// // //                     child: RoundedButton(
// // //                       title: 'Register',
// // //                       colour: Colors.deepOrange,
// // //
// // //                       onPressed: () {
// // //                         if(nameTextEditingController.text.length<4)
// // //                         {
// // //                           displayToastMessage("name must contain at least 3 characters", context);
// // //                         }
// // //                         else if(!emailTextEditingController.text.contains("@"))
// // //                         {
// // //                           displayToastMessage("Entered mail id is not valid", context);
// // //                         }
// // //                         else if(phoneTextEditingController.text.isEmpty)
// // //                         {
// // //                           displayToastMessage("Phone number is mandatory", context);
// // //                         }
// // //                         else if(jobTextEditingController.text.length<3)
// // //                         {
// // //                           displayToastMessage("choose either of the one (cad/Coding/content writing)", context);
// // //                         }
// // //                         else if(passwordTextEditingController.text.length <8)
// // //                         {
// // //                           displayToastMessage("Password must contain at least 7 characters", context);
// // //                         }
// // //                         else
// // //                           {
// // //                             registerFreelancer(context);
// // //                           }
// // //
// // //                         },
// // //                     ),
// // //                   ),
// // //
// // //                 ],
// // //               ),
// // //             ),
// // //             TextButton(
// // //               style: TextButton.styleFrom(
// // //                   primary: Colors.purple,
// // //                   textStyle: TextStyle(fontWeight: FontWeight.w900)
// // //               ),
// // //                onPressed: (){
// // //                  Navigator.pushNamed(context, LoginPortal.id);
// // //                },
// // //               child: Text(
// // //                   "Already have an account? Login Here."
// // //               ),
// // //
// // //             ),
// // //
// // //
// // //
// // //
// // //           ],
// // //         ),
// // //       ),
// // //
// // //     );
// // //   }
// // //   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// // //   void registerFreelancer(BuildContext context)async
// // //   {
// // //     final FirebaseUser firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text).catchError((errMsg){
// // //       displayToastMessage("Error: " + errMsg.toString(), context);
// // //     })).user;
// // //     if(firebaseUser != null)
// // //       {
// // //
// // //         Map userDataMap = {
// // //           "Name": nameTextEditingController.text.trim(),
// // //           "Email": emailTextEditingController.text.trim(),
// // //           "Phone": phoneTextEditingController.text.trim(),
// // //           "Job": jobTextEditingController.text.trim(),
// // //
// // //         };
// // //         // usersRef.child(firebaseUser.uid).set(userDataMap);
// // //         displayToastMessage("Hey, your account has been created", context);
// // //
// // //         Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false);
// // //
// // //       }
// // //     else
// // //       {
// // //         displayToastMessage("Freelancer account has not been created", context);
// // //
// // //       }
// // //
// // //   }
// // //
// // // }
// // //
// // // displayToastMessage(String message , BuildContext context)
// // // {
// // //   Fluttertoast.showToast(msg: message);
// // // }
