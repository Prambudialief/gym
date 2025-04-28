import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BarbellRow extends StatefulWidget {
  const BarbellRow({super.key});

  @override
  State<BarbellRow> createState() => _BarbellRowState();
}

class _BarbellRowState extends State<BarbellRow> {
  late VideoPlayerController _videoPlayerController;

  String assetVideoPath = "assets/video/back_barbell_row.mp4";

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(assetVideoPath)
      ..initialize().then((_) {
        setState(() {}); // Update UI ketika video siap diputar
        _videoPlayerController.play(); // Auto play saat video siap
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
      appBar: AppBar(title: const Text('Barbell Row')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  )
                : const Center(child: CircularProgressIndicator()),

            const SizedBox(height: 24), // Spasi antara video dan teks

            const Text(
              'Tutorial Barbell Row:\n\n'
              '1. Mulai dengan posisi berdiri, punggung agak membungkuk.\n'
              '2. Pegang barbell dengan genggaman overhand.\n'
              '3. Tarik barbell ke arah perut sambil kontraksikan otot punggung.\n'
              '4. Turunkan perlahan dan ulangi.\n\n'
              'Pastikan punggung tetap lurus dan gerakan terkontrol.',
              style: TextStyle(fontSize: 16),
            ),
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
