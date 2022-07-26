import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_use/flutter_use.dart";
import "../../common/colors.dart";
import "../../common/feature.dart";
import "../../common/screen.dart";
import "../../hooks/hooks.dart";
import "../../navigation/navigation_model.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_svg/flutter_svg.dart";

import "video_player.dart";

class WelcomeScreen extends HookWidget implements Screen {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = useNavigator();
    // Start fetching data for front page
    useRef(Features.setupAll(context));

    useEffectOnce(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

      return () => {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: SystemUiOverlay.values,
            )
          };
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          _buildVideo(),
          _buildSvg(),
          _buildGetStartedButton(context, navigation),
        ],
      ),
    );
  }

  Widget _buildVideo() {
    return AspectRatio(
      aspectRatio: 375 / 277,
      child: Stack(
        children: [
          const CustomVideoPlayer(),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: CustomColor.green.middle,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  CustomColor.green.middle,
                  CustomColor.green.middle.withOpacity(0),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/aalborg_zoo.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSvg() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: CustomColor.green.middle,
        child: SvgPicture.asset(
          "assets/illustration.svg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(
    BuildContext context,
    NavigationModel navigation,
  ) {
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      width: double.infinity,
      color: CustomColor.green.middle,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 16.0 + bottomViewPadding,
          left: 24,
          right: 24,
        ),
        child: TextButton(
          onPressed: () {
            navigation.hasSeenWelcomeScreen().then(
              (value) {
                navigation.pop(context);
              },
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: CustomColor.green.lightest,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kom igang",
                  style: TextStyle(color: CustomColor.green.middle),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward,
                  color: CustomColor.green.middle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
