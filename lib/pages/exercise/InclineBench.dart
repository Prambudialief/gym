import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class inclineBench extends StatefulWidget{
  const inclineBench ({super.key});

 @override
  State<inclineBench> createState() =>_inclineBench();
}
class _inclineBench extends State<inclineBench>{
  late VideoPlayerController _videoPlayerController;

  String assetVideoPath = "assets/video/incline_bench.mp4";
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
        title: Text('Incline Bench Tutorial'),
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
                'Tutorial Incline Bench\n\n'
                '1. buka lengan setengah lebar bahu\n'
                '2. Busungkan dada\n'
                '3. angkat perlahan dumbbell tersebut\n'
                '4. Lakukan 3 set 12 repitisi',
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
