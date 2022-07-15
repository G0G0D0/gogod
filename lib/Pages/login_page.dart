import 'package:flutter/material.dart';
import 'package:Gogodo/constants/app_constants.dart';
import 'package:Gogodo/constants/color_constants.dart';
import 'package:Gogodo/pages/rounded_button.dart';
import 'package:Gogodo/providers/auth_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';




import '../widgets/widgets.dart';
import 'pages.dart';

class LoginPage extends StatefulWidget {
  //static const String id = 'login_page';

  LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    //AnimationController controller;
    // Animation animation;
    // NativeAd? nativeAd;
    bool isLoaded=false;

    @override
    void didChangeDependencies() {
      // TODO: implement didChangeDependencies
      super.didChangeDependencies();
      // nativeAd=NativeAd(adUnitId: "ca-app-pub-1836626178823657/8909511879"
      //   , factoryId: "listTile", listener: NativeAdListener(
      //       onAdLoaded: (_)
      //       {
      //         setState(() {
      //           isLoaded=true;
      //         });
      //         print("Ad Loaded");
      //       },
      //
      //       onAdFailedToLoad: (ad,error){
      //         print("Ad Failed To Load");
      //         ad.dispose();
      //
      //       }
      //   ),
      //   request: AdRequest(),);
      // nativeAd!.load();
    }



    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                height: 50,
                // decoration:
                // BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "gogo",
                      style:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text("do",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  bool isSuccess = await authProvider.handleSignIn();
                  if (isSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/glogo.png'))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Sign In as client",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async{
                  const url = 'https://g0g0d0.github.io/Gogodo-Privacy-Policy/';
                  if (await canLaunch(url)) launch(url);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(200.0,0,0,0),
                  child: Text("privacy policy", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue
                  ),),
                ),
              ),

              SizedBox(
                width: 20,
              ),


              GestureDetector(
                onTap: () async{
                  const url = 'https://youtu.be/05U4Ng2ExcI';
                  if (await canLaunch(url)) launch(url);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(200.0,0,0,0),
                  child: Text("Help", style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue
                  ),),
                ),
              ),






            ],
          )),
    );
  }
}















