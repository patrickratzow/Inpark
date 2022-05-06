import "package:flutter/material.dart";
import "package:video_player/video_player.dart";

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network("https://i.imgur.com/0sx7vpa.mp4")
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
            _controller.setPlaybackSpeed(0.7);
            _controller.setLooping(true);
            _controller.play();
          });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
