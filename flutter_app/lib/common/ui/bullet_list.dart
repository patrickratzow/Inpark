import 'package:flutter/material.dart';

class BulletList extends StatelessWidget {
  final List<Widget> children;

  const BulletList(this.children);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children.map((child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '\u2022',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.55,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: child,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
