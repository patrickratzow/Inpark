import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";

class PackageScreen extends StatelessWidget implements Screen {
  final String packageName;
  final List<LicenseEntry> entries;

  const PackageScreen({
    Key? key,
    required this.packageName,
    required this.entries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(title: packageName),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          final isLast = index == entries.length - 1;
          final isFirst = index == 0;

          return Column(
            children: [
              if (!isFirst)
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Divider(color: Color(0xff959595)),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16,
                  isFirst ? 16 : 8,
                  16,
                  isLast ? 16 : 0,
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final line in entry.paragraphs)
                      // Create spaces for each indent where
                      Text(paragraphText(line)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String paragraphText(LicenseParagraph paragraph) {
    final indent = paragraph.indent;
    final text = paragraph.text;
    final builder = StringBuffer();
    for (var i = 0; i < indent; i++) {
      builder.write("    ");
    }
    builder.write(text);

    return builder.toString();
  }
}
