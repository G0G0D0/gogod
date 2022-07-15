// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:Gogodo/Pages/SecondPage.dart';
//
// class User {
//   final String id;
//   final String nickname;
//   final String photoUrl;
//   final String createdAt;
//   final String skilledIn;
//   final String phoneNo;
//   final String intro;
//   final String level;
//   final String edqua;
//   final String experience;
//   final String achievements;
//
//   User({
//     this.id,
//     this.nickname,
//     this.photoUrl,
//     this.createdAt,
//     this.skilledIn,
//     this.phoneNo,
//     this.intro,
//     this.level,
//     this.edqua,
//     this.experience,
//     this.achievements
//   });
//
//   factory User.fromDocument(DocumentSnapshot doc) {
//     return User(
//       id: doc.documentID,
//       photoUrl: doc['photoUrl'],
//       nickname: doc['nickname'],
//       createdAt: doc['createdAt'],
//       skilledIn: doc['skilledIn'],
//       phoneNo: doc['phoneNo'],
//       intro: doc['intro'],
//       level: doc['level'],
//       edqua: doc['edqua'],
//       experience: doc['experience'],
//       achievements: doc['achievements'],
//
//
//
//
//     );
//   }
//
//
//
//}