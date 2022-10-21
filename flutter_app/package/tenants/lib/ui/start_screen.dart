import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tenants/common/button.dart';
import 'package:tenants/ui/park/park_page.dart';

import '../common/color.dart';
import '../models/location_model.dart';

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
            _createButton(context)
          ],
        ),
      ),
    );
  }

  Widget _createButton(BuildContext context) {
    var location = Provider.of<LocationModel>(context);
    return CustomButton.createButton(
        context,
        "Kom igang",
        CustomColor.green.middle,
        Icon(
          Icons.arrow_forward,
          color: CustomColor.green.middle,
        ),
        () => {
              location.subscribeToLocation(),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const ParkPage()),
                ),
              )
            },
        CustomColor.green.lightest);
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
}
