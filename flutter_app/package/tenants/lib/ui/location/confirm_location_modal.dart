import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenants/common/button.dart';

import '../../common/color.dart';

class ConfirmLocationModal extends HookWidget {
  const ConfirmLocationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Confirm location'),
        onPressed: () {
          _showModalBottom(context);
        },
      ),
    );
  }

  Future<void> _showModalBottom(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 510,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  "package/tenants/assets/map_with_background.svg",
                ),
                const SizedBox(
                  height: 38,
                ),
                _createButton(context)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _createButton(BuildContext context) {
    return CustomButton.createButton(
        context,
        "Kom igang",
        CustomColor.green.lightest,
        Icon(
          Icons.arrow_forward,
          color: CustomColor.green.lightest,
        ),
        () => {},
        CustomColor.green.middle);
  }
}
