import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tenants/ui/park_page.dart';

import '../common/color.dart';

class StartScreen extends HookWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: const Color(0xff698665),
        child: Column(
          children: [
            Center(
              child: Container(
                child: _buildInparkLogo(),
              ),
            ),
            _buildSvg(),
            _buildGetStartedButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildInparkLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 114),
      child: SvgPicture.asset(
        "package/tenants/assets/inpark.svg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSvg() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: SvgPicture.asset(
          "package/tenants/assets/front_page.svg",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(
    BuildContext context,
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ParkPage(),
              ),
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
