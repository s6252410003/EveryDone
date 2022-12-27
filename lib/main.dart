import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_fitness_mobile/home_page.dart';
import 'package:project_fitness_mobile/views/diary_page.dart';
import 'package:project_fitness_mobile/views/login_page.dart';
import 'package:project_fitness_mobile/views/profile_page.dart';
import 'package:project_fitness_mobile/views/register_page.dart';
import 'package:project_fitness_mobile/views/reset_passwordpage.dart';
import 'package:project_fitness_mobile/views/setting_page.dart';
import 'package:project_fitness_mobile/views/splash_screenpage.dart';
import 'package:project_fitness_mobile/views/videoplay_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}
