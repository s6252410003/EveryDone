import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fitness_mobile/views/bmi_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:project_fitness_mobile/views/diary_page.dart';
import 'package:project_fitness_mobile/views/profile_page.dart';

import 'package:project_fitness_mobile/views/setting_page.dart';
import 'package:project_fitness_mobile/views/video_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SettingPage()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
            selectedColor: Color(0xFFF5CEB8),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text(''),
            selectedColor: Color(0xFFF5CEB8),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height / 2.2,
              color: Color(0xFFF5CEB8),
              child: Image.asset('assets/images/undraw_pilates.png'),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.4 / 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.5 / 9,
                          left: MediaQuery.of(context).size.width * 1.0 / 22,
                        ),
                        child: Text(
                          'Hello \nEveryDone',
                          style: GoogleFonts.kanit(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 1.0 / 2,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9 / 2,
                    height: MediaQuery.of(context).size.width * 0.9 / 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BmiPage()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        elevation: 50,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/weight.png',
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.width * 0.1 / 3,
                            ),
                            Text(
                              'BMI',
                              style: GoogleFonts.kanit(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1 / 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 1.0 / 2,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9 / 2,
                    height: MediaQuery.of(context).size.width * 0.9 / 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPage()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        elevation: 40,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/video.png',
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.width * 0.1 / 3,
                            ),
                            Text(
                              'Workout Videos',
                              style: GoogleFonts.kanit(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.9 / 2,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9 / 2,
                      height: MediaQuery.of(context).size.width * 0.9 / 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiaryPage()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          elevation: 40,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/calendar.png',
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.1 / 3,
                              ),
                              Text(
                                'Diary',
                                style: GoogleFonts.kanit(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1 / 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
