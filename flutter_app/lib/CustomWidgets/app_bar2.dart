import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  AppBar2(this.name);

  @override
  Size get preferredSize => getToolbarSize();

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          name,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: 'Poppins'),
        ),
      );
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Align(
              child: Text(
                name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          preferredSize: const Size(0, 0),
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
            alignment: Alignment.centerLeft,
          ),
        ),
      );
    }
  }

  Size getToolbarSize() {
    if (Platform.isAndroid) {
      return const Size.fromHeight(kToolbarHeight);
    } else {
      return const Size.fromHeight(90);
    }
  }
}
