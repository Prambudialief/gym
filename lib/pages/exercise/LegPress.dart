import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class legPress extends StatefulWidget{
  const legPress ({super.key});

@override
  State<legPress> createState() =>_legPress();
}
class _legPress extends State<legPress>{
  late VideoPlayerController _videoPlayerController;

  String assetVideoPath = "assets/video/leg_press.mp4";
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
        title: Text('Leg press Tutorial'),
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
                'Tutorial Leg Press\n\n'
                '1. buka kaki selebar bahu\n'
                '2. Dorong kaki perlahan-lahan\n'
                '3. lakukan 3 set 12 repetisi\n',
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
