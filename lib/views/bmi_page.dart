import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_fitness_mobile/home_page.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController Weigth = TextEditingController();
  TextEditingController Height = TextEditingController();
  int Sex = 0;
  double result = 0;

  String _singleValue = "male";
  String _verticalGroupValue = "male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CEB8),
        title: Text(
          'BMI Calculator',
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4 / 20.3,
              ),
              Image.asset(
                'assets/images/bmi.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.7 / 3.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 3.3,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height * 1.2 / 3.9,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2 / 3.9,
                  child: Text(
                    'Weigth(kg) \ :',
                    style: GoogleFonts.kanit(
                      fontSize: 15,
                    ),
                  ),
                ),
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
                height: MediaQuery.of(context).size.height * 0.1 / 3.3,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height * 1.2 / 3.9,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2 / 3.3,
                  child: Text(
                    'Height(m) \ :',
                    style: GoogleFonts.kanit(
                      fontSize: 15,
                    ),
                  ),
                ),
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
                        hintText: '\ Height(m)',
                        icon: Icon(
                          Icons.emoji_people_outlined,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 3.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Gender",
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
                height: MediaQuery.of(context).size.height * 0.1 / 3.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      var w = double.parse(Weigth.text.trim());
                      var h = double.parse(Height.text.trim());
                      setState(() {
                        result = w / (h * h);
                      });
                    },
                    child: Text(
                      'Calculate',
                      style: GoogleFonts.kanit(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1 / 3.3,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Your BMI is : ${(result).toStringAsFixed(1)}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