// class LoginPage extends StatefulWidget {
//   //static const String id = 'login_page';
//
//   LoginPage({Key? key}) : super(key: key);
//
//   @override
//   LoginPageState createState() => LoginPageState();
// }
//
// class LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//
//     //AnimationController controller;
//     // Animation animation;
//     NativeAd? nativeAd;
//     bool isLoaded=false;
//
//     @override
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
//     nativeAd!.load();
//   }
//
//
//
//     AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     switch (authProvider.status) {
//       case Status.authenticateError:
//         Fluttertoast.showToast(msg: "Sign in fail");
//         break;
//       case Status.authenticateCanceled:
//         Fluttertoast.showToast(msg: "Sign in canceled");
//         break;
//       case Status.authenticated:
//         Fluttertoast.showToast(msg: "Sign in success");
//         break;
//       default:
//         break;
//     }
//     return Stack(
//       children:[ Scaffold(
//         //backgroundColor: animation.value,
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//
//
//
// //     SizedBox(
// // //               height: 8.0,
// // //             ),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: Hero(
//                       tag: 'logo',
//                       child: Container(
//                         child: Image.asset('images/logoss.png'),
//                         height: 150.0,
//                         width: 150.0,
//
//
//                       ),
//                     ),
//                   ),
//
//
//
//
//
//
//
//                     // Center(
//                   //   child: TypewriterAnimatedTextKit(
//                   //     text: ['Gogodo'],
//                   //     textStyle: TextStyle(
//                   //       fontSize: 45.0,
//                   //       fontFamily: 'Bangers',
//                   //       fontStyle: FontStyle.italic ,
//                   //       color: Colors.white,
//                   //       fontWeight: FontWeight.w900,
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//
//               // SizedBox(
//               //   height: 8.0,
//               // ),
//
//               // Center(
//               //   child: TypewriterAnimatedTextKit(
//               //     text: ['Power Your Project'],
//               //     textStyle: TextStyle(
//               //       fontSize: 15.0,
//               //       //fontFamily: 'Bangers',
//               //         fontStyle: FontStyle.italic,
//               //       fontWeight: FontWeight.w900,
//               //       color: Colors.white
//               //     ),
//               //   ),
//               // ),
//
//               // SizedBox(
//               //   height: 368.0,
//               // ),
//
//
//
//               // Center(
//               //   child: TextButton(
//               //     onPressed: () async {
//               //       //bool isSuccess = await authProvider.handleSignIn();
//               //       //if (isSuccess) {
//               //       Navigator.pushReplacement(
//               //         context,
//               //         MaterialPageRoute(
//               //           builder: (context) => SplashPage(),
//               //         ),
//               //       );
//               //       //}
//               //     },
//               //     child: Text(
//               //       'Client',
//               //       style: TextStyle(fontSize: 16, color: Colors.white),
//               //     ),
//               //     style: ButtonStyle(
//               //       //borderRadius: BorderRadius.circular(30.0),
//               //
//               //       backgroundColor: MaterialStateProperty.resolveWith<Color>(
//               //             (Set<MaterialState> states) {
//               //           if (states.contains(MaterialState.pressed)) return Colors.black.withOpacity(0.8);
//               //           return Colors.black;
//               //         },
//               //       ),
//               //       splashFactory: NoSplash.splashFactory,
//               //       padding: MaterialStateProperty.all<EdgeInsets>(
//               //         EdgeInsets.fromLTRB(30, 15, 30, 15),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//
//
//
//
//               // GestureDetector(
//               //
//               //   //onTap: controlSignIn,
//               //
//               //   //children: [Expanded( )],
//               //   child: RoundButton(
//               //
//               //     title: 'User',
//               //     colour: Colors.black,
//               //     onPressed: () {
//               //       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//               //
//               //       //Navigator.pushNamed(context, LoginScreen.id);
//               //     },
//               //
//               //
//               //   ),
//               //
//               // ),
//               // SizedBox(
//               //   height: 8.0,
//               // ),
//
//               Container(
//
//                 height: 500,
//                 //width: 800,
//                 child: isLoaded? AdWidget(ad: nativeAd!,):
//                 Center(
//                   child: Text("Ad Is Loading..."),
//                 ),
//               ),
//
//
//               SizedBox(
//                 height: 10.0,
//               ),
//
//
//               Stack(
//                 children:[ Center(
//                   child: TextButton(
//                     onPressed: () async {
//                       bool isSuccess = await authProvider.handleSignIn();
//                       if (isSuccess) {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomePage(),
//                           ),
//                         );
//                       }
//                     },
//                     child: Text(
//                       'Sign in as a client',
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                     style: ButtonStyle(
//                       //borderRadius: BorderRadius.circular(30.0),
//
//                       backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.pressed)) return Colors.black.withOpacity(0.8);
//                           return Colors.black;
//                         },
//                       ),
//                       splashFactory: NoSplash.splashFactory,
//                       padding: MaterialStateProperty.all<EdgeInsets>(
//                         EdgeInsets.fromLTRB(30, 15, 30, 15),
//                       ),
//                     ),
//                   ),
//                 ),
//       ],
//               ),
//
//               SizedBox(
//                 height: 18.0,
//               ),
//
//               Center(
//                 child: Linkify(
//                   text: "Help - https://youtu.be/05U4Ng2ExcI",
//                   style: TextStyle(color: Colors.black),
//                   onOpen: (link) {
//                     launch(link.url);
//                     print("opened succesfully ${link.url}");
//                   },
//                   linkStyle: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline),
//                 ),
//               ),
//
//               SizedBox(
//                 height: 28.0,
//               ),
//
//               Center(
//                 child: Linkify(
//                   text: "Privacy Policy - https://g0g0d0.github.io/Gogodo-Privacy-Policy/",
//                   style: TextStyle(color: Colors.black),
//                   onOpen: (link) {
//                     launch(link.url);
//                     print("opened succesfully ${link.url}");
//                   },
//                   linkStyle: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline),
//                 ),
//               ),
//               // Positioned(
//               //   child: authProvider.status == Status.authenticating ? LoadingView() : SizedBox.shrink(),
//               // ),
//
//
//
//
//
//               // GestureDetector(
//               //
//               //   //onTap: controlIn,
//               //   child: RoundedButton(
//               //     title: 'Freelancer',
//               //     colour: Colors.white,
//               //
//               //     onPressed: () {
//               //       //Navigator.pushNamed(context, RegisterPortal.id);
//               //     },
//               //   ),
//               //
//               // ),
//
//
//
//             ],
//           ),
//         ),
//
//
//         // appBar: AppBar(
//           //   title: Text(
//           //     AppConstants.loginTitle,
//           //     style: TextStyle(color: ColorConstants.primaryColor),
//           //   ),
//           //   centerTitle: true,
//           // ),
//           // body: Stack(
//           //   children: <Widget>[
//           //     Center(
//           //       child: TextButton(
//           //         onPressed: () async {
//           //           bool isSuccess = await authProvider.handleSignIn();
//           //           if (isSuccess) {
//           //             Navigator.pushReplacement(
//           //               context,
//           //               MaterialPageRoute(
//           //                 builder: (context) => HomePage(),
//           //               ),
//           //             );
//           //           }
//           //         },
//           //         child: Text(
//           //           'Sign in with Google',
//           //           style: TextStyle(fontSize: 16, color: Colors.white),
//           //         ),
//           //         style: ButtonStyle(
//           //           backgroundColor: MaterialStateProperty.resolveWith<Color>(
//           //                 (Set<MaterialState> states) {
//           //               if (states.contains(MaterialState.pressed)) return Color(0xffdd4b39).withOpacity(0.8);
//           //               return Color(0xffdd4b39);
//           //             },
//           //           ),
//           //           splashFactory: NoSplash.splashFactory,
//           //           padding: MaterialStateProperty.all<EdgeInsets>(
//           //             EdgeInsets.fromLTRB(30, 15, 30, 15),
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //     // Loading
//           //     Positioned(
//           //       child: authProvider.status == Status.authenticating ? LoadingView() : SizedBox.shrink(),
//           //     ),
//           //   ],
//           // ));
//       ),
//     ],
//     );
//   }
// }