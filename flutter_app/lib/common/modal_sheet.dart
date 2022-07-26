import "package:flutter/material.dart";
import "package:flutter_app/common/ui/title_bar.dart";

Future showModalSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  String? title,
  Color? barrierColor,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => Wrap(
      children: [
        ..._buildTitle(title),
        builder.call(context),
      ],
    ),
    backgroundColor: const Color(0xffEAEAEA),
    barrierColor: barrierColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
  );
}

List<Widget> _buildTitle(String? title) {
  if (title == null)
    return [
      const SizedBox(height: 16),
    ];

  return [
    Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8, right: 16),
      child: TitleBar(
        name: title,
      ),
    ),
    const Divider(
      height: 4,
      color: Color.fromARGB(255, 184, 184, 184),
    ),
  ];
}
