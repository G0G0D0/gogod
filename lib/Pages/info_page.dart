import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Gogodo/constants/app_constants.dart';
import 'package:Gogodo/constants/color_constants.dart';
import 'package:Gogodo/constants/constants.dart';
import 'package:Gogodo/models/convo_chat.dart';
import 'package:Gogodo/models/models.dart';
import 'package:Gogodo/providers/providers.dart';
import 'package:Gogodo/widgets/loading_view.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'coin_data.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        //backgroundColor: Color.fromARGB(255, 126, 217, 86),

    (
        backgroundColor: Color.fromARGB(255, 126, 217, 86),

        title: Text(
          AppConstants.settingsTitle,
          style: TextStyle(color: ColorConstants.primaryColor),
        ),
        centerTitle: true,
      ),
      body: InfoPageState(),
    );
  }
}

class InfoPageState extends StatefulWidget {
  @override
  State createState() => InfoPageStateState();
}



class InfoPageStateState extends State<InfoPageState> {

  // String level = "Beginner";
  // String skilledIn = "";

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem
    <String>> dropdownItems = [];
    for (String Photographer in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(Photographer),
        value: Photographer,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: skilledIn,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          skilledIn = value!;
          //getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String Photographer in currenciesList) {
      pickerItems.add(Text(Photographer));
    }

