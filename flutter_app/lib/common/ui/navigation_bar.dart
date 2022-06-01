import "package:collection_ext/iterables.dart";
import "package:flutter/material.dart";
import "../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class ZooinatorNavigationBar extends HookWidget {
  final List<ZooinatorNavigationTab> tabs;

  const ZooinatorNavigationBar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    final theme = useTheme();
    const selectedColor = Color(0xffDDF8DA);
    const backgroundColor = Color(0xff698665);

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: tabs.mapIndexed(
              (idx, tab) {
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
                          style: theme.textTheme.bodyMedium?.copyWith(
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
    super.key,
    required this.text,
    required this.icon,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
