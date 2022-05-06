import "package:flutter/material.dart";

import '../../../common/ui/title_bar.dart';
import "navigation_link.dart";

class NavigationLinkList extends StatelessWidget {
  const NavigationLinkList({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    var links = children
        .map(
          (child) => [
            child,
            const SizedBox(width: 16),
          ],
        )
        .expand((element) => element)
        .toList()
      ..removeLast();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: TitleBar(
            fontSize: 16,
            name: "Sider",
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: Row(children: links),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
