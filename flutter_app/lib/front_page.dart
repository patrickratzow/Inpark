import "package:flutter/material.dart";
import "package:flutter_app/common/colors.dart";
import 'package:flutter_app/routes.dart';
import "package:flutter_svg/flutter_svg.dart";

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AspectRatio(
            aspectRatio: 375 / 277,
            child: Placeholder(),
          ),
          //Stack(),
          Expanded(
            child: Container(
              width: double.infinity,
              color: CustomColor.green.middle,
              child: SvgPicture.asset(
                "assets/illustration.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: CustomColor.green.middle,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 16,
                left: 24,
                right: 24,
              ),
              child: TextButton(
                onPressed: () {
                  Routes.goToRoute(context, "/home");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(CustomColor.green.lightest),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48.0),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Kom igang",
                        style: TextStyle(color: CustomColor.green.middle)),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.arrow_forward,
                      color: CustomColor.green.middle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
