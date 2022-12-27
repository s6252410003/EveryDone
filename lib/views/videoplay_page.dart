import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fitness_mobile/home_page.dart';
import 'package:project_fitness_mobile/views/setting_page.dart';
import 'package:project_fitness_mobile/views/video_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayPage extends StatefulWidget {
  String typeVdo;

  VideoPlayPage({super.key, required this.typeVdo});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late YoutubePlayerController _controller;

  var url;

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();
    switch (widget.typeVdo) {
      case 'Video1':
        url = 'https://www.youtube.com/watch?v=2_aeIBN5AHA';
        break;
      case 'Video2':
        url = 'https://www.youtube.com/watch?v=8cI9q3gptng';
        break;
      case 'Video3':
        url = 'https://www.youtube.com/watch?v=4g4CejaUWCY';
        break;
      case 'Video4':
        url = 'https://www.youtube.com/watch?v=7QfYcpXTCwk&t=3s';
        break;
      case 'Video5':
        url = 'https://www.youtube.com/watch?v=LQNnpdgBfG0';
        break;
      case 'Video6':
        url = 'https://www.youtube.com/watch?v=fcg0TIpG37A';
        break;
      case 'Video7':
        url = 'https://www.youtube.com/watch?v=mF04BBwFkTw';
        break;
      case 'Video8':
        url = 'https://www.youtube.com/watch?v=EbVZs_MDgn8';
        break;
      case 'Video9':
        url = 'https://www.youtube.com/watch?v=-oW0vZM5v2I';
        break;
      case 'Video10':
        url = 'https://www.youtube.com/watch?v=2wmq06JodCA';
        break;
    }

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!);
    flags:
    YoutubePlayerFlags(
      forceHD: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                context, MaterialPageRoute(builder: (context) => VideoPage()));
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fill,
          child: YoutubePlayer(
            aspectRatio: 16 / 9,
            controller: _controller,
            onReady: () => debugPrint(
              'Ready',
            ),
            bottomActions: [
              CurrentPosition(),
              const SizedBox(width: 10.0),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.white,
                  handleColor: Colors.white,
                ),
              ),
              const SizedBox(width: 10.0),
              PlaybackSpeedButton(),
              FullScreenButton(
                color: Colors.white,
              ),
              RemainingDuration(),
            ],
          ),
        ),
      ),
    );
  }
}
