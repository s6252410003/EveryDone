import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:intl/intl.dart';
import 'package:project_fitness_mobile/home_page.dart';
import 'package:project_fitness_mobile/views/setting_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();
  }

  Future _getData() async {
    var data;
    data = await FirebaseFirestore.instance
        .collection('users')
        .doc('JGpEMU8JKRPwuuVessZsexB0gre2')
        .snapshots();

    print('data: ${data}');
    print('auth: ${auth.currentUser!.uid}');
  }

  @override
  static final Map<String, String> genderMap = {
    'male': 'Male',
    'female': 'Female',
  };

  void onGenderSelected(String genderKey) {}
  String _selectedGender = genderMap.keys.first;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CEB8),
        title: Text(
          'My Profile',
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingPage()));
          },
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(auth.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('no data');
            return Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.2 / 2,
                top: MediaQuery.of(context).size.height * 0.2 / 30,
                right: MediaQuery.of(context).size.height * 0.2 / 2,
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width:
                                MediaQuery.of(context).size.height * 0.5 / 3.0,
                            height:
                                MediaQuery.of(context).size.height * 0.5 / 2.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: Colors.black,
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/04/20/17/39/man-731900_1280.jpg',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4 / 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          snapshot.data?['name'],
                          style: GoogleFonts.kanit(
                            color: Colors.black26,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.4 / 20.0,
                        ),
                        Text(
                          'Email',
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          auth.currentUser!.email!,
                          style: GoogleFonts.kanit(
                            fontSize: 15,
                            color: Colors.black26,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.4 / 20.0,
                        ),
                        Text(
                          'Weighth',
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          snapshot.data?['weigth'],
                          style: GoogleFonts.kanit(
                            color: Colors.black26,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.4 / 20.0,
                        ),
                        Text(
                          'Height',
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          snapshot.data?['height'],
                          style: GoogleFonts.kanit(
                            color: Colors.black26,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.4 / 20.0,
                        ),
                        Text(
                          'Birthday',
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          snapshot.data?['birth'],
                          style: GoogleFonts.kanit(
                            color: Colors.black26,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.4 / 20.0,
                        ),
                        Text(
                          'Gender',
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.4 / 20.0,
                        ),
                        Text(
                          snapshot.data?['gender'],
                          style: GoogleFonts.kanit(
                            color: Colors.black26,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4 / 20.0,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
