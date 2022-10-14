import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FetchParksScreen extends HookWidget {
  const FetchParksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String searchParkText = "Searching parks";

    return Column(
      children: [
        SvgPicture.asset("package/tenants/assets/map.svg"),
        const Text(
          "Søger efter parker...",
          style: TextStyle(
            color: Color(0xffCFCFCF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
