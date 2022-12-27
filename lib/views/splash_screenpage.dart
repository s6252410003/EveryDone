import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(
      seconds: 3,
    )).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => LoginPage()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 2.5 / 2,
        height: MediaQuery.of(context).size.width * 3.5 / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 34, 33, 35),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "  Welcome  \n  Everydone ",
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset('assets/fitness.json'),
            CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 64, 63, 67),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
