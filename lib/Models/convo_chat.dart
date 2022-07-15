import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';

class UserConvo {
  String id;
  String photoUrl;
  String nickname;
  String aboutMe;
  String intro;
  String skilledIn;
  String phoneNo ;
  String aadharNo;
  String accountNumber;
  String institute;
  String ifscCode;
  String edqua ;
  String achievements;
  String experience;
  String level;

  UserConvo({required this.id, required this.photoUrl, required this.nickname, required this.aboutMe,required this.intro,
    required this.skilledIn, required this.phoneNo, required this.aadharNo, required this.accountNumber, required this.institute,
    required this.level, required this.experience, required this.achievements, required this.ifscCode,required this.edqua,

  });

  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.photoUrl: photoUrl,
      FirestoreConstants.intro:intro,
      FirestoreConstants.skilledIn:skilledIn,
      FirestoreConstants.phoneNo:phoneNo,
      FirestoreConstants.aadharNo:aadharNo,
      FirestoreConstants.accountNumber:accountNumber,
      FirestoreConstants.institute:institute,
      FirestoreConstants.edqua:edqua,
      FirestoreConstants.ifscCode:ifscCode,
      FirestoreConstants.achievements:achievements,
      FirestoreConstants.experience:experience,
      FirestoreConstants.level:level,
    };
  }

  factory UserConvo.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String nickname = "";
    String intro = "";
    String skilledIn = "content writer";
    String phoneNo = "";
    String aadharNo = "";
    String accountNumber = "";
    String institute = "";
    String ifscCode = "";
    String edqua = "";
    String achievements = "";
    String experience = "";
    String level = "";


    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (e) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (e) {}
    try {
      skilledIn = doc.get(FirestoreConstants.skilledIn);
    } catch (e) {}

    try {
      edqua = doc.get(FirestoreConstants.edqua);
    } catch (e) {}

    try {
      ifscCode = doc.get(FirestoreConstants.ifscCode);
    } catch (e) {}

    try {
      achievements = doc.get(FirestoreConstants.achievements);
    } catch (e) {}

    try {
      experience = doc.get(FirestoreConstants.experience);
    } catch (e) {}

    try {
      level = doc.get(FirestoreConstants.level);
    } catch (e) {}

    try {
      institute = doc.get(FirestoreConstants.institute);
    } catch (e) {}

    try {
      accountNumber = doc.get(FirestoreConstants.accountNumber);
    } catch (e) {}

    try {
      aadharNo = doc.get(FirestoreConstants.aadharNo);
    } catch (e) {}

    try {
      phoneNo = doc.get(FirestoreConstants.phoneNo);
    } catch (e) {}

    try {
      intro = doc.get(FirestoreConstants.intro);
    } catch (e) {}

    return UserConvo(
      id: doc.id,
      photoUrl: photoUrl,
      nickname: nickname,
      aboutMe: aboutMe,
      intro: intro,
      skilledIn: skilledIn ,
      phoneNo: phoneNo,
      aadharNo: aadharNo,
      accountNumber: accountNumber,
      institute: institute,
      ifscCode: ifscCode,
      edqua: edqua,
      achievements: achievements,
      experience: experience,
      level: level,
    );
  }
}