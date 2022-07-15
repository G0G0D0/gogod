import 'package:flutter/material.dart';
import 'package:Gogodo/constants/color_constants.dart';
import 'package:Gogodo/pages/register_page.dart';
import 'package:Gogodo/pages/second_page.dart';
import 'package:Gogodo/''providers/auth_provider.dart';
import 'package:Gogodo/providers/authfree_provider.dart';
import 'package:provider/provider.dart';

import 'pages.dart';

class SplashesPage extends StatefulWidget {
  static const String id = 'splashes_page';

  SplashesPage({Key? key}) : super(key: key);

  @override
  SplashesPageState createState() => SplashesPageState();
}

class SplashesPageState extends State<SplashesPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      // just delay for showing this slash page clearer because it too fast
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthFreeProvider authFreeProvider = context.read<AuthFreeProvider>();
    bool isLoggedIn = await authFreeProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/logoss.png",
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: ColorConstants.themeColor),
            ),
          ],
        ),
      ),
    );
  }
}