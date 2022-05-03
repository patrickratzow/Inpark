import 'dart:math';

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:intl/intl.dart";

import "../../../generated_code/zooinator.models.swagger.dart";

class SpeakRow extends StatelessWidget {
  final SpeakDto speak;
  const SpeakRow({Key? key, required this.speak}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat("HH:mm");
    //formatter.format(speak.start),
    return InkWell(
      onTap: () {
        print("xd");
      },
      child: Padding(
        padding: EdgeInsets.only(top: 4, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: speak.image.previewUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        speak.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 20 / 14,
                        ),
                      ),
                      Text(
                        "Kl. " + formatter.format(speak.start),
                      )
                    ],
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            NotifyButton(
              initialState: false,
              onPressed: (state) {
                print("State is $state");
              },
            )
          ],
        ),
      ),
    );
  }
}

class NotifyButton extends HookWidget {
  final Function(bool active) onPressed;
  final bool initialState;
  final Color offColor;
  final Color onColor;

  NotifyButton({
    Key? key,
    required this.onPressed,
    required this.initialState,
    this.offColor = const Color(0xffA3A3A3),
    this.onColor = const Color(0xff698665),
  }) : super(key: key);

  static double deg2rad(double deg) => deg * (pi / 180);

  @override
  Widget build(BuildContext context) {
    final state = useState(initialState);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final colorTween = ColorTween(
      begin: initialState ? onColor : offColor,
      end: !initialState ? onColor : offColor,
    ).animate(animationController);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        const shakeCount = 1;
        const shakeOffset = 1;
        final sineValue = sin(shakeCount * 2 * pi * animationController.value);

        return IconButton(
          icon: Transform.rotate(
            angle: deg2rad(sineValue * 3),
            child: Transform.translate(
              offset: Offset(sineValue * shakeOffset, 0),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/clock_icon.svg",
                    height: 14 * 1.5,
                    width: 12 * 1.5,
                    color: colorTween.value,
                  ),
                  Transform.translate(
                    offset: Offset(
                      3 - (animationController.value * 3),
                      1 - (animationController.value * 4),
                    ),
                    child: SvgPicture.asset(
                      "assets/clock_bow.svg",
                      width: (8 + (animationController.value * 4)) * 1.5,
                      color: colorTween.value,
                    ),
                  ),
                  Transform.rotate(
                    angle: deg2rad(sineValue * 10),
                    child: SvgPicture.asset(
                      "assets/clock_dingle.svg",
                      width: 12 * 1.5,
                      color: colorTween.value,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onPressed: () {
            state.value = !state.value;
            if (state.value) {
              animationController.forward();
            } else {
              animationController.reverse();
            }

            onPressed(state.value);
          },
        );
      },
    );
  }
}
