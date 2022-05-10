import 'dart:async';
import 'dart:math';

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/features/speaks/models/speak.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:intl/intl.dart";

import '../../../hooks/use_memoized_value.dart';
import '../../../hooks/use_provider.dart';
import '../models/speak_model.dart';

class SpeakRow extends HookWidget {
  final Speak speak;
  final int id;
  const SpeakRow({Key? key, required this.speak, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
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
                        "Kl. " + DateFormat("HH:mm").format(speak.start),
                      )
                    ],
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            SpeakRowActions(speak),
          ],
        ),
      ),
    );
  }
}

class SpeakRowActions extends HookWidget {
  final Speak speak;

  const SpeakRowActions(this.speak);

  @override
  Widget build(BuildContext context) {
    final model = useProvider<SpeakModel>();
    final isToggled = model.isToggled(speak);
    final state = useMemoizedValue<SpeakState>(
      const Duration(seconds: 1),
      () => speak.state,
    );

    Widget notifyButton() {
      return NotifyButton(
        time: speak.start,
        initialState: isToggled,
        onPressed: (state) async {
          try {
            final turnedOn = await model.toggleNotification(speak);
            final text = turnedOn
                ? "Du får en notifikation 15 minutter før ${speak.title} speak starter"
                : "Du er afmeldt notifikationer for ${speak.title}";

            showSnackBar(text, context);

            return true;
          } catch (e) {
            showSnackBar(
              "Du har ikke givet tilladelse til notifikationer",
              context,
            );

            return false;
          }
        },
      );
    }

    Widget text(String text) {
      return Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Text(
          text,
          textAlign: TextAlign.left,
        ),
      );
    }

    Widget content() {
      if (state.value == SpeakState.upcoming) return notifyButton();
      if (state.value == SpeakState.happeningSoon) {
        return text("Starter lige om lidt");
      }
      if (state.value == SpeakState.happening) return text("Er startet");
      if (state.value == SpeakState.over) return text("Ovre for i dag");

      return Container();
    }

    return Container(child: content());
  }

  void showSnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: Text(text),
      ),
    );
  }
}

class NotifyButton extends HookWidget {
  final Future<bool> Function(bool active) onPressed;
  final bool initialState;
  final Color offColor;
  final Color onColor;
  final DateTime time;

  const NotifyButton({
    Key? key,
    required this.time,
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
          onPressed: () async {
            var success = await onPressed(state.value);
            if (success) {
              state.value = !state.value;

              if (state.value) {
                animationController.forward();
              } else {
                animationController.reverse();
              }
            }
          },
        );
      },
    );
  }
}
