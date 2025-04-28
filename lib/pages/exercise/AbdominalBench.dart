import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class abdominalBench extends StatefulWidget {
  const abdominalBench({super.key});

  @override
  State<abdominalBench> createState() => _abdominalBench();
}

class _abdominalBench extends State<abdominalBench> {
  late VideoPlayerController _videoPlayerController;

  String assetVideoPath = "assets/video/abdominal_bench.mp4";

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
        title: Text("Abdominal Bench Tutorial"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
              'Tutorial Abdominal Bench: \n\n'
              '1. posisikan badan telentang pada alat tersebut\n'
              '2. lalu sandarkan kaki pada ujung alat tersebu\n'
              '3. angkat perlahan-lahan badan anda untuk mendapatkan kontraksi otot perut\n'
              '4. lakukan 3 set 12 repetisi\n',
              style: TextStyle(fontSize: 16),
            )
          ],
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
