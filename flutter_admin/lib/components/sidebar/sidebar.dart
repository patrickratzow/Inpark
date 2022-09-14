import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sidebar extends HookWidget {
  final List<Widget> children;

  const Sidebar({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();
    final Animation<double> animation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.decelerate,
      ),
    );
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          height: double.infinity,
          width: 96 + (154 * animation.value),
          child: Stack(
            children: [
              Container(
                color: const Color(0xffFFFBFE),
              ),
              Container(
                color: theme.primaryColorLight.withAlpha(50),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          height: 56,
                          "assets/logo.svg",
                        ),
                      ],
                    ),
                  ),
                  ...children,
                  /*
                  TextButton(
                    onPressed: () {
                      animationController.animateTo(
                        animation.value >= 0.97 ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                      );
                    },
                    child: const Text("Toggle"),
                  )
                  */
                ]),
              )
            ],
          ),
        );
      },
    );
  }
}
