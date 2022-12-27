import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fitness_mobile/home_page.dart';

import 'package:project_fitness_mobile/views/videoplay_page.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final List<String> myList = [
    "Video1",
    "Video2",
    "Video3",
    "Video4",
    "Video5",
    "Video6",
    "Video7",
    "Video8",
    "Video9",
    "Video10",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CEB8),
        title: Text(
          'Video',
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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                myList[index],
              ),
              leading: Icon(
                Icons.ondemand_video_outlined,
                size: 40,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayPage(
                      typeVdo: myList[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
        itemCount: myList.length,
      ),
    );
  }
}
