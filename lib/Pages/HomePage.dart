// import 'dart:async';
// import 'dart:convert';
// //import 'dart:convert';
// import 'dart:io';
// import 'package:Gogodo/Pages/coin_data.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// // import 'dart:js';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart'as U;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:Gogodo/Pages/ChattingPage.dart';
// import 'package:Gogodo/Pages/SecondPage.dart';
// import 'package:Gogodo/Pages/registerationScreen.dart';
// import 'package:Gogodo/Pages/rounded_button.dart';
// import 'package:Gogodo/models/user.dart' ;
// import 'package:Gogodo/Pages/AccountSettingsPage.dart';
// import 'package:Gogodo/Widgets/ProgressWidget.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:url_launcher/url_launcher.dart';
// // import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart'as S;
// import '../mains.dart';
// import 'AccountSettingsPage.dart'as s;
//
// import '../main.dart';
// import 'NotificationsPage.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
//
//
// class HomeScreen extends StatefulWidget
// {
//
//
//
//   static const String id = 'home_screen';
//
//   final String currentUserId;
//
//   HomeScreen({Key key, @required this.currentUserId, @required this.eachUser}) : super(key: key);
//   final User eachUser;
//   //HomeScreen(this.eachUser);
//
//   @override
//   State createState() => HomeScreenState(currentUserId: currentUserId);
// }
//
//
//
// class HomeScreenState extends State<HomeScreen>
// {
//
//   static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
//
//   // final User eachUser;
//   // UserResult(this.eachUser);
//
//   //Stream ChatRoomsStream;
//   NativeAd nativeAd;
//   bool isLoaded=false;
//   HomeScreenState({Key key, @required this.currentUserId , @required this.eachUser});
//   final User eachUser;
//   TextEditingController searchTextEditingController = TextEditingController();
//   Future<QuerySnapshot> futureSearchResults;
//   final String currentUserId;
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final ScrollController listScrollController = ScrollController();
//
//   int _limit = 20;
//   int _limitIncrement = 20;
//   String _textSearch = "";
//   bool isLoading = false;
//   String skilledIn;
//
//   // late AuthProvider authProvider;
//   // late String currentUserId;
//   // late HomeProvider homeProvider;
//   // Debouncer searchDebouncer = Debouncer(milliseconds: 300);
//   StreamController<bool> btnClearController = StreamController<bool>();
//   TextEditingController searchBarTec = TextEditingController();
//
//   DropdownButton<dynamic> androidDropdown() {
//     List<DropdownMenuItem
//     <String>> dropdownItems = [];
//     for (String currency in SearchList) {
//       var newItem = DropdownMenuItem(
//         child: Text(currency),
//         value: currency,
//       );
//       dropdownItems.add(newItem);
//     }
//
//     return DropdownButton<dynamic>(
//       value: controlSearching,
//       items: dropdownItems,
//       onChanged: ( value) {
//         setState(() {
//           value = controlSearching;
//           //controlSearching = value ;
//           //getData();
//         });
//       },
//     );
//   }
//
//   CupertinoPicker iOSPicker() {
//     List<Text> pickerItems = [];
//     for (String currency in SearchList) {
//       pickerItems.add(Text(currency));
//     }
//
//     return CupertinoPicker(
//       backgroundColor: Colors.teal,
//       itemExtent: 32.0,
//       onSelectedItemChanged: (selectedIndex) {
//         setState(() {
//           //controlSearching;
//           //SearchList[selectedIndex] = controlSearching();
//           //getData();
//         });
//       },
//       children: pickerItems,
//     );
//   }
//
//
//   // List<PopupChoices> choices = <PopupChoices>[
//   //   PopupChoices(title: 'Settings', icon: Icons.settings),
//   //   PopupChoices(title: 'Log out', icon: Icons.exit_to_app),
//   // ];
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     nativeAd=NativeAd(adUnitId: "ca-app-pub-1836626178823657/8909511879"
//         , factoryId: "listTile", listener: NativeAdListener(
//         onAdLoaded: (_)
//         {
//           setState(() {
//             isLoaded=true;
//           });
//           print("Ad Loaded");
//         },
//
//         onAdFailedToLoad: (ad,error){
//           print("Ad Failed To Load");
//           ad.dispose();
//
//         }
//       ),
//       request: AdRequest(),);
//     nativeAd.load();
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     body: Container(
//   //       height: 500,
//   //       child: AdWidget(ad: nativeAd,),
//   //     ),
//   //   );
//   // }
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
//   //String get nickname => null;
//
//   //get contentMsg => null;
//
//   homePageHeader()
//   {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       actions: [
//         IconButton(
//           icon: Icon(Icons.settings,size: 30.0, color: Colors.white,),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//           },
//         ),
//       ],
//       backgroundColor: Colors.teal,
//       title: Container(
//
//
//
//         margin: new EdgeInsets.only(bottom: 4.0),
//         //child: TextStyle(fontSize: 18.0 , color: Colors.white),
//         // height: 50.0,
//         // alignment: Alignment.center,
//         // padding: EdgeInsets.only(bottom: 10.0),
//         // color: Colors.lightBlueAccent,
//         // child: Platform.isIOS ? iOSPicker() : androidDropdown(),
//
//
//
//
//          child :TextFormField(
//             keyboardType: TextInputType.text,
//             textCapitalization: TextCapitalization.sentences,
//
//
//
//            controller: searchTextEditingController,
//             decoration: InputDecoration(
//               hintText: "search here...",
//               hintStyle: TextStyle(color: Colors.white),
//               //child: Platform.isIOS ? iOSPicker() : androidDropdown(),
//
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//
//               ),
//               focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey),
//
//             ),
//               filled: true,
//               prefixIcon: Icon(Icons.person_pin, color: Colors.white, size: 30.0,),
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.clear, color: Colors.white,),
//                 onPressed: emptyTextFormField,
//               ),
//           ),
//             onFieldSubmitted: controlSearching,
//         ),
//        //onTap: controlSearching,
//
//
//     )
//     );
//   }
//
//   controlSearching(String userName)
//   {
//     Future<QuerySnapshot> allFoundUsers = Firestore.instance.collection("freelancers").where("skilledIn", isGreaterThanOrEqualTo: userName).getDocuments();
//
//     //Future<QuerySnapshot> allFoundUsers = Firestore.instance.collection("freelancers").where("nickname", isGreaterThanOrEqualTo: userName).getDocuments();
//
//     setState(() {
//       futureSearchResults = allFoundUsers;
//     });
//
//   }
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
//       // Navigator.of(GlobalVariable.navState.currentContext)
//       //     .push(MaterialPageRoute(
//       //     builder: (context) => Chat(
//       //   //
//       //       //   (
//       //         receiverId: eachUser.id ,
//       //         receiverAvatar: eachUser.photoUrl,
//       //         receiverName: eachUser.nickname,
//       //
//       //      // campaignId: message["data"]["campaign"],
//       //     )));
//
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat
//       //   (
//       //   receiverId: eachUser.id ,
//       //   receiverAvatar: eachUser.photoUrl,
//       //   receiverName: eachUser.nickname,
//       // )));
//       //Navigator.pushNamed(context, '/Chat');
//       return;
//     });
//
//     firebaseMessaging.getToken().then((token) {
//       print('token: $token');
//       Firestore.instance
//           .collection('users')
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
//
//     );
//     var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//     var platformChannelSpecifics =
//     new NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         0, message['title'].toString(), message['body'].toString(), platformChannelSpecifics,
//         payload: json.encode(message));
//
//
//     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat
//     //   (
//     //   receiverId: eachUser.id ,
//     //   receiverAvatar: eachUser.photoUrl,
//     //   receiverName: eachUser.nickname,
//     // )));
//
//
//   }
//
//   // Widget ChatRoomListTitle(String photoUrl, String contentMsg, String nickname)
//   // {
//   //   return Row(
//   //     children: [
//   //       Image.network(photoUrl),
//   //       Column(
//   //         children: [Text(""), Text(contentMsg)],
//   //       ),
//   //     ],
//   //   );
//   // }
//   //
//   // Widget chatRoomsList(String replaceAll) {
//   //   return StreamBuilder(
//   //     stream: ChatRoomsStream,
//   //     builder: (context, snapshot) {
//   //       return snapshot.hasData
//   //           ? ListView.builder(
//   //           itemCount: snapshot.data.docs.length,
//   //           shrinkWrap: true,
//   //           itemBuilder: (context, index) {
//   //             DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
//   //             return ChatRoomListTile(documentSnapshot[contentMsg], documentSnapshot.documentID,nickname);
//   //           })
//   //           : Center(child: CircularProgressIndicator());
//   //     },
//   //   );
//   // }
//   //
//   // retrieveNotifications()async
//   // {
//   //   ChatRoomsStream = await NotificationsPage().retrieveNotifications() as Stream;
//   //   setState(() {
//   //
//   //   });
//   // }
//   //
//   // Future<Stream<QuerySnapshot>> getChatRooms() async {
//   //   String nickname ;
//   //   return Firestore.instance
//   //       .collection("freelancers")
//   //       .orderBy("lastMessageSendTs", descending: true)
//   //       .where("freelancers", arrayContains: nickname)
//   //       .snapshots();
//   // }
//   //
//
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
//       body: futureSearchResults == null ?  displayNoSearchResultsScreen(): displayUserFoundScreen()
//
//     );
//      //ElevatedButton.icon(onPressed: logoutUser, icon: Icon(Icons.close), label: Text("sign 0ut"));
//
//   }
//
//   displayUserFoundScreen()
//   {
//     return FutureBuilder(
//       future: futureSearchResults,
//       builder: (Context, dataSnapshot){
//         if(!dataSnapshot.hasData){
//           return CircularProgressIndicator();
//
//
//
//
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
//
//     final Orientation orientation = MediaQuery.of(context).orientation;
//
//     Scaffold(
//       body: Container(
//         child: StreamBuilder(
//           stream: Firestore.instance.collection('freelancers').limit(_limit).snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   //valueColor: AlwaysStoppedAnimation<Color>(color),
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 padding: EdgeInsets.all(10.0),
//                 itemBuilder: (context, index) => build(snapshot.data.documents[index]),
//                 itemCount: snapshot.data.documents.length,
//               );
//             }
//           },
//         ),
//       ),
//     );
//
//
//
//
//
//
//     // return StreamBuilder(
//     //   //stream: chatRoomsStream,
//     //   builder: (context, snapshot) {
//     //     return snapshot.hasData
//     //         ? ListView.builder(
//     //         itemCount: snapshot.data.docs.length,
//     //         shrinkWrap: true,
//     //         itemBuilder: (context, index) {
//     //           DocumentSnapshot ds = snapshot.data.docs[index];
//     //           return UserResult(eachUser);
//     //         })
//     //         : Center(child: CircularProgressIndicator());
//     //   },
//     // );
//
//
//   //   futureSearchResults;
//   //   return Scaffold(
//   //     body:   Padding(
//   //       padding: EdgeInsets.all(4.0),
//   //   child: Container(
//   //   color: Colors.white,
//   //   child: Column(
//   //   children: [
//   //   GestureDetector(
//   //     //onTap: () => sendUserToChatPage(context),
//   //   onTap: ()=> sendUserToExtraPage(context),
//   //   child: ListTile(
//   //   leading: CircleAvatar(
//   //   backgroundColor: Colors.black, backgroundImage: CachedNetworkImageProvider(eachUser.photoUrl),
//   //   ),
//   //   title: Text(
//   //   eachUser.nickname,
//   //   style: TextStyle(
//   //   color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold,
//   //   ),
//   //   ),
//   //   subtitle: Text(
//   //   eachUser.skilledIn,
//   //   style: TextStyle(
//   //   color: Colors.black,fontSize: 14.0, fontWeight: FontWeight.bold,
//   // ),
//   // ),
//   // // subtitle: Text(
//   // //   "Joined:" + DateFormat("dd MMMM, yyyy - hh:mm:aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachUser.createdAt))),
//   // //   style: TextStyle(color: Colors.grey, fontSize: 14.0, fontStyle: FontStyle.italic),
//   // // ),
//   // ),
//   //   ),
//   //   ],
//   //   ),
//   //
//   //   ),
//   //
//   //
//   //   ),
//   //     body:  Container(
//   //   child: StreamBuilder(
//   //   stream: Firestore.instance.collection('freelancers').limit(_limit).snapshots(),
//   //   builder: (context, snapshot) {
//   // if (!snapshot.hasData) {
//   // return Center(
//   // child: CircularProgressIndicator(
//   // // valueColor: AlwaysStoppedAnimation<Color>(themeColor),
//   // ),
//   // );
//   // } else {
//   // return ListView.builder(
//   // padding: EdgeInsets.all(10.0),
//   // itemBuilder: (context, index) => build( context ),
//   // itemCount: snapshot.data.documents.length,
//   // );
//   // }
//   // },
//   //   ),
//   //   ),
//
//       // body: Container(
//       //   child: StreamBuilder(
//       //     stream: Firestore.instance.collection('freelancers').limit(_limit).snapshots(),
//       //     builder: (context, snapshot) {
//       //       // if (!snapshot.hasData) {
//       //       //   return Center(
//       //       //     child: CircularProgressIndicator(
//       //       //       //valueColor: AlwaysStoppedAnimation<Color>(themeColor),
//       //       //     ),
//       //       //   );
//       //       // } else {
//       //       //
//       //       //   // List<UserResult> searchUserResult = [];
//       //       //   // snapshot.data.documents.forEach((document){
//       //       //   //   User eachUser = User.fromDocument(document);
//       //       //   //   UserResult userResult = UserResult(eachUser);
//       //       //   //
//       //       //   //   if(currentUserId != document["id"])
//       //       //   //   {
//       //       //   //     searchUserResult.add(userResult);
//       //       //   //   }
//       //       //   // });
//       //       //   // return ListView.builder(
//       //       //   //   padding: EdgeInsets.all(10.0),
//       //       //   //   itemBuilder: (context, index) => searchUserResult(context, snapshot.data.documents[index]),
//       //       //   //   itemCount: snapshot.data.documents.length,
//       //       //   // );
//       //       // }
//       //     },
//       //   ),
//       // ),
//     // return Scaffold(
//     //   body: Container(
//     //
//     //     height: 2100,
//     //     width: 800,
//     //     child: isLoaded? AdWidget(ad: nativeAd,):
//     //     Center(
//     //     child: Text("Suggestions: pianist,cad,content writer,photographer,app/web developer, social media manager,mental wellness coach,music programmer,artist,nutritionist "),
//     //   ),
//     //   ),
//     //
//     //
//     //
//     //     );
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
//       // child: Center(
//       //   child: ListView(
//       //     shrinkWrap: true,
//       //     children: [
//       //       Icon(Icons.group, color: Colors.tealAccent, size: 200,),
//       //       Text(
//       //         "Search Freelancers",
//       //         textAlign: TextAlign.center,
//       //         style: TextStyle(color: Colors.tealAccent, fontSize: 50.0, fontWeight: FontWeight.w500,),
//       //       ),
//       //
//       //     ],
//       //   ),
//       //
//       // ),
//     //);
//
//   }
//
//   // sendUserToExtraPage(BuildContext context){
//   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat
//   //     (
//   //     receiverId: eachUser.id ,
//   //     receiverAvatar: eachUser.photoUrl,
//   //     receiverName: eachUser.nickname,
//   //   )));
//   // }
//
//
//  // buildItem(BuildContext context, document) {}
//
//
//
//
//
// }
//
//
//
//
//
//
//
//
// class UserResult extends StatelessWidget
// {
//
//
//
//   final User eachUser;
//   UserResult(this.eachUser);
//   NativeAd nativeAd;
//   bool isLoaded=false;
//
//
//
//
//   @override
//   Widget build(BuildContext context)
//   {
//
//
//
//
//
//     return Padding(
//       padding: EdgeInsets.all(4.0),
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             GestureDetector(
//               //onTap: () => sendUserToChatPage(context),
//               onTap: ()=> sendUserToExtraPage(context),
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
//                 subtitle: Text(
//                   eachUser.skilledIn,
//                   style: TextStyle(
//                     color: Colors.black,fontSize: 14.0, fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 // subtitle: Text(
//                 //   "Joined:" + DateFormat("dd MMMM, yyyy - hh:mm:aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachUser.createdAt))),
//                 //   style: TextStyle(color: Colors.grey, fontSize: 14.0, fontStyle: FontStyle.italic),
//                 // ),
//               ),
//             ),
//           ],
//         ),
//
//       ),
//
//
//     );
//
//
//
//
//
//
//
//
//   }
//
//   sendUserToChatPage(BuildContext context){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat
//       (
//         receiverId: eachUser.id ,
//         receiverAvatar: eachUser.photoUrl,
//         receiverName: eachUser.nickname,
//     )));
//   }
//
//   sendUserToExtraPage(BuildContext context){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>Extra(eachUser: eachUser, nickname: eachUser.nickname, skilledIn: eachUser.skilledIn)));
//     //   (
//     //   receiverId: eachUser.id ,
//     //   receiverAvatar: eachUser.photoUrl,
//     //   receiverName: eachUser.nickname,
//     // )));
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   // TODO: implement build
//   //   //throw UnimplementedError();
//   // }
//   //futureSearchResults ? controlSearching() : ChatRoomList();
// }
//
// // class ChatRoomListTile extends StatefulWidget {
// //   final String  contentMsg, nickname, chatId;
// //   ChatRoomListTile(this.contentMsg, this.nickname , this.chatId);
// //   //const ChatRoomListTile({Key? key}) : super(key: key);
// //
// //   @override
// //   _ChatRoomListTileState createState() => _ChatRoomListTileState();
// // }
// //
// //  class _ChatRoomListTileState extends State<ChatRoomListTile> {
// //   String photoUrl = "" , nickname = "" , contentMsg = "";
// //   getThisUserInfo()async
// //   {
// //     nickname = widget.chatId.replaceAll(widget.nickname, "").replaceAll("_", "");
// //     QuerySnapshot querySnapshot = await NotificationsPage().getUserInfo(nickname);
// //     print("something ${querySnapshot.documents[0].documentID}");
// //     nickname = querySnapshot.documents[0]["nickname"];
// //     photoUrl = querySnapshot.documents[0]["photoUrl"];
// //     setState(() {
// //
// //     });
// //   }
// //   @override
// //   void initState() {
// //     getThisUserInfo();
// //     super.initState();
// //   }
//
//
//   // void onItemMenuPress(Choice choice) {
//   //   if (choice.title == 'Log out') {
//   //     handleSignOut();
//   //   } else {
//   //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChatSettings()));
//   //   }
//   // }
//
//
//
//   // String photoUrl, contentMsg, nickname;
//   // ChatRoomListTile(this.contentMsg, this.nickname , this.photoUrl);
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Row(
//   //     children: [
//   //       Image.network(photoUrl, height: 30, width: 30,),
//   //       Column(
//   //         children: [Text(nickname), Text(widget.contentMsg)],
//   //             ),
//   //           ],
//   //         );
// class Extra extends StatefulWidget {
//   final User eachUser;
//   //Extra(this.eachUser);
//   String nickname;
//   String skilledIn;
//   String phoneNo;
//
//   Extra({Key key,  @required this.eachUser ,@required this.nickname, @required this.skilledIn,@required this.phoneNo,}) : super(key: key);
//   static String id = 'Extra';
//
//   @override
//   _ExtraState createState() => _ExtraState(this.eachUser);
// }
//
// class _ExtraState extends State<Extra> {
//   final User eachUser;
//   _ExtraState(this.eachUser);
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
//   String receiverName = "";
//   //String eachUser = "";
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
//
//   //var eachUser;
//   // String nickname;
//   // String skilledIn;
//   //_ExtraState(this.eachUser);
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
//     receiverName = preferences.getString("receiverName");
//    // eachUser = preferences.getString("eachUser");
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
//   sendUserToChatPage(BuildContext context){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat
//       (
//       receiverId: eachUser.id ,
//       receiverAvatar: eachUser.photoUrl,
//       receiverName: eachUser.nickname,
//     )));
//   }
//
//
//   // @override
//   // void data(){
//   //   // TODO: implement initState
//   //   super.initState();
//   //   isLoading = false;
//   //   chatId = "";
//   //   readLocal();
//   // }
//   //
//   // // @override
//   // //  {
//   // //   // TODO: implement initState
//   // //   super.initState();
//   // //   isLoading = false;
//   // //   chatId = "";
//   // //   readLocal();
//   // // }
//   //
//   // readLocal()async
//   // {
//   //   preferences = await SharedPreferences.getInstance();
//   //   id = preferences.getString("id") ?? "";
//   //
//   //   if(id.hashCode <= receiverId.hashCode)
//   //   {
//   //     chatId = '$id-$receiverId';
//   //   }
//   //   else
//   //   {
//   //     chatId = '$receiverId-$id';
//   //
//   //   }
//   //
//   //   //Firestore.instance.collection("users").document(id).updateData({'chattingWith':receiverId});
//   //   setState(() {
//   //
//   //   });
//   //
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: Colors.teal,
//           body: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 50.0,
//                     backgroundColor: Colors.red,
//                     backgroundImage: CachedNetworkImageProvider(eachUser.photoUrl) ,
//                     // backgroundImage: AssetImage('images/the-batman-day-hd-batman-wallpaper-5297111618074504.jpg'
//                     // ),
//                   ),
//                   Text(
//                     eachUser.nickname,
//                     style: TextStyle(
//                         fontFamily: 'Bangers',
//                         fontSize: 30.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold
//                     ),
//                   ),
//                   Text(
//                   eachUser.level,
//                   style: TextStyle(
//                       fontFamily: 'Source Sans Pro',
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       letterSpacing: 2.5,
//                       fontWeight: FontWeight.bold
//                   ),
//
//
//                   ),
//
//                   SizedBox( height: 20.0,
//                       width: 150.0,
//                       child: Divider(
//                         color: Colors.white,
//                       ),
//                     ),
//
//                   Container(
//                     width: 500,
//                     child: Card(
//                       color: Colors.white,
//                       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                       child: Column(
//                         children: [
//                           Icon(Icons.work,
//                             color: Colors.teal,
//                             size: 50.0,
//                           ),
//                           SizedBox(
//                             width: 10.0,
//                           ),
//                           Text(
//                             eachUser.skilledIn,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Source Sans Pro',
//                               fontSize: 20.0,
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//
//                   Container(
//                     width: 500,
//                     child: Card(
//                       color: Colors.white,
//                       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                       child: Column(
//                         children: [
//                           Icon(Icons.account_balance_wallet,
//                             color: Colors.teal,
//                             size: 50.0,
//                           ),
//                           SizedBox(
//                             width: 10.0,
//                           ),
//
//                           Text(
//                           "",
//                           //eachUser.skilledIn,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'Source Sans Pro',
//                             fontSize: 20.0,
//                           ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     height: 100,
//                     width: 500,
//                     child: Card(
//                       color: Colors.white,
//                       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                       child: Column(
//                         children: [
//                           Icon(Icons.school,
//                             color: Colors.teal,
//                             size: 50.0,
//                           ),
//                           SizedBox(
//                             width: 10.0,
//                           ),
//                           Text(
//                             eachUser.edqua,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Source Sans Pro',
//                               fontSize: 20.0,
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//
//
//                   Container(
//                    height: 100,
//                     width: 500,
//                     child: Card(
//                       color: Colors.white,
//                       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                       child: Column(
//
//                         children: [
//
//
//
//                           Text(
//                             "Experience:" +  eachUser.experience,
//                             //eachUser.experience,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Source Sans Pro',
//                               fontSize: 20.0,
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                      height: 110,
//                     width: 500,
//                     child: Card(
//                       color: Colors.white,
//                       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                       child: Column(
//
//                         children: [
//
//
//
//                           Text(
//                             eachUser.achievements,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Source Sans Pro',
//                               fontSize: 20.0,
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//
//                   GestureDetector(
//                     onTap: ()=> sendUserToChatPage(context),
//
//                     child: RoundedButton(
//                       title: 'Wanna talk??',
//                       colour: Colors.deepOrangeAccent,
//
//                       // onPressed: () {
//                       //
//                       // },
//                     ),
//                   ),
//
//
//
//                 ],
//               ),
//             ),
//           ),
//     )
//
//     ],
//     );
//
//
//
//   }
//
// // return Container();
// }
//
//
//
