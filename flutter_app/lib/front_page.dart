import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Stack(),
          Image.asset(
            "assets/front_page_illustration.svg",
          ),
        ],
      ),
    );
  }
}
