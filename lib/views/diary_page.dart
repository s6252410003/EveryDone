import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fitness_mobile/home_page.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  DateTime? _date;
  DateTime today = DateTime.now();
  String selectDate = '';
  _dateString() {
    if (_date == null) {
      return 'Selected Day = ';
    } else {
      setState(() {
        selectDate = '${_date?.day}-${_date?.month}-${_date?.year}';
      });
      return '${_date?.day} - ${_date?.month} - ${_date?.year}';
    }
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController _textdiarycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CEB8),
        title: Text(
          'Diary',
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4 / 20.3,
              ),
              Text(
                _dateString(),
                style: GoogleFonts.kanit(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 8.3,
              ),
              ElevatedButton.icon(
                icon: Icon(
                  Icons.calendar_today_outlined,
                ),
                label: Text(
                  'CalendarDate',
                  style: GoogleFonts.kanit(
                    fontSize: 15,
                  ),
                ),
                style: (ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFFF5CEB8),
                  ),
                )),
                onPressed: () async {
                  final result = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                      2022,
                    ),
                    lastDate: DateTime(
                      2222,
                    ),
                    builder: (context, child) => Theme(
                        data: ThemeData().copyWith(
                          colorScheme: ColorScheme.dark(
                            primary: Colors.white,
                            onPrimary: Colors.black54,
                            surface: Colors.white54,
                            onSurface: Colors.black12,
                          ),
                          dialogBackgroundColor: Color(0xFFF5CEB8),
                        ),
                        child: child!),
                  );
                  if (result != null) {
                    setState(() {
                      _date = result;
                    });
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 8.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 8.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: TextFormField(
                  controller: _textdiarycontroller,
                  maxLines: 1000,
                  minLines: 9,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Enter A Message Here',
                    hintStyle: GoogleFonts.kanit(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 6.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'บักทึกข้อมูลเรียบร้อย',
                                style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
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
                      print(
                          'selectDate: ${selectDate}_${auth.currentUser!.uid}');
                      print('diary: ${_textdiarycontroller.text}');

                      FirebaseFirestore.instance
                          .collection('${selectDate}_${auth.currentUser!.uid}')
                          .add({
                        'desc': _textdiarycontroller.text,
                      });
                      var xxxx = _textdiarycontroller.text;
                    },
                    child: Text(
                      'Save',
                      style: GoogleFonts.kanit(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.red,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Color(0xFFF5CEB8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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
