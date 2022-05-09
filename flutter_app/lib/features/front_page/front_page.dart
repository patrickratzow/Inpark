import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_app/common/colors.dart";
import "package:flutter_app/features/home/ui/home.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_app/navigation/navigation_model.dart";
import "package:flutter_app/features/front_page/video_player.dart";
import "package:flutter_svg/flutter_svg.dart";

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: Colors.transparent),
      ),
      body: Column(
        children: [
          _buildVideo(),
          _buildSvg(),
          _buildGetStartedButton(context),
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

  Widget _buildGetStartedButton(BuildContext context) {
    final navigation = useProvider<NavigationModel>();

    return Container(
      width: double.infinity,
      color: CustomColor.green.middle,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 40,
          left: 24,
          right: 24,
        ),
        child: TextButton(
          onPressed: () => navigation.replace(context, const HomeScreen()),
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
