import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_use/flutter_use.dart";

import "../../../hooks/hooks.dart";
import "../models/park_map_model.dart";

class ParkMapBackground extends HookWidget {
  const ParkMapBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final model = useProvider<ParkMapModel>(watch: true);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // Find aspect ratio to compensate for the centered image later
    final aspectRatio = height / width;
    // Find the actual height of the image once it's been laid out
    final imageHeight = width / aspectRatio;
    // Find the difference between the actual height of the image and the height of the screen
    final imageTopOffset = (height - imageHeight) / 2;

    useEffectOnce(() {
      model.fetchLocations();

      return null;
    });

    return Container(
      color: Color(0xff5F8062),
      child: InteractiveViewer(
        minScale: 0.2,
        maxScale: 15,
        child: Stack(
          children: [
            Image.asset(
              "assets/zoo_oversigt.jpg",
              height: height,
            ),
            ...model.locations.map(
              (location) => Positioned(
                top: imageTopOffset +
                    ((location.location.dy / 100) * imageHeight),
                left: (location.location.dx / 100) * width,
                child: SizedBox(
                  width: location.size.width,
                  height: location.size.height,
                  child: GestureDetector(
                    onTap: () => {
                      Scaffold.of(context).showBottomSheet(
                        (context) => ParkMapSheet(
                          builder: (BuildContext context) {
                            return location.buildActions(context)!;
                          },
                        ),
                        backgroundColor: Color(0xffEAEAEA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                      ),
                    },
                    child: location.buildMapIcon(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParkMapSheet extends StatelessWidget {
  final Widget Function(BuildContext context) builder;

  const ParkMapSheet({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: HookBuilder(
          builder: (BuildContext context) {
            return builder(context);
          },
        ),
      ),
    );
  }
}
