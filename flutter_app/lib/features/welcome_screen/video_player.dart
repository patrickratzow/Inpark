import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:video_player/video_player.dart";

class CustomVideoPlayer extends HookWidget {
  const CustomVideoPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useState(
      VideoPlayerController.network(
        "https://cms.aalborgzoo.dk/media/twfdnqfc/familiefilm-sommer-1920x600-hjemmeside.mp4",
      ),
    );
    var isLoading = useState(true);

    if (isLoading.value) {
      setupController(controller.value)
          .then((value) => isLoading.value = false);
    }

    useEffect(
      () {
        return controller.dispose;
      },
      [],
    );

    return isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : VideoPlayer(controller.value);
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
