// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ZooinatorNavigationBar extends HookWidget {
  final List<ZooinatorNavigationTab> tabs;

  const ZooinatorNavigationBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedIndex = useState(0);
    const selectedColor = Color(0xffDDF8DA);
    const backgroundColor = Color(0xff698665);

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: tabs.asMap().entries.map(
              (entry) {
                final idx = entry.key;
                final tab = entry.value;
                final isSelected = selectedIndex.value == idx;
                final pillColor =
                    isSelected ? backgroundColor : Colors.transparent;
                final textColor = isSelected ? selectedColor : backgroundColor;

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: pillColor,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    selectedIndex.value = idx;
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                    child: Column(
                      children: [
                        Icon(
                          tab.icon,
                          size: 16,
                          color: textColor,
                        ),
                        Text(
                          tab.text,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            height: 16 / 12,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 4),
          Container(
            color: const Color(0xffE3E5E5),
            child: const SizedBox(
              height: 1,
              width: double.infinity,
            ),
          ),
          tabs
              .asMap()
              .entries
              .firstWhere((entry) => entry.key == selectedIndex.value)
              .value,
        ],
      ),
    );
  }
}

class ZooinatorNavigationTab extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget Function(BuildContext context) builder;

  const ZooinatorNavigationTab({
    Key? key,
    required this.text,
    required this.icon,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: builder(context),
    );
  }
}
