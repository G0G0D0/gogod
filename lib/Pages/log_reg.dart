import 'package:flutter/material.dart';
import 'package:Gogodo/constants/app_constants.dart';
import 'package:Gogodo/constants/color_constants.dart';
import 'package:Gogodo/pages/register_page.dart';
import 'package:Gogodo/pages/rounded_button.dart';
import 'package:Gogodo/pages/splashes_screen.dart';
import 'package:Gogodo/providers/auth_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';
import 'RoundButton.dart';
import 'pages.dart';




// import 'package:flutter/material.dart';
// import 'package:gogodoproto/Pages/splashes_screen.dart';
// import 'pages.dart';

class LogReg extends StatefulWidget {
  LogReg({Key? key}) : super(key: key);

  @override
  LogRegState createState() => LogRegState();
}

class LogRegState extends State<LogReg> {
  bool isLoggedIn = false;
  bool isLoading = false;

  GestureDetector buttons(
      String title, Color color, void function(), Color txtColor) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 60,
        width: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: txtColor, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 126, 217, 86),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/logoss.png')
                ),
              ),
            ),
            // Row(
            //
            //
            //
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     Expanded(
            //       child: Hero(
            //         tag: 'logo',
            //         child: Container(
            //           child: Image.asset('images/logoss.png'),
            //           height: 300.0,
            //           width: 350.0,
            //
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),

            // SizedBox(
            //   height: 48.0,
            // ),

            buttons('Client', Colors.black, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SplashPage(),
                ),
              );
            }, Colors.white),


            SizedBox(
              height: 15.0 ,
            ),

            buttons('Freelancer', Colors.white, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SplashesPage(),
                ),
              );
            }, Colors.black),
          ],
        ),
      ),
    );
  }
}








