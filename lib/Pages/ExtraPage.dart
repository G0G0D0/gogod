import 'package:flutter/material.dart';
import 'package:Gogodo/models/user.dart' ;
import 'package:Gogodo/Pages/ChattingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


// class Extra extends StatefulWidget {
//    final User receiverId;
//   String nickname;
//   String skilledIn;
//
//    Extra({Key key,  @required this.receiverId ,@required this.nickname, @required this.skilledIn,}) : super(key: key);
//   static String id = 'Extra';
//
//   @override
//   _ExtraState createState() => _ExtraState(this.receiverId);
// }
//
// class _ExtraState extends State<Extra> {
//
//   SharedPreferences preferences;
//
//   String id = "";
//   String nickname = "";
//   String skilledIn = "";
//   String photoUrl = "";
//   String fileUrl = "";
//   String phoneNo = "";
//   String aadharNo = "";
//   String accountNumber = "";
//   String institute = "";
//   String ifscCode = "";
//   String chatId;
//   //String receiverId = "";
//   //File imageFileAvatar;
//   bool isLoading = false;
//   final FocusNode nickNameFocusNode = FocusNode();
//   final FocusNode skilledInFocusNode = FocusNode();
//   final FocusNode phoneNoFocusNode = FocusNode();
//   final FocusNode aadharNoFocusNode = FocusNode();
//   final FocusNode accountNumberFocusNode = FocusNode();
//   final FocusNode instituteFocusNode = FocusNode();
//   final FocusNode ifscCodeFocusNode = FocusNode();
//   var receiverId;
//   // String nickname;
//   // String skilledIn;
//   _ExtraState(this.receiverId);
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
//     receiverId = preferences.getString("receiverId");
//
//     // nicknameTextEditingController = TextEditingController(text: nickname);
//     // skilledInTextEditingController = TextEditingController(text: skilledIn);
//     // phoneNoTextEditingController = TextEditingController(text: phoneNo);
//     // aadharNoTextEditingController = TextEditingController(text: aadharNo);
//     // accountNumberTextEditingController = TextEditingController(text: accountNumber);
//     // instituteTextEditingController = TextEditingController(text: institute);
//     // ifscCodeTextEditingController = TextEditingController(text: ifscCode);
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
//
//   @override
//    void data(){
//     // TODO: implement initState
//     super.initState();
//     isLoading = false;
//     chatId = "";
//     readLocal();
//   }
//
//   // @override
//   //  {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   isLoading = false;
//   //   chatId = "";
//   //   readLocal();
//   // }
//
//   readLocal()async
//   {
//     preferences = await SharedPreferences.getInstance();
//     id = preferences.getString("id") ?? "";
//
//     if(id.hashCode <= receiverId.hashCode)
//     {
//       chatId = '$id-$receiverId';
//     }
//     else
//     {
//       chatId = '$receiverId-$id';
//
//     }
//
//     //Firestore.instance.collection("users").document(id).updateData({'chattingWith':receiverId});
//     setState(() {
//
//     });
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//           backgroundColor: Colors.teal,
//           body: SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 50.0,
//                   backgroundColor: Colors.red,
//                   // backgroundImage: AssetImage('images/the-batman-day-hd-batman-wallpaper-5297111618074504.jpg'
//                   // ),
//                 ),
//                 Text(
//                     "test",
//                   style: TextStyle(
//                       fontFamily: 'Bangers',
//                       fontSize: 40.0,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 Text(
//                   "heyyy",
//                   style: TextStyle(
//                       fontFamily: 'Source Sans Pro',
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       letterSpacing: 2.5,
//                       fontWeight: FontWeight.bold
//                   ),
//
//
//                 ),
//                 SizedBox( height: 20.0,
//                   width: 150.0,
//                   child: Divider(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Card(
//                   color: Colors.white,
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.phone,
//                         color: Colors.teal,
//                         size: 50.0,
//                       ),
//                       SizedBox(
//                         width: 10.0,
//                       ),
//                       Text(
//                         receiverId.skilledIn,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//                 Card(
//                   color: Colors.white,
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.mail,
//                         color: Colors.teal,
//                         size: 50.0,
//                       ),
//                       SizedBox(
//                         width: 10.0,
//                       ),
//                       Text(
//                         skilledIn,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//
//
//               ],
//             ),
//           ),
//
//         )
//     );
//
//
//
//   }
//
//    // return Container();
//   }
//



// }class Extra extends StatefulWidget {
//
//   final User eachUser;
//   const Extra ({Key key, this.eachUser}) : super(key: key);
//   //Extra(this.eachUser);
//   static String id = 'Extra';
//   //String eachUser;
//
//   String phoneNo;
//   String skilledIn;
//
//
//
//   // const Extra({Key key, @required this.eachUser}) : super(key: key);
//   //const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//           backgroundColor: Colors.teal,
//           body: SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 50.0,
//                   backgroundColor: Colors.red,
//                   // backgroundImage: AssetImage('images/the-batman-day-hd-batman-wallpaper-5297111618074504.jpg'
//                   // ),
//                 ),
//                 Text(
//                   eachUser.nickname,
//                   style: TextStyle(
//                       fontFamily: 'Bangers',
//                       fontSize: 40.0,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 Text(
//                   "heyyy",
//                   style: TextStyle(
//                       fontFamily: 'Source Sans Pro',
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       letterSpacing: 2.5,
//                       fontWeight: FontWeight.bold
//                   ),
//
//
//                 ),
//                 SizedBox( height: 20.0,
//                   width: 150.0,
//                   child: Divider(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Card(
//                   color: Colors.white,
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.phone,
//                         color: Colors.teal,
//                         size: 50.0,
//                       ),
//                       SizedBox(
//                         width: 10.0,
//                       ),
//                       Text(
//                         "hy",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//                 Card(
//                   color: Colors.white,
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.mail,
//                         color: Colors.teal,
//                         size: 50.0,
//                       ),
//                       SizedBox(
//                         width: 10.0,
//                       ),
//                       Text(
//                         eachUser.skilledIn,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//
//
//               ],
//             ),
//           ),
//
//         )
//     );
//
//
//
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
