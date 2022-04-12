import 'package:flutter/material.dart';
import 'package:flutter_app/common/ui/cancel_button.dart';
import 'dart:io' show Platform;

import 'package:provider/provider.dart';

import '../models/animals_model.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const SearchBar({
    Key? key,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(48);

  bool get isAndroid => Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          children: <Widget>[
            const Icon(Icons.search),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Søg her",
                    hintStyle: TextStyle(color: Color(0xff72777a)),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    context.read<AnimalsModel>().search = text;
                  },
                ),
              ),
            ),
            CancelButton(onPressed: () {
              context.read<AnimalsModel>().stopSearching();
            })
          ],
        ),
      ),
    );
  }

  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    return preferredSize.height;
  }
}
