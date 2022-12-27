import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fitness_mobile/home_page.dart';
import 'package:project_fitness_mobile/views/bmi_page.dart';

import 'package:project_fitness_mobile/views/login_page.dart';
import 'package:project_fitness_mobile/views/profile_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

final auth = FirebaseAuth.instance;

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CEB8),
        title: Text(
          'Setting',
          style: GoogleFonts.kanit(
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2 / 2.3,
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height * 0.2 / 2.3,
                    height: MediaQuery.of(context).size.height * 0.2 / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.person_outline_sharp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.1 / 4.3,
                  ),
                  Text(
                    'Account',
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.2 / 2.3,
                      height: MediaQuery.of(context).size.height * 0.2 / 2.3,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2 / 2.3,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.height * 0.2 / 2.3,
                  height: MediaQuery.of(context).size.height * 0.2 / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent,
                  ),
                  child: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.1 / 4.3,
                ),
                Text(
                  'Logout',
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    auth.signOut().then(
                          (value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          ),
                        );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.2 / 2.3,
                    height: MediaQuery.of(context).size.height * 0.2 / 2.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
