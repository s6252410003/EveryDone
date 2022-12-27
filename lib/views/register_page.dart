import 'package:bottom_picker/resources/arrays.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:ionicons/ionicons.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isHiddenpassword = true;
  var birth = 'XXXXXXX';
  TextEditingController FullName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController EnterPassword = TextEditingController();
  TextEditingController Weigth = TextEditingController();
  TextEditingController Height = TextEditingController();
  TextEditingController Birthday = TextEditingController();
  int Sex = 0;

  String _singleValue = "male";
  String _verticalGroupValue = "male";

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Set your Birthday',
      dateOrder: DatePickerDateOrder.dmy,
      maxDateTime: DateTime.now(),
      minDateTime: DateTime(
        1940,
        1,
        1,
      ),
      pickerTextStyle: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.grey[600],
      ),
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
        setState(() {
          String b = index.toString();
          var birthdate = b.substring(0, 10);
          birth = birthdate;
        });
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.kanit(
                  fontSize: 55,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 5.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: FullName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.kanit(
                          fontSize: 15,
                        ),
                        hintText: '\ Full Name',
                        icon: Icon(
                          Icons.person_outline,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 9.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: Email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.kanit(
                          fontSize: 15,
                        ),
                        hintText: '\ Email',
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 9.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: Password,
                      obscureText: isHiddenpassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.kanit(
                          fontSize: 15,
                        ),
                        icon: Icon(
                          Icons.vpn_key_outlined,
                          color: Colors.grey[600],
                        ),
                        hintText: '\ Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHiddenpassword = !isHiddenpassword;
                            });
                          },
                          icon: Icon(isHiddenpassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 9.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: EnterPassword,
                      obscureText: isHiddenpassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.kanit(
                          fontSize: 15,
                        ),
                        icon: Icon(
                          Icons.vpn_key_outlined,
                          color: Colors.grey[600],
                        ),
                        hintText: '\ Enter Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHiddenpassword = !isHiddenpassword;
                            });
                          },
                          icon: Icon(isHiddenpassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 9.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: Weigth,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.kanit(
                          fontSize: 15,
                        ),
                        hintText: '\ Weigth(kg)',
                        icon: Icon(
                          Icons.monitor_weight_outlined,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 9.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: Height,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.kanit(
                          fontSize: 15,
                        ),
                        hintText: '\ Height(cm)',
                        icon: Icon(
                          Icons.emoji_people_outlined,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.8 / 7,
                      width: MediaQuery.of(context).size.width * 3.5 / 4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          _openDatePicker(context);
                        },
                        child: Text(
                          'Select birthday',
                          style: GoogleFonts.kanit(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                birth,
                style: GoogleFonts.kanit(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "  Gender ",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'kanit',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Ionicons.man_sharp,
                    color: Colors.grey[600],
                  ),
                  RadioButton(
                    description: "Male",
                    value: "Male",
                    groupValue: _singleValue,
                    onChanged: (value) => setState(
                      () => _singleValue = value!,
                    ),
                    activeColor: Colors.grey[600],
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Kanit',
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Ionicons.woman_sharp,
                    color: Colors.grey[600],
                  ),
                  RadioButton(
                    description: "Female",
                    value: "Female",
                    groupValue: _singleValue,
                    onChanged: (value) => setState(
                      () => _singleValue = value!,
                    ),
                    activeColor: Colors.grey[600],
                    textStyle: TextStyle(
                      fontFamily: 'Kanit.ttf',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 9.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 1.8 / 20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () async {
                        try {
                          await auth.createUserWithEmailAndPassword(
                            email: Email.text.trim(),
                            password: Password.text.trim(),
                          );
                          final User? user = auth.currentUser;
                          final _uid = user!.uid;

                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(_uid)
                              .set({
                            'id': _uid,
                            'name': FullName.text,
                            'email': Email.text,
                            'birth': birth.toString(),
                            'height': Height.text,
                            'weigth': Weigth.text,
                            'gender': _singleValue.toString(),
                          });
                          Fluttertoast.showToast(
                            msg: "Account Created \nSuccessfully.",
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 15,
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        } on FirebaseAuthException catch (e) {
                          if (Password.text != EnterPassword.text) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'คำเตือน',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  content: Text(
                                      'กรุณากรอกข้อมูลให้ถูกต้อง...\ ! \ '),
                                  titleTextStyle: GoogleFonts.kanit(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                  actions: [
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Text(
                                          'ตกลง',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.black),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (Weigth.text == '') {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'คำเตือน',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ),
                                    content: Text(
                                        'กรุณากรอกข้อมูลให้ถูกต้อง...\ ! \ '),
                                    titleTextStyle: GoogleFonts.kanit(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text(
                                            'ตกลง',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.black),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          } else if (Height.text == '') {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'คำเตือน',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ),
                                    content: Text(
                                        'กรุณากรอกข้อมูลให้ถูกต้อง...\ ! \ '),
                                    titleTextStyle: GoogleFonts.kanit(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text(
                                            'ตกลง',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.black),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          } else if (Email.text == '') {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'คำเตือน',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ),
                                    content: Text(
                                        'กรุณากรอกข้อมูลให้ถูกต้อง...\ ! \ '),
                                    titleTextStyle: GoogleFonts.kanit(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text(
                                            'ตกลง',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.black),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          } else if (FullName.text == '') {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'คำเตือน',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ),
                                    content: Text(
                                        'กรุณากรอกข้อมูลให้ถูกต้อง...\ ! \ '),
                                    titleTextStyle: GoogleFonts.kanit(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text(
                                            'ตกลง',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.black),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }
                          ;
                        }
                        ;
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.kanit(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 9.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.kanit(
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }),
                      );
                    },
                    child: Text(
                      '\ Sign In',
                      style: GoogleFonts.kanit(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
