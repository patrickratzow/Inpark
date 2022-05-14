import "dart:async";
import "dart:math";

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/features/speaks/models/speak.dart";
import "package:flutter_app/features/speaks/models/speak_color_pair.dart";
import "package:flutter_app/features/speaks/models/speak_state.dart";
import "package:flutter_app/hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_use/flutter_use.dart";
import "package:intl/intl.dart";

import "../models/speak_model.dart";

class SpeakRowImage extends StatelessWidget {
  final String imageUrl;
  final SpeakState state;

  const SpeakRowImage({
    super.key,
    required this.imageUrl,
    required this.state,
  });

  ImageWidgetBuilder? _imageBuilder() {
    if (state == SpeakState.over || state == SpeakState.upcoming) return null;

    return ((context, imageProvider) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 19,
              width: 19,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                color: state.color.backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.5),
                child: SvgPicture.asset(
                  "assets/clock.svg",
                  color: state.color.iconColor,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          imageBuilder: _imageBuilder(),
        ),
      ),
    );
  }
}

class SpeakRow extends HookWidget {
  final Speak speak;
  final int id;

  const SpeakRow({
    super.key,
    required this.speak,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final state = useMemoizedValue<SpeakState>(
      const Duration(seconds: 1),
      () => speak.state,
    );
    final theme = useTheme();

    return Padding(
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
                SpeakRowImage(
                  imageUrl: speak.image.previewUrl,
                  state: state.value,
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
                      style: theme.textTheme.headline5?.copyWith(
                        height: 1.428,
                      ),
                    ),
                    Text(
                      "Kl. " + DateFormat("HH:mm").format(speak.start),
                      style: theme.textTheme.bodyText2,
                    )
                  ],
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          SpeakRowActions(
            speak: speak,
            state: state.value,
          ),
        ],
      ),
    );
  }
}

class SpeakRowActions extends HookWidget {
  final Speak speak;
  final SpeakState state;

  const SpeakRowActions({
    super.key,
    required this.speak,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final model = useProvider<SpeakModel>();
    final isToggled = model.isToggled(speak);
    useIntervalMinute();

    Widget notifyButton() {
      return FutureBuilder(
        future: isToggled,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Der opstod en fejl"),
            );
          }
          if (snapshot.hasData) {
            return NotifyButton(
              time: speak.start,
              initialState: snapshot.data!,
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

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    Widget text(String text) {
      return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          text,
          textAlign: TextAlign.left,
        ),
      );
    }

    Widget content() {
      if (state == SpeakState.upcoming) return notifyButton();
      if (state == SpeakState.happeningSoon) {
        final now = DateTime.now();
        final start = speak.start;
        final diff = start.difference(now);
        final minutes = diff.inMinutes;
        final minutesText = minutes == 1 ? "minut" : "minutter";

        return text("Starter om $minutes $minutesText");
      }
      if (state == SpeakState.happening) return text("Startet");
      if (state == SpeakState.over) return text("Ovre");

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
  final SpeakColorPair offColor;
  final SpeakColorPair onColor;
  final DateTime time;

  const NotifyButton({
    Key? key,
    required this.time,
    required this.onPressed,
    required this.initialState,
    this.offColor = const SpeakColorPair(Color(0xff8E8E8E), Color(0xffEEF2EE)),
    this.onColor = const SpeakColorPair(Color(0xffECFCE5), Color(0xff698665)),
  }) : super(key: key);

  static double deg2rad(double deg) => deg * (pi / 180);

  @override
  Widget build(BuildContext context) {
    final state = useState(initialState);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final iconTween = ColorTween(
      begin: offColor.iconColor,
      end: onColor.iconColor,
    ).animate(animationController);
    final backgroundTween = ColorTween(
      begin: offColor.backgroundColor,
      end: onColor.backgroundColor,
    ).animate(animationController);
    useEffectOnce(
      () {
        if (initialState) {
          animationController.animateTo(
            1.0,
            duration: const Duration(milliseconds: 0),
          );
        }

        return null;
      },
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        const shakeCount = 1;
        const shakeOffset = 1;
        final sineValue = sin(shakeCount * 2 * pi * animationController.value);

        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: 27 * 1.5,
              height: 27 * 1.5,
              color: backgroundTween.value,
              child: IconButton(
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
                          color: iconTween.value,
                        ),
                        Transform.translate(
                          offset: Offset(
                            3 - (animationController.value * 3),
                            1 - (animationController.value * 3.5),
                          ),
                          child: SvgPicture.asset(
                            "assets/clock_bow.svg",
                            width: (8 + (animationController.value * 4)) * 1.5,
                            color: iconTween.value,
                          ),
                        ),
                        Transform.rotate(
                          angle: deg2rad(sineValue * 10),
                          child: SvgPicture.asset(
                            "assets/clock_dingle.svg",
                            width: 12 * 1.5,
                            color: iconTween.value,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
