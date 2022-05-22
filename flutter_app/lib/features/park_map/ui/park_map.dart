import "package:flutter/material.dart";

import "park_map_background.dart";

class ParkMap extends StatelessWidget {
  const ParkMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ParkMapBackground(),
      ],
    );
  }
}
