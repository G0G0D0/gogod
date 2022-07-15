// import 'dart:async';
// import 'dart:convert';
// //import 'dart:html';
// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as U;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
// import 'package:Gogodo/Pages/ChattingPage.dart';
// import 'package:Gogodo/Pages/ConvoPage.dart';
// import 'package:Gogodo/models/user.dart' ;
// import 'package:Gogodo/Pages/AccountSettingsPage.dart';
// import 'package:Gogodo/Widgets/ProgressWidget.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// // import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart'as S;
// import '../mains.dart';
// import 'AccountSettingsPage.dart'as s;
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// import '../main.dart';
// import 'InfoScreen.dart';
// import '../Models/user.dart'as u;
// import 'registerationScreen.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
//
// class SecondScreen extends StatefulWidget
// {
//   static const String id = 'Second_screen';
//
//   final String currentUserId;
//
//   SecondScreen({Key key, @required this.currentUserId}) : super(key: key);
//
//   @override
//   State createState() => SecondScreenState(currentUserId: currentUserId);
// }
//
//
//
// class SecondScreenState extends State<SecondScreen>
// {
//
//   SecondScreenState({Key key, @required this.currentUserId, @required this.eachUser});
//   TextEditingController searchTextEditingController = TextEditingController();
//   Future<QuerySnapshot> futureSearchResults;
//   final String currentUserId;
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final ScrollController listScrollController = ScrollController();
//   final User eachUser;
//
//   int _limit = 20;
//   int _limitIncrement = 20;
//   String _textSearch = "";
//   bool isLoading = false;
//   NativeAd nativeAd;
//   bool isLoaded=false;
//
//   // late AuthProvider authProvider;
//   // late String currentUserId;
//   // late HomeProvider homeProvider;
//   // Debouncer searchDebouncer = Debouncer(milliseconds: 300);
//   StreamController<bool> btnClearController = StreamController<bool>();
//   TextEditingController searchBarTec = TextEditingController();
//
//   // List<PopupChoices> choices = <PopupChoices>[
//   //   PopupChoices(title: 'Settings', icon: Icons.settings),
//   //   PopupChoices(title: 'Log out', icon: Icons.exit_to_app),
//   // ];
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
//     // authProvider = context.read<AuthProvider>();
//     // homeProvider = context.read<HomeProvider>();
//     //
//     // if (authProvider.getUserFirebaseId()?.isNotEmpty == true) {
//     //   currentUserId = authProvider.getUserFirebaseId()!;
//     // } else {
//     //   Navigator.of(context).pushAndRemoveUntil(
//     //     MaterialPageRoute(builder: (context) => LoginPage()),
//     //         (Route<dynamic> route) => false,
//     //   );
//     // }
//     registerNotification();
//     configLocalNotification();
//     listScrollController.addListener;
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     btnClearController.close();
//   }
//
//
//   homePageHeader()
//   {
//     return AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings,size: 30.0, color: Colors.white,),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
//             },
//           ),
//         ],
//         backgroundColor: Color.fromARGB(255, 126, 217, 86),
//         title: Container(
//           margin: new EdgeInsets.only(bottom: 4.0),
//           child: TextFormField(
//             keyboardType: TextInputType.text,
//             textCapitalization: TextCapitalization.sentences,
//
//
//             style: TextStyle(fontSize: 18.0 , color: Colors.white),
//             controller: searchTextEditingController,
//             decoration: InputDecoration(
//               hintText: "search here...",
//               hintStyle: TextStyle(color: Colors.white),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//
//               ),
//               filled: true,
//               prefixIcon: Icon(Icons.person_pin, color: Colors.white, size: 30.0,),
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.clear, color: Colors.white,),
//                 onPressed: emptyTextFormField,
//               ),
//             ),
//             onFieldSubmitted: controlSearching,
//           ),
//         )
//     );
//   }
//
//   controlSearching(String str)
//   {
//     Future<QuerySnapshot> allFoundUsers = Firestore.instance.collection("users").where("nickname", isGreaterThanOrEqualTo: str).getDocuments();
//
//     //Future<QuerySnapshot> allFoundUsers = Firestore.instance.collection("freelancers").where("nickname", isGreaterThanOrEqualTo: userName).getDocuments();
//
//     setState(() {
//       futureSearchResults = allFoundUsers;
//     });
//
//   }
//
//   void registerNotification() {
//     firebaseMessaging.requestNotificationPermissions();
//
//     firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
//       print('onMessage: $message');
//       Platform.isAndroid
//           ? showNotification(message['notification'])
//           : showNotification(message['aps']['alert']);
//       return;
//     }, onResume: (Map<String, dynamic> message) {
//       print('onResume: $message');
//       // Navigator.of(GlobalVariable.navState.currentContext)
//       //     .push(MaterialPageRoute(
//       //     builder: (context) => Chat(
//       //       //
//       //       //   (
//       //       receiverId: eachUser.id ,
//       //       receiverAvatar: eachUser.photoUrl,
//       //       receiverName: eachUser.nickname,
//       //
//       //       // campaignId: message["data"]["campaign"],
//       //     )));
//       return;
//     }, onLaunch: (Map<String, dynamic> message) {
//       print('onLaunch: $message');
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Convo
//       //   (
//       //   receiverId: eachUser.id ,
//       //   receiverAvatar: eachUser.photoUrl,
//       //   receiverName: eachUser.nickname,
//       // )));
//       //Navigator.pushNamed(context, '/Convo');
//
//       return;
//     });
//
//
//     firebaseMessaging.getToken().then((token) {
//       print('token: $token');
//       Firestore.instance
//           .collection('freelancers')
//           .document(currentUserId)
//           .updateData({'pushToken': token});
//     }).catchError((err) {
//       //Fluttertoast.showToast(msg: err.message.toString());
//       FlutterToast.showToast(
//           msg: err.message.toString(),
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
//   void configLocalNotification() {
//     var initializationSettingsAndroid = new AndroidInitializationSettings('app_icon');
//     var initializationSettingsIOS = new IOSInitializationSettings();
//     var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//   }
//
//   void showNotification(message) async {
//     var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       Platform.isAndroid ? 'com.gaya.gogodo' : 'com.gaya.gogodo',
//       'Flutter chat demo',
//       'your channel description',
//       playSound: true,
//       enableVibration: true,
//       importance: Importance.Max,
//       priority: Priority.High,
//       //channelAction: Ch
//     );
//     var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//     var platformChannelSpecifics =
//     new NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         0, message['title'].toString(), message['body'].toString(), platformChannelSpecifics,
//         payload: json.encode(message));
//     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Convo
//     //   (
//     //   receiverId: eachUser.id ,
//     //   receiverAvatar: eachUser.photoUrl,
//     //   receiverName: eachUser.nickname,
//     // )));
//   }
//
//
//   emptyTextFormField()
//   {
//     searchTextEditingController.clear();
//   }
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: homePageHeader(),
//       body: futureSearchResults == null ? displayNoSearchResultsScreen() : displayUserFoundScreen(),
//
//     );
//     //ElevatedButton.icon(onPressed: logoutUser, icon: Icon(Icons.close), label: Text("sign 0ut"));
//
//   }
//
//   displayUserFoundScreen()
//   {
//     return FutureBuilder(
//       future: futureSearchResults,
//       builder: (Context, dataSnapshot){
//         if(!dataSnapshot.hasData){
//           return circularProgress();
//         }
//         List<UserResult> searchUserResult = [];
//         dataSnapshot.data.documents.forEach((document){
//           User eachUser = User.fromDocument(document);
//           UserResult userResult = UserResult(eachUser);
//
//           if(currentUserId != document["id"])
//           {
//             searchUserResult.add(userResult);
//           }
//         });
//         return ListView(children: searchUserResult,);
//       },
//     );
//   }
//
//   displayNoSearchResultsScreen()
//   {
//     final Orientation orientation = MediaQuery.of(context).orientation;
//     return Scaffold(
//         body: Container(
//
//         height: 2100,
//         width: 800,
//         child: isLoaded? AdWidget(ad: nativeAd,):
//     Center(
//       child: Text("search for the client name, with the aid of the search box"),
//     //child: Text("Add Is Loading..."),
//     ),
//     ),
//     );
//   }
//
//
//
// }
//
//
//
//
// class UserResult extends StatelessWidget
// {
//
//   final User eachUser;
//   UserResult(this.eachUser);
//   @override
//   Widget build(BuildContext context)
//   {
//
//     return Padding(
//       padding: EdgeInsets.all(4.0),
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () => sendUserToChatPage(context),
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.black, backgroundImage: CachedNetworkImageProvider(eachUser.photoUrl),
//                 ),
//                 title: Text(
//                   eachUser.nickname,
//                   style: TextStyle(
//                     color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 // subtitle: Text(
//                 //   "Joined:" + DateFormat("dd MMMM, yyyy - hh:mm:aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachUser.createdAt))),
//                 //   style: TextStyle(color: Colors.grey, fontSize: 14.0, fontStyle: FontStyle.italic),
//                 // ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//   }
//
//   sendUserToChatPage(BuildContext context){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>Convo
//       (
//       receiverId: eachUser.id ,
//       receiverAvatar: eachUser.photoUrl,
//       receiverName: eachUser.nickname,
//     )));
//   }
// }
