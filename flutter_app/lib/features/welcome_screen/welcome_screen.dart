import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "../../common/colors.dart";
import "../../common/feature.dart";
import "../../hooks/hooks.dart";
import "../../navigation/navigation_model.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_use/flutter_use.dart";

import "video_player.dart";

class WelcomeScreen extends HookWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = useNavigator();
    // Start fetching data for front page
    useRef(Features.setupAll(context));

    useEffectOnce(() {
      final style = SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      );

      SystemChrome.setSystemUIOverlayStyle(style);

      return () {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: CustomColor.green.lightest,
          ),
        );
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
    final hasBottomNotch = MediaQuery.of(context).viewPadding.bottom > 0;

    return Container(
      width: double.infinity,
      color: CustomColor.green.middle,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: hasBottomNotch ? 40 : 16,
          left: 24,
          right: 24,
        ),
        child: TextButton(
          onPressed: () => navigation.hasSeenWelcomeScreen(),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(CustomColor.green.lightest),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48.0),
              ),
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
