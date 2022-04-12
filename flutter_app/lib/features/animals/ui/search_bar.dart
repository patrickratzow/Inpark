import "package:flutter/material.dart";
import "package:flutter_app/common/ui/cancel_button.dart";
import "dart:io" show Platform;

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCancel;
  final ValueChanged<String> onChanged;

  const SearchBar({
    Key? key,
    required this.onCancel,
    required this.onChanged,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(48);

  bool get isAndroid => Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
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
                    onChanged: onChanged),
              ),
            ),
            CancelButton(onPressed: onCancel),
          ],
        ),
      ),
    );
  }

  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    return preferredSize.height;
  }
}