// class LogReg extends StatefulWidget {
//   LogReg({Key? key}) : super(key: key);
//
//   @override
//   LogRegState createState() => LogRegState();
// }
//
// class LogRegState extends State<LogReg> {
//   bool isLoggedIn = false;
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 126, 217, 86),
//
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Row(
//
//
//
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: Hero(
//                     tag: 'logo',
//                     child: Container(
//                       child: Image.asset('images/logoss.png'),
//                       height: 300.0,
//                       width: 350.0,
//
//                     ),
//                   ),
//                 ),
//                 // Center(
//                 //   child: TypewriterAnimatedTextKit(
//                 //     text: ['Gogodo'],
//                 //     textStyle: TextStyle(
//                 //       fontSize: 45.0,
//                 //       fontFamily: 'Bangers',
//                 //       fontStyle: FontStyle.italic ,
//                 //       color: Colors.white,
//                 //       fontWeight: FontWeight.w900,
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//
//             // SizedBox(
//             //   height: 8.0,
//             // ),
//
//             // Center(
//             //   child: TypewriterAnimatedTextKit(
//             //     text: ['Power Your Project'],
//             //     textStyle: TextStyle(
//             //       fontSize: 15.0,
//             //       //fontFamily: 'Bangers',
//             //         fontStyle: FontStyle.italic,
//             //       fontWeight: FontWeight.w900,
//             //       color: Colors.white
//             //     ),
//             //   ),
//             // ),
//
//             SizedBox(
//               height: 48.0,
//             ),
//
//
//
//             Center(
//               child: TextButton(
//                 onPressed: () async {
//                   //bool isSuccess = await authProvider.handleSignIn();
//                   //if (isSuccess) {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SplashPage(),
//                     ),
//                   );
//                   //}
//                 },
//                 child: Text(
//                   'Client',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//                 style: ButtonStyle(
//                   //borderRadius: BorderRadius.circular(30.0),
//
//                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) return Colors.black.withOpacity(0.8);
//                       return Colors.black;
//                     },
//                   ),
//                   splashFactory: NoSplash.splashFactory,
//                   padding: MaterialStateProperty.all<EdgeInsets>(
//                     EdgeInsets.fromLTRB(75, 20, 75, 20),
//                   ),
//                 ),
//               ),
//             ),
//
//
//
//
//             // GestureDetector(
//             //
//             //   //onTap: controlSignIn,
//             //
//             //   //children: [Expanded( )],
//             //   child: RoundButton(
//             //
//             //     title: 'User',
//             //     colour: Colors.black,
//             //     onPressed: () {
//             //       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//             //
//             //       //Navigator.pushNamed(context, LoginScreen.id);
//             //     },
//             //
//             //
//             //   ),
//             //
//             // ),
//
//
//             SizedBox(
//               height: 24.0,
//             ),
//
//
//             Center(
//               child: TextButton(
//                 onPressed: () async {
//                   //bool isSuccess = await authProvider.handleSignIn();
//                   //if (isSuccess) {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SplashesPage(),
//                     ),
//                   );
//                   //}
//                 },
//                 child: Text(
//                   'Freelancer',
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//                 style: ButtonStyle(
//                   //borderRadius: BorderRadius.circular(30.0),
//
//                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) return Colors.white.withOpacity(0.8);
//                       return Colors.white;
//                     },
//                   ),
//                   splashFactory: NoSplash.splashFactory,
//                   padding: MaterialStateProperty.all<EdgeInsets>(
//                     EdgeInsets.fromLTRB(60, 20, 60, 20),
//                   ),
//                 ),
//               ),
//             ),
//
//
//
//
//             // GestureDetector(
//             //
//             //   //onTap: controlIn,
//             //   child: RoundedButton(
//             //     title: 'Freelancer',
//             //     colour: Colors.white,
//             //
//             //     onPressed: () {
//             //       //Navigator.pushNamed(context, RegisterPortal.id);
//             //     },
//             //   ),
//             //
//             // ),
//
//
//
//           ],
//         ),
//       ),
//
//
//
//
//     );
//     //AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     // switch (authProvider.status) {
//     //   case Status.authenticateError:
//     //     Fluttertoast.showToast(msg: "Sign in fail");
//     //     break;
//     //   case Status.authenticateCanceled:
//     //     Fluttertoast.showToast(msg: "Sign in canceled");
//     //     break;
//     //   case Status.authenticated:
//     //     Fluttertoast.showToast(msg: "Sign in success");
//     //     break;
//     //   default:
//     //     break;
//     // }
//     // return Scaffold(
//     //     appBar: AppBar(
//     //       title: Text(
//     //         AppConstants.loginTitle,
//     //         style: TextStyle(color: ColorConstants.primaryColor),
//     //       ),
//     //       centerTitle: true,
//     //     ),
//     //     body: Stack(
//     //       children: <Widget>[
//     //         Center(
//     //           child: TextButton(
//     //             onPressed: () async {
//     //               //bool isSuccess = await authProvider.handleSignIn();
//     //               //if (isSuccess) {
//     //                 Navigator.pushReplacement(
//     //                   context,
//     //                   MaterialPageRoute(
//     //                     builder: (context) => SplashPage(),
//     //                   ),
//     //                 );
//     //               //}
//     //             },
//     //             child: Text(
//     //               'Client',
//     //               style: TextStyle(fontSize: 16, color: Colors.white),
//     //             ),
//     //             style: ButtonStyle(
//     //               backgroundColor: MaterialStateProperty.resolveWith<Color>(
//     //                     (Set<MaterialState> states) {
//     //                   if (states.contains(MaterialState.pressed)) return Color(0xffdd4b39).withOpacity(0.8);
//     //                   return Color(0xffdd4b39);
//     //                 },
//     //               ),
//     //               splashFactory: NoSplash.splashFactory,
//     //               padding: MaterialStateProperty.all<EdgeInsets>(
//     //                 EdgeInsets.fromLTRB(30, 15, 30, 15),
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //
//
//
//             // Loading
//             // Positioned(
//             //   //child: authProvider.status == Status.authenticating ? LoadingView() : SizedBox.shrink(),
//             // ),
//           //],
//         //));
//   }
// }