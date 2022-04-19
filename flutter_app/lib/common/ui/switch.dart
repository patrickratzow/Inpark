import "package:flutter/material.dart";

class StatefullSwitch extends StatefulWidget {
  @override
  _StatefullSwitch createState() => _StatefullSwitch();
}

class _StatefullSwitch extends State<StatefullSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }
}
