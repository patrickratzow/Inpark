import "package:flutter/material.dart";
import 'package:flutter_app/common/colors.dart';
import "package:flutter_app/common/ui/cancel_button.dart";
import 'package:flutter_app/common/ui/screen_app_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        color: CustomColor.green.lightest,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
          child: Row(
            children: [
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
                    onChanged: onChanged,
                  ),
                ),
              ),
              CancelButton(onPressed: onCancel),
            ],
          ),
        ),
      ),
    );
  }

  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    return preferredSize.height;
  }
}

class TestBar extends StatelessWidget {
  final VoidCallback onCancel;
  final ValueChanged<String> onChanged;

  const TestBar({Key? key, required this.onCancel, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenAppBar(
      flexibleSpace: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text("hej"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("hej"),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.mic_rounded),
        ),
        CancelButton(onPressed: onCancel)
      ],
      automaticallyImplyLeading: false,
      leading: Row(
        children: [
          Icon(Icons.search),
          // TextField(
          //   style: const TextStyle(
          //     fontSize: 4,
          //   ),
          //   decoration: const InputDecoration(
          //     hintText: "Søg her",
          //     hintStyle: TextStyle(color: Color(0xff72777a)),
          //     border: InputBorder.none,
          //   ),
          //   onChanged: onChanged,
          // )
        ],
      ),
    );
  }
}
