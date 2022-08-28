import "package:flutter/material.dart";

abstract class Action {
  bool shouldRun(String actionName);
  Future run(BuildContext context, dynamic input);
}
