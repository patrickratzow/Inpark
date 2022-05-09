import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:video_player/video_player.dart";

class CustomVideoPlayer extends HookWidget {
  const CustomVideoPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useState(
      VideoPlayerController.network("https://i.imgur.com/0sx7vpa.mp4"),
    );

    useEffect(
      () {
        setupController(controller.value);

        return controller.dispose;
      },
      const [],
    );

    return VideoPlayer(controller.value);
  }

  Future setupController(VideoPlayerController controller) async {
    await controller.initialize();

    await Future.wait([
      controller.setPlaybackSpeed(0.7),
      controller.setLooping(true),
      controller.play(),
    ]);
  }
}
