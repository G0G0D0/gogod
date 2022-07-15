// import 'dart:async';
// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:Gogodo/Models/user.dart';
// import 'package:Gogodo/Pages/HomePage.dart';
// import 'package:Gogodo/Pages/PaymentGate.dart';
// import 'package:Gogodo/Widgets/FullImageWidget.dart';
// import 'package:Gogodo/Widgets/ProgressWidget.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'ExtraPage.dart';
// import 'PaymentGate.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'ConfirmationPage.dart';
//
//
// class Chat extends StatelessWidget
// {
//   static const String id = 'chat';
//
//   final String receiverId;
//   final String receiverAvatar;
//   final String receiverName;
//
//   Chat({
//     Key key , @required this.receiverId, @required this.receiverAvatar , @required this.receiverName,
// });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         actions: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.black,
//               backgroundImage: CachedNetworkImageProvider(receiverAvatar),
//             ),
//           ),
//         ],
//
//
//         iconTheme: IconThemeData(
//
//           color: Colors.white,
//         ),
//         title: Text(
//           receiverName,
//
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//
//         ),
//         centerTitle: true,
//
//
//
//
//
//
//       ),
//
//       body: ChatScreen(receiverId: receiverId, receiverAvatar: receiverAvatar),
//
//
//     );
//
//   }
// }
//
// class ChatScreen extends StatefulWidget
// {
//   final String receiverId;
//   final String receiverAvatar;
//
//   ChatScreen({
//     Key key,
//     @required this.receiverId,
//     @required this.receiverAvatar,
// }) : super(key: key);
//
//   @override
//   State createState() => ChatScreenState(receiverId: receiverId, receiverAvatar: receiverAvatar);
// }
//
//
//
//
// class ChatScreenState extends State<ChatScreen>
// {
//
//   final User eachUser;
//   final String receiverId;
//   final String receiverAvatar;
//
//   ChatScreenState( {
//     Key key,
//     @required this.receiverId,
//     @required this.receiverAvatar,
//     @required this.imageFile,
//     @required this.eachUser,
//   }) ;
//
//   final TextEditingController textEditingController = TextEditingController();
//   final TextEditingController payTextEditingController = TextEditingController();
//
//   final ScrollController listScrollController = ScrollController();
//   final FocusNode focusNode = FocusNode();
//   bool isLoading;
//
//   File imageFile;
//   String imageUrl;
//
//   String chatId;
//   SharedPreferences preferences;
//   String id;
//   String nickname;
//   var listMessage;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     isLoading = false;
//     chatId = "";
//     readLocal();
//   }
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
//       {
//         chatId = '$receiverId-$id';
//
//       }
//
//     Firestore.instance.collection("users").document(id).updateData({'chattingWith':receiverId});
//     setState(() {
//
//     });
//
//   }
//
//
//   @override
//   Widget build(BuildContext context)
//   {
//     return WillPopScope(
//
//       child: Stack(
//         children: [
//
//          Column(
//            children: [
//              createListMessages(),
//
//              createInput(),
//            ],
//          ),
//         ],
//       ),
//     );
//
//   }
//    createListMessages(){
//     return Flexible
//       (
//       child: chatId == ""
//       ?  Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),),
//       )
//           : StreamBuilder(
//         stream: Firestore.instance.collection("messages").document(chatId).collection(chatId).orderBy("timestamp", descending: true).limit(20).snapshots(),
//
//             builder: (context, snapshot)
//       {
//         if(!snapshot.hasData)
//         {
//           return  Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),),);
//         }
//         else
//       {
//         listMessage = snapshot.data.documents;
//         return ListView.builder(
//           padding: EdgeInsets.all(10.0),
//           itemBuilder: (context, index) => createItem(index, snapshot.data.documents[index]),
//           itemCount: snapshot.data.documents.length,
//           reverse: true,
//           controller: listScrollController,
//         );
//
//       }
//
//     },
//
//       ),
//     );
//    }
//
//   bool isLastMsgLeft(int index)
//   {
//     if((index>0 && listMessage!= null && listMessage[index-1]["idFrom"]==id)  || index==0)
//     {
//       return true;
//     }
//     else
//     {
//       return false;
//     }
//
//   }
//
//    bool isLastMsgRight(int index)
//    {
//      if((index>0 && listMessage!= null && listMessage[index-1]["idFrom"]!=id)  || index==0)
//        {
//          return true;
//        }
//      else
//        {
//          return false;
//        }
//
//    }
//    Widget createItem(int index, DocumentSnapshot document)
//    {
//      if(document["idFrom"]== id)
//        {
//          return Row
//            (
//            children: [
//              document["type"] == 0
//              ? Container(
//                child: Text(
//                  document["content"],
//                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//                ),
//                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                // padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
//                width: 200.0,
//                  margin: EdgeInsets.only(bottom: isLastMsgRight(index)? 20.0 : 10.0 , right: 10.0),
//                decoration: BoxDecoration(color: Colors.lightBlueAccent, borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),
//    bottomLeft: Radius.circular(30.0),
//    bottomRight: Radius.circular(30.0)),
//
//                 // margin: EdgeInsets.only(bottom: isLastMsgRight(index)? 20.0 : 10.0 , right: 10.0),
//              ))
//                  :document["type"]== 1
//                  ? Container(
//
//                child: TextButton(
//                  child: Material(
//                    child: CachedNetworkImage(
//                      placeholder: (context, url) => Container(
//                        child: CircularProgressIndicator(
//                          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
//                        ),
//                        width: 200.0,
//                        height: 200.0,
//                        padding: EdgeInsets.all(70.0),
//                        decoration: BoxDecoration(
//                          color: Colors.grey,
//                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                        ),
//                      ),
//                      errorWidget: (context, url, error) => Material(
//                        child: Image.asset("images/img_not_available.jpeg", width: 200.0, height: 200.0,fit: BoxFit.cover,),
//                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                        clipBehavior: Clip.hardEdge,
//
//                      ),
//                      imageUrl: document["content"],
//                      width: 200.0,
//                      height: 200.0,
//                      fit: BoxFit.cover,
//                    ),
//                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                    clipBehavior: Clip.hardEdge,
//
//                  ),
//                  onPressed: ()
//                  {
//                    Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => FullPhoto(url: document["content"])
//                    ));
//                  },
//                ),
//                margin: EdgeInsets.only(bottom: isLastMsgRight(index)? 20.0 : 10.0 , right: 10.0),
//              )
//                  :Container(),
//            ],
//            mainAxisAlignment: MainAxisAlignment.end,
//
//          );
//
//        }
//      else
//        {
//          return Container(
//            child: Column(
//              children: [
//                Row(
//                  children: [
//                    isLastMsgLeft(index)
//                    ? Material(
//                      child: CachedNetworkImage(
//
//                        placeholder: (context, url) => Container(
//                          child: CircularProgressIndicator(
//                            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
//                          ),
//                          width: 35.0,
//                          height: 35.0,
//                          padding: EdgeInsets.all(10.0),
//
//                        ),
//                        imageUrl: receiverAvatar,
//                        width: 35.0,
//                        height: 35.0,
//                        fit: BoxFit.cover,
//
//
//                      ),
//                      borderRadius: BorderRadius.all(
//                        Radius.circular(18.0),
//                      ),
//                      clipBehavior: Clip.hardEdge,
//                    )
//                        :Container(width: 35.0,),
//
//                    document["type"] == 0
//                        ? Container(
//                      child: Text(
//                        document["content"],
//                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
//
//                      ),
//                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//
//                      // padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
//                      width: 200.0,
//                        margin: EdgeInsets.only(left: 10.0),
//                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),
//                          bottomRight: Radius.circular(30.0),
//                          topRight: Radius.circular(30.0)),
//                      // margin: EdgeInsets.only(left: 10.0),
//                    ))
//                        :document["type"]== 1
//                        ? Container(
//
//                      child: TextButton(
//                        child: Material(
//                          child: CachedNetworkImage(
//                            placeholder: (context, url) => Container(
//                              child: CircularProgressIndicator(
//                                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
//                              ),
//                              width: 200.0,
//                              height: 200.0,
//                              padding: EdgeInsets.all(70.0),
//                              decoration: BoxDecoration(
//                                color: Colors.grey,
//                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                              ),
//                            ),
//                            errorWidget: (context, url, error) => Material(
//                              child: Image.asset("images/img_not_available.jpeg", width: 200.0, height: 200.0,fit: BoxFit.cover,),
//                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                              clipBehavior: Clip.hardEdge,
//
//                            ),
//                            imageUrl: document["content"],
//                            width: 200.0,
//                            height: 200.0,
//                            fit: BoxFit.cover,
//                          ),
//                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                          clipBehavior: Clip.hardEdge,
//
//                        ),
//                        onPressed: ()
//                        {
//                          Navigator.push(context, MaterialPageRoute(
//                              builder: (context) => FullPhoto(url: document["content"])
//                          ));
//                        },
//                      ),
//                      margin: EdgeInsets.only(left: 10.0),
//                    )
//                        :Container()
//                  ],
//
//                ),
//
//                isLastMsgLeft(index)
//                ? Container(
//                  child: Text(
//                    DateFormat("dd MMMM, yyyy - hh:mm:aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(document["timestamp"]))),
//                    style: TextStyle(color: Colors.grey, fontSize: 12.0, fontStyle: FontStyle.italic),
//                  ),
//                  margin: EdgeInsets.only(left: 50.0, top: 50.0, bottom: 5.0),
//                )
//                    :Container()
//              ],
//              crossAxisAlignment: CrossAxisAlignment.start,
//            ),
//            margin: EdgeInsets.only(bottom: 10.0),
//          );
//
//        }
//    }
//
//   createInput()
//   {
//     return Container(
//       child: Row(
//         children: [
//           // Material(
//           //   child: Container(
//           //     margin: EdgeInsets.symmetric(horizontal: 1.0),
//           //     child: IconButton(
//           //       icon: Icon(Icons.image),
//           //       color: Colors.lightBlueAccent,
//           //       onPressed: getImage,
//           //     ),
//           //   ),
//           //   color: Colors.white,
//           // ),
//
//           Material(
//
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 1.0),
//               child: IconButton(
//                 icon: Icon(Icons.payment),
//                 color: Colors.lightBlueAccent,
//                 //onPressed: ()=> sendUserToChatPage(context),
//                 //onPressed: sendUserToChatPage(BuildContext context),
//
//                 onPressed: () {
//                  Navigator.pushNamed(context, Extra.id );
//                 },
//               ),
//             ),
//             color: Colors.white,
//           ),
//
//           SizedBox(
//             height: 3.0,
//           ),
//
//           Flexible
//             (
//             child: Center(
//               child: Container(
//                 child: TextField(
//                   style: TextStyle(
//                     color: Colors.black, fontSize: 15.0,
//                   ),
//                   controller: payTextEditingController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration.collapsed(
//                     hintText: "..Amount",
//                     hintStyle: TextStyle(color: Colors.teal,),
//                   ),
//                   focusNode: focusNode,
//
//                 ),
//               ),
//             ),
//           ),
//           Material(
//             child: Container(
//
//               margin: EdgeInsets.symmetric(horizontal: 8.0),
//               child: IconButton(
//                 icon: Icon(Icons.send),
//                 color: Colors.lightBlueAccent,
//                 onPressed:() => onSendMessage(payTextEditingController.text , 0),
//               ),
//             ),
//
//             color: Colors.white,
//           ),
//
//           SizedBox(
//             height: 6.0,
//
//           ),
//
//           Material(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 1.0),
//               child: IconButton(
//                 icon: Icon(Icons.image),
//                 color: Colors.lightBlueAccent,
//                 onPressed: getImage,
//               ),
//             ),
//             color: Colors.white,
//           ),
//
//           // Material(
//           //
//           //   child: Container(
//           //     margin: EdgeInsets.symmetric(horizontal: 1.0),
//           //     child: IconButton(
//           //       icon: Icon(Icons.payment),
//           //       color: Colors.lightBlueAccent,
//           //       //onPressed: ()=> sendUserToChatPage(context),
//           //       //onPressed: sendUserToChatPage(BuildContext context),
//           //
//           //       onPressed: () {
//           //         Navigator.pushNamed(context, Confirm.id);
//           //       },
//           //     ),
//           //   ),
//           //   color: Colors.white,
//           // ),
//
//
//
//           Flexible
//             (
//             child: Container(
//               child: TextField(
//                 style: TextStyle(
//                   color: Colors.black, fontSize: 15.0,
//                 ),
//                 controller: textEditingController,
//                 decoration: InputDecoration.collapsed(
//                   hintText: "write here...",
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//                 focusNode: focusNode,
//
//               ),
//             ),
//           ),
//           Material(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 8.0),
//               child: IconButton(
//                 icon: Icon(Icons.send),
//                 color: Colors.lightBlueAccent,
//                 onPressed:() => onSendMessages(textEditingController.text , 0),
//               ),
//             ),
//             color: Colors.white,
//           ),
//         ],
//       ),
//       width: double.infinity,
//       height: 50.0,
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             color: Colors.grey,
//             width: 0.5,
//           ),
//         ),
//         color: Colors.white,
//       ),
//     );
//
//   }
//
//  void onSendMessages(String contentMsg, int type )
//  {
//    if(contentMsg != "")
//    {
//      textEditingController.clear();
//      var docRef = Firestore.instance.collection("messages").document(chatId).collection(chatId).document(DateTime.now().millisecondsSinceEpoch.toString());
//      Firestore.instance.runTransaction((transaction)async
//      {
//        await transaction.set(docRef,
//          {
//            "idFrom" : id,
//            "idTo" : receiverId,
//            "timestamp" : DateTime.now().millisecondsSinceEpoch.toString(),
//            "content" : contentMsg,
//            "type" : type,
//
//        },);
//
//
//      });
//      listScrollController.animateTo(0.0, duration: Duration(microseconds: 300), curve: Curves.easeOut);
//
//
//    }
//    else
//      {
//        //Fluttertoast.showToast(msg: "Empty Message..cannot be sent");
//        FlutterToast.showToast(
//            msg: "Empty Message...cannot be sent",
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.CENTER,
//            timeInSecForIosWeb: 1,
//            backgroundColor: Colors.red,
//            textColor: Colors.white,
//            fontSize: 16.0
//        );
//      }
//
//
//   }
//
//   // sendUserToChatPage(BuildContext context){
//   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Confirm
//   //     (
//   //     receiverId: eachUser.id ,
//   //     receiverAvatar: eachUser.photoUrl,
//   //     receiverName: eachUser.nickname,
//   //   )));
//   // }
//
//   void onSendMessage(String contentMsg, int type )
//   {
//     if(contentMsg != "")
//     {
//       payTextEditingController.clear();
//       var docRef = Firestore.instance.collection("payments").document(chatId).collection(chatId).document(DateTime.now().millisecondsSinceEpoch.toString());
//       Firestore.instance.runTransaction((transaction)async
//       {
//         await transaction.set(docRef,
//           {
//             "idFrom" : id,
//             "idTo" : receiverId,
//             "timestamp" : DateTime.now().millisecondsSinceEpoch.toString(),
//             "payment" : contentMsg,
//             //"type" : type,
//
//           },);
//         //Fluttertoast.showToast(msg: "you can proceed to pay now");
//         FlutterToast.showToast(
//             msg: "You can proceed to pay now",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0
//         );
//
//         Navigator.push(context, MaterialPageRoute(builder: (context) =>
//             PaymentGate()));
//
//
//       });
//       listScrollController.animateTo(0.0, duration: Duration(microseconds: 300), curve: Curves.easeOut);
//
//     }
//     else
//     {
//       //Fluttertoast.showToast(msg: "Empty Message..cannot be sent");
//     }
//
//
//   }
//
//
//
//
//   Future getImage()async
//  {
//    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    if(imageFile != null)
//      {
//        isLoading = true;
//      }
//    uploadImageFile();
//
//   }
//   Future uploadImageFile()async{
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     StorageReference storageReference = FirebaseStorage.instance.ref().child("Chat Images").child(fileName);
//     StorageUploadTask storageUploadTask = storageReference.putFile(imageFile);
//     StorageTaskSnapshot storageTaskSnapshot = await storageUploadTask.onComplete;
//
//     storageTaskSnapshot.ref.getDownloadURL().then(  (downloadUrl){
//       imageUrl = downloadUrl;
//       setState(() {
//         isLoading = false;
//         onSendMessages(imageUrl, 1);
//       });
//
//     },onError:  (error){
//       setState(() {
//         isLoading = false;
//       });
//       //Fluttertoast.showToast(msg: "Error: " + error);
//       FlutterToast.showToast(
//           msg: "Error:" + error,
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
// // void registerNotification() {
//   //   FirebaseMessaging().requestNotificationPermissions();
//   //
//   //   FirebaseMessaging().configure(onMessage: (Map<String, dynamic> message) {
//   //     print('onMessage: $message');
//   //     Platform.isAndroid
//   //         ? showNotificaions(message['notification'])
//   //         : showNotification(message['aps']['alert']);
//   //     return;
//   //   }, onResume: (Map<String, dynamic> message) {
//   //     print('onResume: $message');
//   //     return;
//   //   }, onLaunch: (Map<String, dynamic> message) {
//   //     print('onLaunch: $message');
//   //     return;
//   //   });
//   //
//   //   FirebaseMessaging().getToken().then((token) {
//   //     print('token: $token');
//   //     Firestore.instance
//   //         .collection('users')
//   //         .document(currentUserId)
//   //         .updateData({'pushToken': token});
//   //   }).catchError((err) {
//   //     Fluttertoast.showToast(msg: err.message.toString());
//   //   });
//   // }
//
// }
//
// // class Extra extends StatelessWidget {
// //
// //   final User eachUser;
// //   Extra(this.eachUser);
// //   //static String id = 'Extra';
// //   //String eachUser;
// //
// //   String phoneNo;
// //   String skilledIn;
// //
// //   // const Extra({Key key, @required this.eachUser}) : super(key: key);
// //   //const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         home: Scaffold(
// //           backgroundColor: Colors.teal,
// //           body: SafeArea(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 CircleAvatar(
// //                   radius: 50.0,
// //                   backgroundColor: Colors.red,
// //                   // backgroundImage: AssetImage('images/the-batman-day-hd-batman-wallpaper-5297111618074504.jpg'
// //                   // ),
// //                 ),
// //                 Text(
// //                   eachUser.nickname,
// //                   style: TextStyle(
// //                       fontFamily: 'Bangers',
// //                       fontSize: 40.0,
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold
// //                   ),
// //                 ),
// //                 Text(
// //                   "heyyy",
// //                   style: TextStyle(
// //                       fontFamily: 'Source Sans Pro',
// //                       color: Colors.black,
// //                       fontSize: 20.0,
// //                       letterSpacing: 2.5,
// //                       fontWeight: FontWeight.bold
// //                   ),
// //
// //
// //                 ),
// //                 SizedBox( height: 20.0,
// //                   width: 150.0,
// //                   child: Divider(
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 Card(
// //                   color: Colors.white,
// //                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
// //                   child: Row(
// //                     children: [
// //                       Icon(Icons.phone,
// //                         color: Colors.teal,
// //                         size: 50.0,
// //                       ),
// //                       SizedBox(
// //                         width: 10.0,
// //                       ),
// //                       Text(
// //                         "hy",
// //                         style: TextStyle(
// //                           color: Colors.black,
// //                           fontFamily: 'Source Sans Pro',
// //                           fontSize: 20.0,
// //                         ),
// //                       ),
// //
// //                     ],
// //                   ),
// //                 ),
// //                 Card(
// //                   color: Colors.white,
// //                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
// //                   child: Row(
// //                     children: [
// //                       Icon(Icons.mail,
// //                         color: Colors.teal,
// //                         size: 50.0,
// //                       ),
// //                       SizedBox(
// //                         width: 10.0,
// //                       ),
// //                       Text(
// //                         eachUser.skilledIn,
// //                         style: TextStyle(
// //                           color: Colors.black,
// //                           fontFamily: 'Source Sans Pro',
// //                           fontSize: 20.0,
// //                         ),
// //                       ),
// //
// //                     ],
// //                   ),
// //                 ),
// //
// //
// //               ],
// //             ),
// //           ),
// //
// //         )
// //     );
// //
// //
// //
// //   }
// // }
// //
// //
// //
//
//
//
// // class UserResult extends StatelessWidget
// // {
// //
// //   final User eachUser;
// //   UserResult(this.eachUser);
// //   @override
// //   Widget build(BuildContext context)
// //   {
// //     return Padding(
// //       padding: EdgeInsets.all(4.0),
// //       child: Container(
// //         color: Colors.white,
// //         child: Column(
// //           children: [
// //             GestureDetector(
// //               onTap: () => sendUserToChatPage(context),
// //               child: ListTile(
// //                 leading: CircleAvatar(
// //                   backgroundColor: Colors.black, backgroundImage: CachedNetworkImageProvider(eachUser.photoUrl),
// //                 ),
// //                 title: Text(
// //                   eachUser.nickname,
// //                   style: TextStyle(
// //                     color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 subtitle: Text(
// //                   eachUser.skilledIn,
// //                   style: TextStyle(
// //                     color: Colors.black,fontSize: 14.0, fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 // subtitle: Text(
// //                 //   "Joined:" + DateFormat("dd MMMM, yyyy - hh:mm:aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachUser.createdAt))),
// //                 //   style: TextStyle(color: Colors.grey, fontSize: 14.0, fontStyle: FontStyle.italic),
// //                 // ),
// //               ),
// //             ),
// //           ],
// //         ),
// //
// //       ),
// //
// //     );
// //
// //
// //   }
// //
// //   sendUserToChatPage(BuildContext context){
// //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Confirm
// //       (
// //       receiverId: eachUser.id ,
// //       //receiverAvatar: eachUser.photoUrl,
// //       receiverName: eachUser.nickname,
// //     )));
// //   }
// // }
// //
//
//
