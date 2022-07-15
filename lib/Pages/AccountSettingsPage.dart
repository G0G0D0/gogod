// import 'dart:async';
// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:Gogodo/Widgets/ProgressWidget.dart';
// import 'package:Gogodo/main.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import 'rounded_button.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
//
//
// class Settings extends StatelessWidget {
//   static const String id = 'settings';
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//         backgroundColor: Colors.teal,
//         title: Text(
//           "Account Settings",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: SettingsScreen(),
//     );
//
//   }
// }
//
//
// class SettingsScreen extends StatefulWidget {
//   @override
//   State createState() => SettingsScreenState();
// }
//
//
//
// class SettingsScreenState extends State<SettingsScreen>
// {
//   NativeAd nativeAd;
//   bool isLoaded=false;
//   TextEditingController nicknameTextEditingController;
//   TextEditingController aboutMeTextEditingController;
//
//   SharedPreferences preferences;
//
//   String id = "";
//   String nickname = "";
//   String aboutMe = "";
//   String photoUrl = "";
//   File imageFileAvatar;
//   bool isLoading = false;
//   final FocusNode nickNameFocusNode = FocusNode();
//   final FocusNode aboutMeFocusNode = FocusNode();
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
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     readDataFromLocal();
//   }
//
//   void readDataFromLocal()async
//   {
//
//     preferences = await SharedPreferences.getInstance();
//
//     id = preferences.getString("id");
//     nickname = preferences.getString("nickname");
//     aboutMe = preferences.getString("aboutMe");
//     photoUrl = preferences.getString("photoUrl");
//
//     nicknameTextEditingController = TextEditingController(text: nickname);
//     aboutMeTextEditingController = TextEditingController(text: aboutMe);
//
//     setState(() {
//
//     });
//
//
//
//   }
//
//   Future getImage() async
//   {
//     File newImageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//     if(newImageFile != null) {
//       setState(() {
//         this.imageFileAvatar = newImageFile;
//         isLoading = true;
//       });
//     }
//
//     uploadImageFirestoreAndStorage();
//   }
//
//   Future uploadImageFirestoreAndStorage() async {
//     String mFileName = id;
//
//     StorageReference storageReference = FirebaseStorage.instance.ref().child(mFileName);
//     StorageUploadTask storageUploadTask = storageReference.putFile(imageFileAvatar);
//     StorageTaskSnapshot storageTaskSnapshot;
//     storageUploadTask.onComplete.then((value)
//     {
//       if(value.error == null)
//       {
//         storageTaskSnapshot = value;
//
//         storageTaskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl)
//         {
//           photoUrl = newImageDownloadUrl;
//
//           Firestore.instance.collection("users").document(id).updateData({
//
//             "photourl" : photoUrl,
//             "aboutMe": aboutMe,
//             "nickname" : nickname,
//           }).then((data)async{
//             await preferences.setString("photoUrl", photoUrl);
//             setState(() {
//               isLoading = false;
//             });
//
//             //Fluttertoast.showToast(msg: "updated successfully");
//             FlutterToast.showToast(
//                 msg: "updated successfully",
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 16.0
//             );
//           });
//
//
//         }, onError: (errorMsg)
//         {
//           setState(() {
//             isLoading = false;
//           });
//           //Fluttertoast.showToast(msg: "Error occurred...");
//           FlutterToast.showToast(
//               msg: "Error occurred",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.CENTER,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.red,
//               textColor: Colors.white,
//               fontSize: 16.0
//           );
//
//         });
//
//       }
//
//     },onError: (errorMsg)
//     {
//
//       setState(() {
//         isLoading = false;
//       });
//       //Fluttertoast.showToast(msg: errorMsg.toString());
//       FlutterToast.showToast(
//           msg: errorMsg.toString(),
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0
//       );
//     });
//   }
//
//   void updateData()
//   {
//     nickNameFocusNode.unfocus();
//     aboutMeFocusNode.unfocus();
//
//     setState(() {
//       isLoading = false;
//     });
//
//     Firestore.instance.collection("users").document(id).updateData({
//
//       "photourl" : photoUrl,
//       "aboutMe": aboutMe,
//       "nickname" : nickname,
//     }).then((data)async {
//       await preferences.setString("photoUrl", photoUrl);
//       await preferences.setString("aboutMe", aboutMe);
//       await preferences.setString("nickname", nickname);
//       setState(() {
//         isLoading = false;
//       });
//
//       //Fluttertoast.showToast(msg: "updated successfully");
//       FlutterToast.showToast(
//           msg: "updated successfully",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0
//       );
//     });
//
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return Stack(
//       children: [
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: Center(
//                   child: Stack(
//                     children: [
//                       (imageFileAvatar == null)
//                       ? (photoUrl != "")
//                           ?Material(
//
//                         child: CachedNetworkImage(
//                           placeholder: (context, url) => Container(
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2.0,
//                               valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
//                             ),
//                             width: 200.0,
//                             height: 200.0,
//                             padding: EdgeInsets.all(20.0),
//                           ),
//                           imageUrl: photoUrl,
//                           height: 200.0,
//                           width: 200.0,
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(125.0)),
//                         clipBehavior: Clip.hardEdge,
//                       )
//                           : Icon(Icons.account_circle, size: 90.0, color: Colors.grey,)
//                           : Material(
//                         child: Image.file(
//                           imageFileAvatar,
//                           width: 200.0,
//                           height: 200.0,
//                           fit: BoxFit.cover,
//                         ),
//
//                       ),
//
//
//                       IconButton(
//                         icon: Icon(
//                           Icons.camera_alt, size: 100.0, color: Colors.white54.withOpacity(0.3),
//                         ),
//                         onPressed: getImage,
//                         padding: EdgeInsets.all(0.0),
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.grey,
//                         iconSize: 200.0,
//
//                       ),
//
//                     ],
//                   ),
//                 ),
//                 width: double.infinity,
//                 margin: EdgeInsets.all(20.0),
//               ),
//               Column(
//                 children: [
//                   Padding(padding: EdgeInsets.all(1.0), child: isLoading ? circularProgress() : Container(),),
//                   Container(
//                     child: Text(
//                       "Profile Name:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "e.g Tony Stark ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: nicknameTextEditingController,
//                         onChanged: (value){
//                           nickname = value;
//                         },
//                         focusNode: nickNameFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//                   Container(
//                     child: Text(
//                       "About Me:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "write your bio... ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: aboutMeTextEditingController,
//                         onChanged: (value){
//                           aboutMe = value;
//                         },
//                         focusNode: aboutMeFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//                 ],
//                 crossAxisAlignment: CrossAxisAlignment.start,
//               ),
//               GestureDetector(
//                 onTap: updateData,
//                 child: RoundedButton(
//                   title: 'Update',
//                   colour: Colors.lightBlueAccent,
//
//                   // onPressed: () {
//                   //
//                   // },
//                 ),
//               ),
//
//               GestureDetector(
//                 onTap: logoutUser,
//                 child: RoundedButton(
//                   title: 'Log out',
//                   colour: Colors.red,
//
//                   // onPressed: () {
//                   //
//                   // },
//                 ),
//               ),
//
//
//
//
//
//
//
//
//
//
//     // Container(
//                //   child: TextButton(
//                //     onPressed: updateData,
//                //     child: Text(
//                //       "Update",style: TextStyle(fontSize: 16.0),
//                //     ),
//                //     style: TextButton.styleFrom(
//                //       primary: Colors.white,
//                //       shadowColor: Colors.grey,
//                //       backgroundColor: Colors.lightBlueAccent,
//                //       padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
//                //
//                //     ),
//                //
//                //
//                //   ),
//                //   margin: EdgeInsets.only(top: 50.0 , bottom: 1.0),
//                // ),
//
//               // Padding(
//               //   padding: EdgeInsets.only(left: 50.0 , right: 50.0),
//               //   child: ElevatedButton(
//               //     style: ElevatedButton.styleFrom(
//               //       primary: Colors.red, // background
//               //       onPrimary: Colors.white, // foreground
//               //       textStyle: TextStyle(color: Colors.white, fontSize: 14.0,)
//               //     ),
//               //     onPressed: () {
//               //       logoutUser();
//               //     },
//               //     child: Text("Log out"),
//               //
//               //
//               //   ),
//               //
//               // ),
//
//             ],
//           ),
//
//           padding: EdgeInsets.only(left: 15.0, right: 15.0),
//         ),
//       ],
//     );
//
//
//
//
//
//
//   }
//
//
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   Future<Null> logoutUser()async
//   {
//
//     await FirebaseAuth.instance.signOut();
//     await googleSignIn.disconnect();
//     await googleSignIn.signOut();
//
//     this.setState(() {
//       isLoading = false;
//     });
//
//     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp()),(Route<dynamic> route)=>false);
//   }
// }
