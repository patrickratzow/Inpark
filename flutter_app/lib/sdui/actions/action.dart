import "package:flutter/material.dart";

abstract class Action {
  bool shouldRun(String actionName);
  void run(BuildContext context, dynamic input);
}
