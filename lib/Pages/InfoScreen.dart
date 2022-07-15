
// import 'dart:async';
// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:Gogodo/Widgets/ProgressWidget.dart';
// import 'package:Gogodo/main.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:url_launcher/link.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'package:url_launcher/url_launcher.dart';
//
// import 'coin_data.dart';
// import 'rounded_button.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
//
//
//
// class Info extends StatelessWidget {
//   static const String id = 'info';
//
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//         backgroundColor: Colors.lightBlue,
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
//
//
//   @override
//   State createState() => SettingsScreenState();
// }
//
//
//
// class SettingsScreenState extends State<SettingsScreen>
// {
//   //String skilledIn = "click here";
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   final _formKey = GlobalKey<FormState>();
//   //String skilledIn = "content writer";
//   String level = "Beginner";
//   String skilledIn = "";
//   //String phoneNo;
//
//
//   DropdownButton<String> androidDropdown() {
//     List<DropdownMenuItem
//     <String>> dropdownItems = [];
//     for (String currency in currenciesList) {
//       var newItem = DropdownMenuItem(
//         child: Text(currency),
//         value: currency,
//       );
//       dropdownItems.add(newItem);
//     }
//
//     return DropdownButton<String>(
//       value: skilledIn,
//       items: dropdownItems,
//       onChanged: (value) {
//         setState(() {
//           skilledIn = value;
//           //getData();
//         });
//       },
//     );
//   }
//
//   CupertinoPicker iOSPicker() {
//     List<Text> pickerItems = [];
//     for (String currency in currenciesList) {
//       pickerItems.add(Text(currency));
//     }
//
//     return CupertinoPicker(
//       backgroundColor: Colors.teal,
//       itemExtent: 32.0,
//       onSelectedItemChanged: (selectedIndex) {
//         setState(() {
//           skilledIn = currenciesList[selectedIndex];
//           //getData();
//         });
//       },
//       children: pickerItems,
//     );
//   }
//
//
//   DropdownButton<String> androiDropdown() {
//     List<DropdownMenuItem
//     <String>> dropdownItems = [];
//     for (String currency in LevelList) {
//       var newItem = DropdownMenuItem(
//         child: Text(currency),
//         value: currency,
//       );
//       dropdownItems.add(newItem);
//     }
//
//     return DropdownButton<String>(
//       value: level,
//       items: dropdownItems,
//       onChanged: (value) {
//         setState(() {
//           level = value;
//           //getData();
//         });
//       },
//     );
//   }
//
//   CupertinoPicker iOPicker() {
//     List<Text> pickerItems = [];
//     for (String currency in LevelList) {
//       pickerItems.add(Text(currency));
//     }
//
//     return CupertinoPicker(
//       backgroundColor: Colors.teal,
//       itemExtent: 32.0,
//       onSelectedItemChanged: (selectedIndex) {
//         setState(() {
//           level = LevelList[selectedIndex];
//           //getData();
//         });
//       },
//       children: pickerItems,
//     );
//   }
//
//
//
//
//   submitskilledIn(){
//     final form = _formKey.currentState;
//     if(form.validate())
//       {
//         form.save();
//
//         SnackBar snackBar = SnackBar(content: Text("welcome" + skilledIn));
//         //_scaffoldKey.currentState._scaffoldMessenger.showSnackBar();
//         Timer(Duration(seconds: 4),(){
//           Navigator.pop(context, skilledIn);
//         });
//       }
//   }
//   submitphoneNo(){
//     final form = _formKey.currentState;
//     if(form.validate())
//     {
//       form.save();
//
//       SnackBar snackBar = SnackBar(content: Text("welcome" + phoneNo));
//       //_scaffoldKey.currentState._scaffoldMessenger.showSnackBar();
//       Timer(Duration(seconds: 4),(){
//         Navigator.pop(context, skilledIn);
//       });
//     }
//   }
//
//   submitaadharNo(){
//     final form = _formKey.currentState;
//     if(form.validate())
//     {
//       form.save();
//
//       SnackBar snackBar = SnackBar(content: Text("welcome" + aadharNo));
//       //_scaffoldKey.currentState._scaffoldMessenger.showSnackBar();
//       Timer(Duration(seconds: 4),(){
//         Navigator.pop(context, skilledIn);
//       });
//     }
//   }
//
//   submitaccountNumber(){
//     final form = _formKey.currentState;
//     if(form.validate())
//     {
//       form.save();
//
//
//       SnackBar snackBar = SnackBar(content: Text("welcome" + accountNumber));
//       //_scaffoldKey.currentState._scaffoldMessenger.showSnackBar();
//       Timer(Duration(seconds: 4),(){
//         Navigator.pop(context, accountNumber);
//       });
//     }
//   }
//
//   submitinstitute(){
//     final form = _formKey.currentState;
//     if(form.validate())
//     {
//       form.save();
//
//       SnackBar snackBar = SnackBar(content: Text("welcome" + institute));
//       //_scaffoldKey.currentState._scaffoldMessenger.showSnackBar();
//       Timer(Duration(seconds: 4),(){
//         Navigator.pop(context, institute);
//       });
//     }
//   }
//
//
//
//   TextEditingController nicknameTextEditingController;
//   //TextEditingController skilledInTextEditingController;
//   TextEditingController phoneNoTextEditingController;
//   TextEditingController aadharNoTextEditingController;
//   TextEditingController accountNumberTextEditingController;
//   TextEditingController instituteTextEditingController;
//   TextEditingController ifscCodeTextEditingController;
//   TextEditingController edquaTextEditingController;
//   TextEditingController levelTextEditingController;
//   TextEditingController introTextEditingController;
//   TextEditingController experienceTextEditingController;
//   TextEditingController achievementsTextEditingController;
//
//
//
//
//   SharedPreferences preferences;
//
//   String id = "";
//   String intro = "";
//   String nickname ="" ;
//   //String skilledIn = "content writer";
//   String photoUrl = "";
//   String fileUrl = "";
//   String phoneNo = "";
//   String aadharNo = "";
//   String accountNumber = "";
//   String institute = "";
//   String ifscCode = "";
//   String edqua = "";
//   String achievements = "";
//   String experience = "";
//   File imageFileAvatar;
//   bool isLoading = false;
//   final FocusNode nickNameFocusNode = FocusNode();
//   final FocusNode skilledInFocusNode = FocusNode();
//   final FocusNode phoneNoFocusNode = FocusNode();
//   final FocusNode aadharNoFocusNode = FocusNode();
//   final FocusNode accountNumberFocusNode = FocusNode();
//   final FocusNode instituteFocusNode = FocusNode();
//   final FocusNode ifscCodeFocusNode = FocusNode();
//   final FocusNode edquaFocusNode = FocusNode();
//   final FocusNode levelFocusNode = FocusNode();
//   final FocusNode introFocusNode = FocusNode();
//   final FocusNode experienceFocusNode = FocusNode();
//   final FocusNode achievementsFocusNode = FocusNode();
//
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
//     skilledIn = preferences.getString("skilledIn");
//     photoUrl = preferences.getString("photoUrl");
//     fileUrl = preferences.getString("fileUrl");
//     phoneNo = preferences.getString("phoneNo");
//     aadharNo = preferences.getString("aadharNo");
//     accountNumber = preferences.getString("accountNumber");
//     institute = preferences.getString("institute");
//     ifscCode = preferences.getString("ifscCode");
//     edqua = preferences.getString("edqua");
//     level = preferences.getString("level");
//     intro = preferences.getString("intro");
//     experience = preferences.getString("experience");
//     achievements = preferences.getString("achievements");
//
//
//     nicknameTextEditingController = TextEditingController(text: nickname);
//     //skilledInTextEditingController = TextEditingController(text: skilledIn);
//     phoneNoTextEditingController = TextEditingController(text: phoneNo);
//     aadharNoTextEditingController = TextEditingController(text: aadharNo);
//     accountNumberTextEditingController = TextEditingController(text: accountNumber);
//     instituteTextEditingController = TextEditingController(text: institute);
//     ifscCodeTextEditingController = TextEditingController(text: ifscCode);
//     edquaTextEditingController = TextEditingController(text: edqua);
//     levelTextEditingController = TextEditingController(text: level);
//     introTextEditingController = TextEditingController(text: intro);
//     experienceTextEditingController = TextEditingController(text: experience);
//     achievementsTextEditingController = TextEditingController(text: achievements);
//
//
//
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
//   Future getFile() async
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
//           Firestore.instance.collection("freelancers").document(id).updateData({
//
//             "photourl" : photoUrl,
//             "skilledIn": skilledIn,
//             "nickname" : nickname,
//             "phoneNo" : phoneNo,
//             "aadharNo" : aadharNo,
//             "accountNumber" : accountNumber,
//             "institute" : institute,
//             "ifscCode" : ifscCode,
//             "edqua" : edqua,
//             "level" : level,
//             "intro" : intro,
//             "experience": experience,
//             "achievements" : achievements,
//           }).then((data)async{
//             await preferences.setString("photoUrl", photoUrl);
//             //await preferences.setString("fileUrl", fileUrl);
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
//
//
//
// void updateData()
//   {
//     nickNameFocusNode.unfocus();
//     skilledInFocusNode.unfocus();
//     phoneNoFocusNode.unfocus();
//     aadharNoFocusNode.unfocus();
//     accountNumberFocusNode.unfocus();
//     instituteFocusNode.unfocus();
//     ifscCodeFocusNode.unfocus();
//     edquaFocusNode.unfocus();
//     levelFocusNode.unfocus();
//     introFocusNode.unfocus();
//     experienceFocusNode.unfocus();
//     achievementsFocusNode.unfocus();
//
//
//     setState(() {
//       isLoading = false;
//     });
//
//     Firestore.instance.collection("freelancers").document(id).updateData({
//
//       "photourl" : photoUrl,
//       "skilledIn": skilledIn,
//       "nickname" : nickname,
//       "phoneNo" : phoneNo,
//       "aadharNo" : aadharNo,
//       "accountNumber" : accountNumber,
//       "institute" : institute,
//       "ifscCode" : ifscCode,
//       "edqua" : edqua,
//       "level" : level,
//       "intro" : intro,
//       "experience" : experience,
//       "achievements" : achievements,
//     }).then((data)async {
//       await preferences.setString("photoUrl", photoUrl);
//       await preferences.setString("skilledIn", skilledIn);
//       await preferences.setString("nickname", nickname);
//       await preferences.setString("phoneNo", phoneNo);
//       await preferences.setString("aadharNo", aadharNo);
//       await preferences.setString("accountNumber", accountNumber);
//       await preferences.setString("institute", institute);
//       await preferences.setString("ifscCode", ifscCode);
//       await preferences.setString("edqua", edqua);
//       await preferences.setString("level", level);
//       await preferences.setString("intro", intro);
//       await preferences.setString("experience", experience);
//       await preferences.setString("achievements", achievements);
//
//
//
//
//
//       setState(() {
//         isLoading = false;
//       });
//
//      // Fluttertoast.showToast(msg: "updated successfully");
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
//       key: _scaffoldKey,
//       children: [
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: Center(
//                   child: Stack(
//                     children: [
//                       (imageFileAvatar == null)
//                           ? (photoUrl != "")
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
//
//                       "skilled in:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//
//
//                     height: 50.0,
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     color: Colors.lightBlueAccent,
//                     child: Platform.isIOS ? iOSPicker() : androidDropdown(),
//                     //child: Theme(
//
//
//                       key: _formKey,
//                       //data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       // child: TextField(
//                       //   // decoration: InputDecoration(
//                       //   //
//                       //   //   hintText: "Enter the skillset of your expertise ",
//                       //   //   contentPadding:  EdgeInsets.all(5.0),
//                       //   //   hintStyle: TextStyle(color: Colors.grey),
//                       //   // ),
//                       //   controller: skilledInTextEditingController,
//                       //   onChanged: (value){
//                       //     skilledIn = value;
//                       //   },
//                       //   focusNode: skilledInFocusNode,
//                       // ),
//                     //),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//                   Container(
//                     child: Text(
//
//                       "Level:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//
//
//                     height: 50.0,
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     color: Colors.lightBlueAccent,
//                     child: Platform.isIOS ? iOPicker() : androiDropdown(),
//                     //child: Theme(
//
//
//                     //key: _formKey,
//                     //data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                     // child: TextField(
//                     //   // decoration: InputDecoration(
//                     //   //
//                     //   //   hintText: "Enter the skillset of your expertise ",
//                     //   //   contentPadding:  EdgeInsets.all(5.0),
//                     //   //   hintStyle: TextStyle(color: Colors.grey),
//                     //   // ),
//                     //   controller: skilledInTextEditingController,
//                     //   onChanged: (value){
//                     //     skilledIn = value;
//                     //   },
//                     //   focusNode: skilledInFocusNode,
//                     // ),
//                     //),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//                   Container(
//                     child: Text(
//
//                       "phone no:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       //key: _formKey,
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter the number to which your upi is connected ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: phoneNoTextEditingController,
//                         onChanged: (value){
//                           phoneNo = value;
//                         },
//                         focusNode: phoneNoFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//                   Container(
//                     child: Text(
//
//                       "Aadhar Id:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       //key: _formKey,
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter your aadhar id ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: aadharNoTextEditingController,
//                         onChanged: (value){
//                           aadharNo = value;
//                         },
//                         focusNode: aadharNoFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//                   Container(
//                     child: Text(
//
//                       "Account Number:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       //key: _formKey,
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter your bank account number ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: accountNumberTextEditingController,
//                         onChanged: (value){
//                           accountNumber = value;
//                         },
//                         focusNode: accountNumberFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//                   Container(
//                     child: Text(
//
//                       "Name of the institute:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       //key: _formKey,
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter school name/ college name/ office name ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: instituteTextEditingController,
//                         onChanged: (value){
//                           institute = value;
//                         },
//                         focusNode: instituteFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//                   Container(
//                     child: Text(
//
//                       "IFSC code:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       //key: _formKey,
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter your IFSC code ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: ifscCodeTextEditingController,
//                         onChanged: (value){
//                           ifscCode = value;
//                         },
//                         focusNode: ifscCodeFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//                   Container(
//                     child: Text(
//
//                       "Education qualification:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       //key: _formKey,
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Enter your education qualification ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: edquaTextEditingController,
//                         onChanged: (value){
//                           edqua = value;
//                         },
//                         focusNode: edquaFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//                   Container(
//                     child: Text(
//
//                       "Experience:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       //key: _formKey,
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Your experience ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: experienceTextEditingController,
//                         onChanged: (value){
//                           experience = value;
//                         },
//                         focusNode: experienceFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//                   Container(
//                     child: Text(
//
//                       "Achievements:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//                   ),
//                   Container(
//                     child: Theme(
//                       //key: _formKey,
//                       data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Your Accomplishments ",
//                           contentPadding:  EdgeInsets.all(5.0),
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         controller: achievementsTextEditingController,
//                         onChanged: (value){
//                           achievements = value;
//                         },
//                         focusNode: achievementsFocusNode,
//                       ),
//                     ),
//                     margin: EdgeInsets.only(left: 30.0, right: 30.0),
//                   ),
//
//
//
//
//
//
//                   Container(
//                     child: Text(
//
//                       "proof of skill:",
//                       style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
//                     ),
//
//                     margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
//
//
//
//
//                   )],
//                 crossAxisAlignment: CrossAxisAlignment.start,
//               ),
//
//
//
//               Linkify(
//                 text: "Click Here - https://forms.gle/5vyaBhivaSwaqRqh8",
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
//
//
//
//
//               //import 'package:flutter_linkify/flutter_linkify.dart';
//
//   //             Linkify(
//   //             onOpen: (link) => launch("Clicked ${link.url}!"),
//   // text: "Made by https://pub.dev/packages/flutter_linkify",
//   // ),
//
//
//
//
//
//
//
//
//
//   //             Link(
//   //             uri: Uri.parse('https://flutter.dev'),
//   // builder: (BuildContext context, FollowLink followLink) => ElevatedButton(
//   // onPressed: followLink,
//   //   // ... other properties here ...
//   //   )},
//   // );
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
//
//
//                             GestureDetector(
//                               //onTap: updateData,
//                               onTap: () {
//                                 if(nicknameTextEditingController.text.length<4)
//                                 {
//                                   FlutterToast.showToast(
//                                       msg: "Name mut contain at least 3 characters ",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0
//                                   );
//                                   //displayToastMessage("name must contain at least 3 characters", context);
//                                 }
//                                 // else if(!emailTextEditingController.text.contains("@"))
//                                 // {
//                                 //   displayToastMessage("Entered mail id is not valid", context);
//                                 // }
//                                 else if(phoneNoTextEditingController.text.length<9)
//                                 {
//                                   FlutterToast.showToast(
//                                       msg: "Phone number is mandatory",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0
//                                   );
//                                   // displayToastMessage("Phone number is mandatory", context);
//                                 }
//                                 else if(aadharNoTextEditingController.text.length<11)
//                                 {
//                                   FlutterToast.showToast(
//                                       msg: "Invalid aadhaar id",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0
//                                   );
//                                   //displayToastMessage("choose either of the one (cad/Coding/content writing)", context);
//                                 }
//
//                                 else if(experienceTextEditingController.text.length<7)
//                                 {
//                                   FlutterToast.showToast(
//                                       msg: "experience column must contain ateast 6 characters",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0
//                                   );
//                                   //displayToastMessage("choose either of the one (cad/Coding/content writing)", context);
//                                 }
//
//                                 else if(achievementsTextEditingController.text.length>=50)
//                                 {
//                                   FlutterToast.showToast(
//                                       msg: "write your achievements within 50 characters",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0
//                                   );
//                                   //displayToastMessage("choose either of the one (cad/Coding/content writing)", context);
//                                 }
//
//
//                                 else if(edquaTextEditingController.text.length<5)
//                                 {
//                                   FlutterToast.showToast(
//                                       msg: "write your education qualification within 6 characters",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0
//                                   );
//                                   //displayToastMessage("choose either of the one (cad/Coding/content writing)", context);
//                                 }
//
//                                 else if(instituteTextEditingController.text.isEmpty)
//                                 {
//                                   FlutterToast.showToast(
//                                       msg: "Please enter the name of the institute",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0
//                                   );
//                                   //displayToastMessage("Password must contain at least 7 characters", context);
//                                 }
//
//                                 // else if(skilledInTextEditingController.text.isEmpty)
//                                 // {
//                                 //   FlutterToast.showToast(
//                                 //       msg: "Please enter the skill of your expertise",
//                                 //       toastLength: Toast.LENGTH_SHORT,
//                                 //       gravity: ToastGravity.CENTER,
//                                 //       timeInSecForIosWeb: 1,
//                                 //       backgroundColor: Colors.red,
//                                 //       textColor: Colors.white,
//                                 //       fontSize: 16.0
//                                 //   );
//                                 //   //displayToastMessage("Password must contain at least 7 characters", context);
//                                 // }
//                                 else if(accountNumberTextEditingController.text.isEmpty)
//                                 {
//                                   FlutterToast.showToast(
//                                       msg: "Please enter your account number",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0
//                                   );
//                                   //displayToastMessage("Password must contain at least 7 characters", context);
//                                 }
//                                 // else if(photoUrl.isEmpty) {
//                                 //   FlutterToast.showToast(
//                                 //       msg: "Please add a profile picture",
//                                 //       toastLength: Toast.LENGTH_SHORT,
//                                 //       gravity: ToastGravity.CENTER,
//                                 //       timeInSecForIosWeb: 1,
//                                 //       backgroundColor: Colors.red,
//                                 //       textColor: Colors.white,
//                                 //       fontSize: 16.0
//                                 //   );
//                                 // }
//
//                                 // else if(fileUrl==null)
//                                 // {
//                                 // FlutterToast.showToast(
//                                 // msg: "Please add any valid proof of your skill",
//                                 // toastLength: Toast.LENGTH_SHORT,
//                                 // gravity: ToastGravity.CENTER,
//                                 // timeInSecForIosWeb: 1,
//                                 // backgroundColor: Colors.red,
//                                 // textColor: Colors.white,
//                                 // fontSize: 16.0
//                                 // );
//                                 //   //displayToastMessage("Password must contain at least 7 characters", context);
//                                 // }
//                                 else
//                                 {
//                                   updateData();
//                                 }
//
//                               },
//                               child: RoundedButton(
//                                 title: 'Update',
//                                 colour: Colors.lightBlueAccent,
//
//                                 // onPressed: () {
//                                 //
//                                 // },
//                               ),
//                             ),
//
//                             GestureDetector(
//                               onTap: logoutUser,
//                               child: RoundedButton(
//                                 title: 'Log out',
//                                 colour: Colors.red,
//
//                                 // onPressed: () {
//                                 //
//                                 // },
//                               ),
//                             ),
//                             // Container(
//                             //   child: TextButton(
//                             //     onPressed: updateData,
//                             //     child: Text(
//                             //       "Update",style: TextStyle(fontSize: 16.0),
//                             //     ),
//                             //     style: TextButton.styleFrom(
//                             //       primary: Colors.white,
//                             //       shadowColor: Colors.grey,
//                             //       backgroundColor: Colors.lightBlueAccent,
//                             //       padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
//                             //
//                             //     ),
//                             //
//                             //
//                             //   ),
//                             //   margin: EdgeInsets.only(top: 50.0 , bottom: 1.0),
//                             // ),
//
//                             // Padding(
//                             //   padding: EdgeInsets.only(left: 50.0 , right: 50.0),
//                             //   child: ElevatedButton(
//                             //     style: ElevatedButton.styleFrom(
//                             //       primary: Colors.red, // background
//                             //       onPrimary: Colors.white, // foreground
//                             //       textStyle: TextStyle(color: Colors.white, fontSize: 14.0,)
//                             //     ),
//                             //     onPressed: () {
//                             //       logoutUser();
//                             //     },
//                             //     child: Text("Log out"),
//                             //
//                             //
//                             //   ),
//                             //
//                             // ),
//
//                           ],
//                         ),
//               ),
//       ],
//     );
//
//   }
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
//   // _launchURL() async {
//   //   const url = 'https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget';
//   //   if (await canLaunch(url)) {
//   //     await launch(url);
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }
// }
//
//
