//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:gogodoproto/constants/color_constants.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Gogodo/constants/color_constants.dart';

import 'chat_page.dart';

class ClientChat extends StatefulWidget {
  const ClientChat({Key? key}) : super(key: key);

  @override
  State<ClientChat> createState() => _ClientChatState();
}

class _ClientChatState extends State<ClientChat> {
  Widget chattiles(String name, String imgpath, String message) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            image: DecorationImage(
                image: NetworkImage(imgpath), fit: BoxFit.fill)),
      ),
      title: Text(name),
      subtitle: Text(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorConstants.primaryColor,
          title: Text("Chats"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: StreamBuilder<QuerySnapshot>(
              stream:
              FirebaseFirestore.instance.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (!snapshot.hasData) {
                  return Text("Has Error");
                }

                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                    Map<String, dynamic> messagedata =
                    doc.data()! as Map<String, dynamic>;
                    String chatId = doc.reference.id;
                    List<String> chatidlist = chatId.split('-');
                    String user = FirebaseAuth.instance.currentUser!.uid;
                    Future<DocumentSnapshot<Map<String, dynamic>>>
                    documentSnapshot = FirebaseFirestore.instance
                        .collection("messgaes")
                        .doc(chatId)
                        .collection(chatId)
                        .doc()
                        .get();
                    documentSnapshot.then((value) {
                      print(value.data().toString());
                    });

                    if (chatidlist[0] == user || chatidlist[1] == user) {
                      return FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection("freelancers")
                              .doc(chatId
                              .replaceAll(user, "")
                              .replaceAll('-', ""))
                              .get(),
                          builder: (context, snap) {
                            if (!snap.data!.exists) {
                              return Text("");
                            }
                            if (!snap.hasData) {
                              return Text("");
                            }
                            if (snap.hasError) {
                              return Text('Something went wrong');
                            }

                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Text("Loading");
                            }
                            Map<String, dynamic> data =
                            snap.data!.data() as Map<String, dynamic>;
                            String nickname = data['nickname'] ?? " ";
                            String photourl = data['photoUrl'] ?? " ";

                            return GestureDetector(
                                onTap: () {
                                  if(messagedata['idTo'] == user){
                                    FirebaseFirestore.instance.collection("messages")
                                        .doc(chatId).update({'isopened':true});
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatPage(
                                        peerId: chatId
                                            .replaceAll(user, "")
                                            .replaceAll('-', ""),
                                        peerNickname: nickname,
                                        peerAvatar: photourl,
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                        image: DecorationImage(
                                            image: NetworkImage(photourl),
                                            fit: BoxFit.fill)),
                                  ),
                                  title: Text(nickname),
                                  subtitle: Text(messagedata['message']),
                                  trailing: (messagedata['isopened'] == false)
                                      ? messagedata['idFrom'] == user
                                      ? Icon(Icons.check)
                                      : Icon(
                                    Icons.circle,
                                    size: 10,
                                    color: Colors.green,
                                  )
                                      : messagedata['idFrom'] == user
                                      ? Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  )
                                      : null,
                                ));
                          });
                    }
                    return Text("----");
                  }).toList(),
                );
              }),
        ));
  }
}