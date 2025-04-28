import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class benchPres extends StatefulWidget{
  const benchPres ({super.key});

  State<benchPres> createState() => _benchPress();
}

class _benchPress extends State<benchPres>{
  late VideoPlayerController _videoPlayerController;

  String assetVideoPath = "assets/video/bench_press.mp4";

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(assetVideoPath)
    ..initialize().then((_){
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
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bench Press Tutorial'),
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
              : const Center(child: CircularProgressIndicator()),
              SizedBox(height: 24),
              Text(
                'Tutorial Bench Press\n\n'
                '1. Posisikan badan telentang pada bench\n'
                '2. Busungkan dada\n'
                '3. Angkat perlahan dumbbell tersebut\n'
                '4. lakukan 3 set 12 repetisi',
                style: TextStyle(fontSize: 16),
              ),
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
        child: Icon(
          _videoPlayerController.value.isPlaying
          ? Icons.pause
          : Icons.play_arrow
        ),
      ),
    );
  }
}