    return CupertinoPicker(
      backgroundColor: Colors.teal,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          skilledIn = currenciesList[selectedIndex];
          //getData();
        });
      },
      children: pickerItems,
    );
  }


 DropdownButton<String> androiDropdown() {
    List<DropdownMenuItem
    <String>> dropdownItems = [];
    for (String currency in LevelList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: level,
      items: dropdownItems,
      onChanged: (covariant) {
        setState(() {
          level = covariant!;
          //getData();
        });
      },
    );
  }

  CupertinoPicker iOPicker() {
    List<Text> pickerItems = [];
    for (String currency in LevelList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.teal,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          level = LevelList[selectedIndex];
          //getData();
        });
      },
      children: pickerItems,
    );
  }









  TextEditingController? controllerNickname;
  TextEditingController? controllerAboutMe;
  TextEditingController? controllerIntro;
  TextEditingController? controllerSkilledIn;
  TextEditingController? controllerPhoneNo;
  TextEditingController? controllerAadharNo;
  TextEditingController? controllerAccountNumber;
  TextEditingController? controllerInstitute;
  TextEditingController? controllerIfscCode;
  TextEditingController? controllerEdqua;
  TextEditingController? controllerAchievements;
  TextEditingController? controllerExperience;
  TextEditingController? controllerLevel;



  String id = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '';
  String intro = "";
  String skilledIn = "";
  String phoneNo = "";
  String aadharNo = "";
  String accountNumber = "";
  String institute = "";
  String ifscCode = "";
  String edqua = "";
  String achievements = "";
  String experience = "";
  String level = "";

  bool isLoading = false;
  File? avatarImageFile;
  late SettingProvider settingProvider;

  final FocusNode nicknameFocusNode = FocusNode();
  final FocusNode aboutMeFocusNode = FocusNode();
  final FocusNode skilledInFocusNode = FocusNode();
  final FocusNode phoneNoFocusNode = FocusNode();
  final FocusNode aadharNoFocusNode = FocusNode();
  final FocusNode accountNumberFocusNode = FocusNode();
  final FocusNode instituteFocusNode = FocusNode();
  final FocusNode ifscCodeFocusNode = FocusNode();
  final FocusNode edquaFocusNode = FocusNode();
  final FocusNode levelFocusNode = FocusNode();
  final FocusNode introFocusNode = FocusNode();
  final FocusNode experienceFocusNode = FocusNode();
  final FocusNode achievementsFocusNode = FocusNode();
  //final FocusNode levelFocusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    settingProvider = context.read<SettingProvider>();
    readLocal();
  }

  void readLocal() {
    setState(() {
      id = settingProvider.getPref(FirestoreConstants.id) ?? "";
      nickname = settingProvider.getPref(FirestoreConstants.nickname) ?? "";
      aboutMe = settingProvider.getPref(FirestoreConstants.aboutMe) ?? "";
      photoUrl = settingProvider.getPref(FirestoreConstants.photoUrl) ?? "";
      skilledIn = settingProvider.getPref(FirestoreConstants.skilledIn) ?? "";
      phoneNo = settingProvider.getPref(FirestoreConstants.phoneNo) ?? "";
      aadharNo = settingProvider.getPref(FirestoreConstants.aadharNo) ?? "";
      accountNumber = settingProvider.getPref(FirestoreConstants.accountNumber) ?? "";
      institute = settingProvider.getPref(FirestoreConstants.institute) ?? "";
      ifscCode = settingProvider.getPref(FirestoreConstants.ifscCode) ?? "";
      edqua = settingProvider.getPref(FirestoreConstants.edqua) ?? "";
      level = settingProvider.getPref(FirestoreConstants.level) ?? "";
      intro = settingProvider.getPref(FirestoreConstants.intro) ?? "";
      experience = settingProvider.getPref(FirestoreConstants.experience) ?? "";
      achievements = settingProvider.getPref(FirestoreConstants.achievements) ?? "";

    });
    controllerNickname = TextEditingController(text: nickname);
    controllerAboutMe = TextEditingController(text: aboutMe);
    controllerSkilledIn = TextEditingController(text: skilledIn);
    controllerPhoneNo = TextEditingController(text: phoneNo);
    controllerAadharNo = TextEditingController(text: aadharNo);
    controllerAccountNumber = TextEditingController(text: accountNumber);
    controllerInstitute = TextEditingController(text: institute);
    controllerIfscCode = TextEditingController(text: ifscCode);
    controllerEdqua = TextEditingController(text: edqua);
    controllerLevel = TextEditingController(text: level);
    controllerIntro = TextEditingController(text: intro);
    controllerExperience = TextEditingController(text: experience);
    controllerAchievements = TextEditingController(text: achievements);

  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.gallery).catchError((err) {
      Fluttertoast.showToast(msg: err.toString());
    });
    File? image;
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    if (image != null) {
      setState(() {
        avatarImageFile = image;
        isLoading = true;
      });
      uploadFile();
    }
  }

  Future uploadFile() async {
    String fileName = id;
    UploadTask uploadTask = settingProvider.uploadFile(avatarImageFile!, fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      photoUrl = await snapshot.ref.getDownloadURL();
      UserConvo updateInfo = UserConvo(
        id: id,
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
        level:  level,
      );
      settingProvider
          .updateDataFirestore(FirestoreConstants.pathFreelancerCollection, id, updateInfo.toJson())
          .then((data) async {
        await settingProvider.setPref(FirestoreConstants.photoUrl, photoUrl);
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "Upload success");
      }).catchError((err) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: err.toString());
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }

  void handleUpdateData() {
    nicknameFocusNode.unfocus();
    aboutMeFocusNode.unfocus();
    skilledInFocusNode.unfocus();
    phoneNoFocusNode.unfocus();
    aadharNoFocusNode.unfocus();
    accountNumberFocusNode.unfocus();
    instituteFocusNode.unfocus();
    ifscCodeFocusNode.unfocus();
    edquaFocusNode.unfocus();
    levelFocusNode.unfocus();
    introFocusNode.unfocus();
    experienceFocusNode.unfocus();
    achievementsFocusNode.unfocus();


    setState(() {
      isLoading = true;
    });
    UserConvo updateInfo = UserConvo(
      id: id,
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
    settingProvider
        .updateDataFirestore(FirestoreConstants.pathFreelancerCollection, id, updateInfo.toJson())
        .then((data) async {
      await settingProvider.setPref(FirestoreConstants.nickname, nickname);
      await settingProvider.setPref(FirestoreConstants.aboutMe, aboutMe);
      await settingProvider.setPref(FirestoreConstants.photoUrl, photoUrl);
      await settingProvider.setPref(FirestoreConstants.skilledIn, skilledIn);
      await settingProvider.setPref(FirestoreConstants.aadharNo, aadharNo);
      await settingProvider.setPref(FirestoreConstants.accountNumber, accountNumber);
      await settingProvider.setPref(FirestoreConstants.intro, intro);
      await settingProvider.setPref(FirestoreConstants.ifscCode,ifscCode );
      await settingProvider.setPref(FirestoreConstants.level, level);
      await settingProvider.setPref(FirestoreConstants.achievements, achievements);
      await settingProvider.setPref(FirestoreConstants.institute, institute);
      await settingProvider.setPref(FirestoreConstants.phoneNo, phoneNo);
      await settingProvider.setPref(FirestoreConstants.edqua, edqua);
      //await settingProvider.setPref(FirestoreConstants., photoUrl);


      setState(() {
        isLoading = false;
      });

      

      Fluttertoast.showToast(msg: "Update success");
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Avatar
              CupertinoButton(
                onPressed: getImage,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: avatarImageFile == null
                      ? photoUrl.isNotEmpty
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.network(
                      photoUrl,
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                      errorBuilder: (context, object, stackTrace) {
                        return Icon(
                          Icons.account_circle,
                          size: 90,
                          color: ColorConstants.greyColor,
                        );
                      },
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 90,
                          height: 90,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorConstants.themeColor,
                              value: loadingProgress.expectedTotalBytes != null &&
                                  loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                      : Icon(
                    Icons.account_circle,
                    size: 90,
                    color: ColorConstants.greyColor,
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.file(
                      avatarImageFile!,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Input
              Column(
                children: <Widget>[
                  // Username
                  Container(
                    child: Text(
                      'Name',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                         // hintText: 'Sweetie',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerNickname,
                        onChanged: (value) {
                          nickname = value;
                        },
                        focusNode: nicknameFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),

                  // About me
                  // Container(
                  //   child: Text(
                  //     'About me',
                  //     style: TextStyle(
                  //         fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                  //   ),
                  //   margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  // ),
                  // Container(
                  //   child: Theme(
                  //     data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                  //     child: TextField(
                  //       decoration: InputDecoration(
                  //         hintText: 'Fun, like travel and play PES...',
                  //         contentPadding: EdgeInsets.all(5),
                  //         hintStyle: TextStyle(color: ColorConstants.greyColor),
                  //       ),
                  //       controller: controllerAboutMe,
                  //       onChanged: (value) {
                  //         aboutMe = value;
                  //       },
                  //       focusNode: aboutMeFocusNode,
                  //     ),
                  //   ),
                  //   margin: EdgeInsets.only(left: 30, right: 30),
                  // ),


                  Container(
                    child: Text(
                      'skilled in:( Available jobs: Content Writer/ Cad designer/App developer/Web developer/Social media manager/Influencer/ Pianist/Music programmer/Editor/Graphic designer/Nutritionist/Mental wellness coach/Photographer/Event management/Data analyst/ Lyricist/Fitness trainer)',

                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(

                    // height: 50.0,
                    // alignment: Alignment.center,
                    // padding: EdgeInsets.only(bottom: 10.0),
                    // color: Colors.lightBlueAccent,
                    // child: Platform.isIOS ? iOSPicker() : androidDropdown(),
                    // //child: Theme(
                    //
                    //
                    //   //key: _formKey,
                    //   //data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
                    //   // child: TextField(
                    //   //   // decoration: InputDecoration(
                    //   //   //
                    //   //   //   hintText: "Enter the skillset of your expertise ",
                    //   //   //   contentPadding:  EdgeInsets.all(5.0),
                    //   //   //   hintStyle: TextStyle(color: Colors.grey),
                    //   //   // ),
                    //   //   controller: skilledInTextEditingController,
                    //   //   onChanged: (value){
                    //   //     skilledIn = value;
                    //   //   },
                    //   //   focusNode: skilledInFocusNode,
                    //   // ),
                    // //),
                    // margin: EdgeInsets.only(left: 30.0, right: 30.0),

                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: 'Enter the skill of your expertise...',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerSkilledIn,
                        onChanged: (value) {
                          skilledIn = value;
                        },
                        focusNode: skilledInFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),

                  Container(
                    child: Text(
                      'Level:',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),


                  Container(
                  //   child: Text(
                  //     'level',
                  //     style: TextStyle(
                  //         fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                  //   ),
                  //   margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  // ),
                  // Container(
                  //   height: 50.0,
                  //   alignment: Alignment.center,
                  //   padding: EdgeInsets.only(bottom: 10.0),
                  //   color: Colors.lightBlueAccent,
                  //   child: Platform.isIOS ? iOPicker() : androiDropdown(),
                  //   //child: Theme(
                  //
                  //
                  //   //key: _formKey,
                  //   //data: Theme.of(context).copyWith(primaryColor: Colors.lightBlueAccent),
                  //   // child: TextField(
                  //   //   // decoration: InputDecoration(
                  //   //   //
                  //   //   //   hintText: "Enter the skillset of your expertise ",
                  //   //   //   contentPadding:  EdgeInsets.all(5.0),
                  //   //   //   hintStyle: TextStyle(color: Colors.grey),
                  //   //   // ),
                  //   //   controller: skilledInTextEditingController,
                  //   //   onChanged: (value){
                  //   //     skilledIn = value;
                  //   //   },
                  //   //   focusNode: skilledInFocusNode,
                  //   // ),
                  //   //),
                  //   margin: EdgeInsets.only(left: 30.0, right: 30.0),


                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: 'Beginner/intermediate/professional',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerLevel  ,
                        onChanged: (value) {
                          level = value;
                        },
                        focusNode: levelFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                   ),

                  Container(
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                          //hintText: 'Fun, like travel and play PES...',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerPhoneNo,
                        onChanged: (value) {
                          phoneNo = value;
                        },
                        focusNode: phoneNoFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),


                  Container(
                    child: Text(
                      'Aadhar Id',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                          //hintText: 'Fun, like travel and play PES...',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerAadharNo,
                        onChanged: (value) {
                          aadharNo = value;
                        },
                        focusNode: aadharNoFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),

                  Container(
                    child: Text(
                      'Account Number',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                          //hintText: 'Fun, like travel and play PES...',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerAccountNumber,
                        onChanged: (value) {
                          accountNumber = value;
                        },
                        focusNode: accountNumberFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),

                  Container(
                    child: Text(
                      'Name of the institute',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your institute name',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerInstitute,
                        onChanged: (value) {
                          institute = value;
                        },
                        focusNode: instituteFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),

                  Container(
                    child: Text(
                      'Education Qualification',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                          //hintText: 'Fun, like travel and play PES...',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerEdqua,
                        onChanged: (value) {
                          edqua = value;
                        },
                        focusNode: edquaFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),


                  Container(
                    child: Text(
                      'IFSC code',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                          //hintText: 'Fun, like travel and play PES...',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerIfscCode,
                        onChanged: (value) {
                          ifscCode = value;
                        },
                        focusNode: ifscCodeFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),


                  Container(
                    child: Text(
                      'Experience',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                          //hintText: 'Fun, like travel and play PES...',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerExperience,
                        onChanged: (value) {
                          experience = value;
                        },
                        focusNode: experienceFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),

                  Container(
                    child: Text(
                      'Achievements',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(primaryColor: ColorConstants.primaryColor),
                      child: TextField(
                        decoration: InputDecoration(
                          //hintText: 'Fun, like travel and play PES...',
                          contentPadding: EdgeInsets.all(5),
                          hintStyle: TextStyle(color: ColorConstants.greyColor),
                        ),
                        controller: controllerAchievements,
                        onChanged: (value) {
                          achievements = value;
                        },
                        focusNode: achievementsFocusNode,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),


                  Container(
                    child: Text(

                      "proof of skill:",
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black),
                    ),

                    margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 30.0,),
                    
                    




                  ),
                //crossAxisAlignment: CrossAxisAlignment.start,




              Container(
                child: Linkify(
                  text: "Click Here - https://forms.gle/5vyaBhivaSwaqRqh8",
                  style: TextStyle(color: Colors.black),
                  onOpen: (link) {
                    launch(link.url);
                    print("opened succesfully ${link.url}");
                  },
                  linkStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),








                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),

              // Button
              Container(
                child: TextButton(

                  onPressed:()
                  {
                  if(controllerNickname!.text.length<4)
                  {

                    Fluttertoast.showToast(msg: "Name must contain at least 3 characters ");
                  // FlutterToast.showToast(
                  // msg: "Name mut contain at least 3 characters ",
                  // toastLength: Toast.LENGTH_SHORT,
                  // gravity: ToastGravity.CENTER,
                  // timeInSecForIosWeb: 1,
                  // backgroundColor: Colors.red,
                  // textColor: Colors.white,
                  // fontSize: 16.0
                  // );
                  //displayToastMessage("name must contain at least 3 characters", context);
                  }

                  if(controllerLevel!.text.isEmpty)
                  {

                    Fluttertoast.showToast(msg: "Enter the skill of your expertise ");
                    // FlutterToast.showToast(
                    // msg: "Name mut contain at least 3 characters ",
                    // toastLength: Toast.LENGTH_SHORT,
                    // gravity: ToastGravity.CENTER,
                    // timeInSecForIosWeb: 1,
                    // backgroundColor: Colors.red,
                    // textColor: Colors.white,
                    // fontSize: 16.0
                    // );
                    //displayToastMessage("name must contain at least 3 characters", context);
                  }

                  if(controllerLevel!.text.isEmpty)
                  {

                    Fluttertoast.showToast(msg: "please fill in the level column ");
                    // FlutterToast.showToast(
                    // msg: "Name mut contain at least 3 characters ",
                    // toastLength: Toast.LENGTH_SHORT,
                    // gravity: ToastGravity.CENTER,
                    // timeInSecForIosWeb: 1,
                    // backgroundColor: Colors.red,
                    // textColor: Colors.white,
                    // fontSize: 16.0
                    // );
                    //displayToastMessage("name must contain at least 3 characters", context);
                  }



                  else if(controllerPhoneNo!.text.length<9)
                  {
                    Fluttertoast.showToast(
                        msg: "Phone number is mandatory",
                        // toastLength: Toast.LENGTH_SHORT,
                        // gravity: ToastGravity.CENTER,
                        // timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        // textColor: Colors.white,
                        // fontSize: 16.0
                    );
                    // displayToastMessage("Phone number is mandatory", context);
                  }

                  else if(controllerAadharNo!.text.length<11)
                  {
                    Fluttertoast.showToast(
                        msg: "Invalid aadhaar id",
                        // toastLength: Toast.LENGTH_SHORT,
                        // gravity: ToastGravity.CENTER,
                        // timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        // textColor: Colors.white,
                        // fontSize: 16.0
                    );
                    //displayToastMessage("choose either of the one (cad/Coding/content writing)", context);
                  }

                  else if(controllerAchievements!.text.length<7)
                  {
                    Fluttertoast.showToast(
                        msg: "experience column must contain ateast 6 characters",
                        // toastLength: Toast.LENGTH_SHORT,
                        // gravity: ToastGravity.CENTER,
                        // timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        // textColor: Colors.white,
                        // fontSize: 16.0
                    );
                    //displayToastMessage("choose either of the one (cad/Coding/content writing)", context);
                  }

                  else if(controllerEdqua!.text.length<5)
                  {
                    Fluttertoast.showToast(
                        msg: "write your education qualification within 6 characters",
                        // toastLength: Toast.LENGTH_SHORT,
                        // gravity: ToastGravity.CENTER,
                        // timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        // textColor: Colors.white,
                        // fontSize: 16.0
                    );
                    //displayToastMessage("choose either of the one (cad/Coding/content writing)", context);
                  }

                  else if(controllerInstitute!.text.isEmpty)
                  {
                    Fluttertoast.showToast(
                        msg: "Please enter the name of the institute",
                        // toastLength: Toast.LENGTH_SHORT,
                        // gravity: ToastGravity.CENTER,
                        // timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        // textColor: Colors.white,
                        // fontSize: 16.0
                    );
                    //displayToastMessage("Password must contain at least 7 characters", context);
                  }

                  else if(controllerAccountNumber!.text.isEmpty)
                  {
                    Fluttertoast.showToast(
                        msg: "Please enter your account number",
                        // toastLength: Toast.LENGTH_SHORT,
                        // gravity: ToastGravity.CENTER,
                        // timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        // textColor: Colors.white,
                        // fontSize: 16.0
                    );
                    //displayToastMessage("Password must contain at least 7 characters", context);
                  }


                  else if(controllerIfscCode!.text.isEmpty)
                  {
                    Fluttertoast.showToast(
                        msg: "Please enter your ifsc code",
                        // toastLength: Toast.LENGTH_SHORT,
                        // gravity: ToastGravity.CENTER,
                        // timeInSecForIosWeb: 1,
                        // backgroundColor: Colors.red,
                        // textColor: Colors.white,
                        // fontSize: 16.0
                    );
                    //displayToastMessage("Password must contain at least 7 characters", context);
                  }








                  else{
                    handleUpdateData();
                  }

                  },

                  //handleUpdateData,

                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.primaryColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.fromLTRB(30, 10, 30, 10),
                    ),
                  ),
                ),
                margin: EdgeInsets.only(top: 50, bottom: 50),
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 15, right: 15),
        ),

        // Loading
        Positioned(child: isLoading ? LoadingView() : SizedBox.shrink()),
      ],
    );
  }
}