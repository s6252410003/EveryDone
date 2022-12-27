import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fitness_mobile/home_page.dart';
import 'package:project_fitness_mobile/views/register_page.dart';
import 'package:project_fitness_mobile/views/reset_passwordpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isHiddenpassword = true;
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
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
                'Sign In',
                style: GoogleFonts.kanit(
                  fontSize: 55,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3 / 9.3,
              ),
              Text(
                'Welcome  \n EveryDone',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3 / 9.3,
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
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey[600],
                        ),
                        hintText: '\ Email',
                        suffixStyle: GoogleFonts.kanit(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3 / 9.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
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
                        suffixStyle: GoogleFonts.kanit(
                          fontSize: 15,
                        ),
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
                height: MediaQuery.of(context).size.height * 0.4 / 9.3,
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
                          await auth.signInWithEmailAndPassword(
                            email: Email.text,
                            password: Password.text,
                          );
                          Fluttertoast.showToast(
                            msg: " Login Successfully.",
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 15,
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } on FirebaseAuthException catch (e) {
                          Fluttertoast.showToast(
                            msg: "Please enter correct \nEmail and Password",
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 15,
                          );
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.kanit(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2 / 9.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordPage()));
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: GoogleFonts.kanit(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1.1 / 9.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have on account",
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RegisterPage();
                        }),
                      );
                    },
                    child: Text(
                      '\ Sign Up',
                      style: GoogleFonts.kanit(
                        fontSize: 13,
                        color: Colors.black,
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
