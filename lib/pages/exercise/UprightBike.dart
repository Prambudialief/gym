import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class uprightBike extends StatefulWidget {
  const uprightBike({super.key});

  @override
  State<uprightBike> createState() => _uprightBike();
}

class _uprightBike extends State<uprightBike> {
  late VideoPlayerController _videoPlayerController;

  String assetVideoPath = "assets/video/upright_bike.mp4";

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(assetVideoPath)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upright Bike Tutorial',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              SizedBox(height: 24),
              Text(
                'Tutorial Upright Bike\n\n'
                '1. condongkan badan kedepan sedikit\n'
                '2. kayuh pedal perlahan-lahan untuk mendapatkan kontraksi otot\n'
                '3. dan lakukan gerakan ini selama 15 menit\n',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
        },
        child: Icon(_videoPlayerController.value.isPlaying
            ? Icons.pause
            : Icons.play_arrow
        ),
      ),
    );
  }
}
