import "package:flutter/material.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:zooinator_content_rendering/content_renderer.dart";

class ContentDemo extends StatelessWidget {
  const ContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final input = """
<text fontSize="16">Hello World</text>
""";
    final renderer = ContentRenderer();
    final result = renderer.render(input, context);

    return Scaffold(
      appBar: ScreenAppBar(
        title: "Content Rendering Demo",
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: result,
        ),
      ),
    );
  }
}
