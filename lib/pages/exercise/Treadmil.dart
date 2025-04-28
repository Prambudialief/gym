import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class treadmilPage extends StatefulWidget{
  const treadmilPage ({super.key});

  @override
  State<treadmilPage> createState() =>_treadmillPage();
}
class _treadmillPage extends State<treadmilPage>{
  late VideoPlayerController _videoPlayerController;

  String assetVideoPath = "assets/video/treadmil.mp4";
  @override
  void initState(){
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Treadmil Tutorial'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _videoPlayerController.value.isInitialized
              ? AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
              )
              : Center(
                child: CircularProgressIndicator(),
              ),
              SizedBox(height: 24),
              Text(
                'Tutorial Treadmil\n\n'
                '1. Posisikan badan tegak\n'
                '2. Jalan cepat saja dengan speed 3 incline 12-15\n'
                '3. Dan lakukan gerakan ini selama 15 menit\n',
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
          child: Icon(
            _videoPlayerController.value.isPlaying
            ? Icons.pause
            : Icons.play_arrow,
          ),
        ),
    );
  }
}
