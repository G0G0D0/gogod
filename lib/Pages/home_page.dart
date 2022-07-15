import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:Gogodo/constants/app_constants.dart';
import 'package:Gogodo/constants/color_constants.dart';
import 'package:Gogodo/constants/constants.dart';
import 'package:Gogodo/models/convo_chat.dart';
import 'package:Gogodo/providers/providers.dart';
import 'package:Gogodo/utils/utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';
import 'client_chat.dart';
import 'pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomePageState({Key? key});

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final ScrollController listScrollController = ScrollController();

  int _limit = 20;
  int _limitIncrement = 20;
  String _textSearch = "";
  bool isLoading = false;

  late AuthProvider authProvider;
  late String currentUserId;
  late HomeProvider homeProvider;
  Debouncer searchDebouncer = Debouncer(milliseconds: 300);
  StreamController<bool> btnClearController = StreamController<bool>();
  TextEditingController searchBarTec = TextEditingController();

  List<PopupChoices> choices = <PopupChoices>[
    PopupChoices(title: 'Settings', icon: Icons.settings),
    PopupChoices(title: 'Log out', icon: Icons.exit_to_app),
    PopupChoices(title: 'Messages', icon: Icons.send),

  ];

  @override
  void initState() {
    super.initState();
    authProvider = context.read<AuthProvider>();
    homeProvider = context.read<HomeProvider>();

    if (authProvider.getUserFirebaseId()?.isNotEmpty == true) {
      currentUserId = authProvider.getUserFirebaseId()!;
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false,
      );
    }
    registerNotification();
    configLocalNotification();
    listScrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    btnClearController.close();
  }

  void registerNotification() {
    firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage: $message');
      if (message.notification != null) {
        showNotification(message.notification!);
      }
      return;
    });

    firebaseMessaging.getToken().then((token) {
      print('push token: $token');
      if (token != null) {
        homeProvider.updateDataFirestore(FirestoreConstants.pathUserCollection, currentUserId, {'pushToken': token});
      }
    }).catchError((err) {
      Fluttertoast.showToast(msg: err.message.toString());
    });
  }

  void configLocalNotification() {
    AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
    InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void scrollListener() {
    if (listScrollController.offset >= listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onItemMenuPress(PopupChoices choice) {
    if (choice.title == 'Log out') {
      handleSignOut();
    } else if(choice.title == 'Messages'){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientChat()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
    }
  }

  void showNotification(RemoteNotification remoteNotification) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      Platform.isAndroid ? 'com.gaya.gogodo' : 'com.gaya.gogodo',
      'Flutter chat demo',
      'your channel description',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    print(remoteNotification);

    await flutterLocalNotificationsPlugin.show(
      0,
      remoteNotification.title,
      remoteNotification.body,
      platformChannelSpecifics,
      payload: null,
    );
  }


  Future<void> handleSignOut() async {
    authProvider.handleSignOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 126, 217, 86),

        title: Text(
          AppConstants.homeTitle,
          style: TextStyle(color: Colors.white    //Color.fromARGB(255, 126, 217, 86),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[buildPopupMenu()],
      ),
      body: Stack(
        children: <Widget>[
          // List
          Column(
            children: [
              buildSearchBar(),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: homeProvider.getStreamFireStore(FirestoreConstants.pathFreelancerCollection, _limit, _textSearch),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      if ((snapshot.data?.docs.length ?? 0) > 0) {
                        return ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemBuilder: (context, index) => buildItem(context, snapshot.data?.docs[index]),
                          itemCount: snapshot.data?.docs.length,
                          controller: listScrollController,
                        );
                      } else {
                        return Center(
                          child: Text("No users"),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorConstants.themeColor,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),

          // Loading
          Positioned(
            child: isLoading ? LoadingView() : SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search, color: ColorConstants.greyColor, size: 20),
          SizedBox(width: 5),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,


              textInputAction: TextInputAction.search,
              controller: searchBarTec,
              onChanged: (value) {
                searchDebouncer.run(() {
                  if (value.isNotEmpty) {
                    btnClearController.add(true);
                    setState(() {
                      _textSearch = value;
                    });
                  } else {
                    btnClearController.add(false);
                    setState(() {
                      _textSearch = "";
                    });
                  }
                });
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Search Freelancers (eg: Content writing, Graphic designer..)',
                hintStyle: TextStyle(fontSize: 13, color: ColorConstants.greyColor),
              ),
              style: TextStyle(fontSize: 13),
            ),
          ),
          StreamBuilder<bool>(
              stream: btnClearController.stream,
              builder: (context, snapshot) {
                return snapshot.data == true
                    ? GestureDetector(
                    onTap: () {
                      searchBarTec.clear();
                      btnClearController.add(false);
                      setState(() {
                        _textSearch = "";
                      });
                    },
                    child: Icon(Icons.clear_rounded, color: ColorConstants.greyColor, size: 20))
                    : SizedBox.shrink();
              }),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorConstants.greyColor2,
      ),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
    );
  }

  Widget buildPopupMenu() {
    return PopupMenuButton<PopupChoices>(
      onSelected: onItemMenuPress,
      itemBuilder: (BuildContext context) {
        return choices.map((PopupChoices choice) {
          return PopupMenuItem<PopupChoices>(
              value: choice,
              child: Row(
                children: <Widget>[
                  Icon(
                    choice.icon,
                    color: ColorConstants.primaryColor,
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    choice.title,
                    style: TextStyle(color: ColorConstants.primaryColor),
                  ),
                ],
              ));
        }).toList();
      },
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {
      UserConvo userConvo = UserConvo.fromDocument(document);
      if (userConvo.id == currentUserId) {
        return SizedBox.shrink();
      } else {
        return SingleChildScrollView(
          child: Container(
            child: TextButton(
              child: Row(
                children: <Widget>[
                  Material(
                    child: userConvo.photoUrl.isNotEmpty
                        ? Image.network(
                      userConvo.photoUrl,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorConstants.themeColor,
                              value: loadingProgress.expectedTotalBytes != null &&
                                  loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, object, stackTrace) {
                        return Icon(
                          Icons.account_circle,
                          size: 50,
                          color: ColorConstants.greyColor,
                        );
                      },
                    )
                        : Icon(
                      Icons.account_circle,
                      size: 50,
                      color: ColorConstants.greyColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    clipBehavior: Clip.hardEdge,
                  ),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Name: ${userConvo.nickname}',

                              //userConvo.nickname,
                              maxLines: 1,
                              style: TextStyle(color: ColorConstants.primaryColor),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                          ),

                          SizedBox(
                            height: 8.0,
                          ),

                          Container(
                            child: Text(
                              'Skilled in: ${userConvo.skilledIn}',

                              //userConvo.skilledIn,
                              maxLines: 1,
                              style: TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.w900),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),

                          SizedBox(
                            height: 8.0,
                          ),

                          Container(
                            child: Text(
                              'Level: ${userConvo.level}',

                              //userConvo.edqua,
                              maxLines: 1,
                              style: TextStyle(color: ColorConstants.primaryColor),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),

                          SizedBox(
                            height: 8.0,
                          ),

                          Container(
                            child: Text(
                              'Education qualification: ${userConvo.edqua}',

                              //userConvo.edqua,
                              maxLines: 1,
                              style: TextStyle(color: ColorConstants.primaryColor),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),

                          SizedBox(
                            height: 8.0,
                          ),

                          Container(
                            child: Text(
                              'Experience: ${userConvo.experience}',

                              // userConvo.experience,
                              maxLines: 1,
                              style: TextStyle(color: ColorConstants.primaryColor),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),

                          SizedBox(
                            height: 8.0,
                          ),

                          Container(
                            child: Text(
                              'Achievements: ${userConvo.achievements}',
                              maxLines: 1,
                              style: TextStyle(color: ColorConstants.primaryColor),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),

                          SizedBox(
                            height: 8.0,
                          ),



                        ],
                      ),
                      margin: EdgeInsets.only(left: 20),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                if (Utilities.isKeyboardShowing()) {
                  Utilities.closeKeyboard(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      peerId: userConvo.id,
                      peerNickname: userConvo.nickname,
                      peerAvatar: userConvo.photoUrl,


                      //userConvo.photoUrl,
                      //userConvo.nickname,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.greyColor2),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
          ),
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }
}



class Extra extends StatefulWidget {
  late String currentUserId;

  final String peerId;
  final String peerAvatar;
  final String peerNickname;

  Extra({Key? key, required this.peerId, required this.peerAvatar, required this.peerNickname}) : super(key: key);

  //const Extra({Key? key}) : super(key: key);



  @override
  _ExtraState createState() => _ExtraState();

}

class _ExtraState extends State<Extra> {

  // final String peerId;
  // final String peerAvatar;
  // final String peerNickname;


  @override

  late String currentUserId;

  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {
      UserConvo userConvo = UserConvo.fromDocument(document);
      if (userConvo.id == currentUserId) {
        return SizedBox.shrink();
      } else {

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userConvo.nickname,
                style: TextStyle(
                    fontFamily: 'Bangers',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                userConvo.level,
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold
                ),


              ),

              SizedBox( height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              Container(
                width: 500,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Column(
                    children: [
                      Icon(Icons.work,
                        color: Colors.teal,
                        size: 50.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        userConvo.skilledIn,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),

                    ],
                  ),
                ),
              ),


              Container(
                width: 500,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Column(
                    children: [
                      Icon(Icons.account_balance_wallet,
                        color: Colors.teal,
                        size: 50.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),

                      Text(
                        "",
                        //eachUser.skilledIn,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Container(
                height: 100,
                width: 500,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Column(
                    children: [
                      Icon(Icons.school,
                        color: Colors.teal,
                        size: 50.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        userConvo.edqua,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),

                    ],
                  ),
                ),
              ),



              Container(
                height: 100,
                width: 500,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Column(

                    children: [



                      Text(
                        "Experience:" +  userConvo.experience,
                        //eachUser.experience,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Container(
                height: 110,
                width: 500,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Column(

                    children: [



                      Text(
                        userConvo.achievements,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),

                    ],
                  ),
                ),
              ),






            ],
          ),
        );

      }
    } else {
      return SizedBox.shrink();
    }
  }
  Widget build(BuildContext context) {
    return Container();
  }
}