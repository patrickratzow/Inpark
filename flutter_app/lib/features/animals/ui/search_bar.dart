import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/animals_model.dart';

import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget name;
  final List<Widget>? actions;

  const SearchBar({
    Key? key,
    required this.name,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => getToolbarSize();

  bool get isAndroid => Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () => {Navigator.of(context).pop()},
      ),
      centerTitle: true,
      title: name,
      actions: actions,
    );
  }

  Size getToolbarSize() {
    if (isAndroid) {
      return const Size.fromHeight(48);
    } else {
      double size = 100;
      if (name == null) {
        size -= 52;
      }

      return Size.fromHeight(size);
    }
  }
}
