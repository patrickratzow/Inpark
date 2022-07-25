import "package:flutter/material.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";

import "../screen.dart";

class WorkInProgressScreen extends StatelessWidget implements Screen {
  const WorkInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ScreenAppBar(
        title: "Ufærdig side",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            "Vi arbejder på at få tilføjet en skærm :)",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
