import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';

class StatefullSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isToggled = useState(false);

    return Switch.adaptive(
      value: isToggled.value,
      onChanged: (value) {
        isToggled.value = !isToggled.value;
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }
}
