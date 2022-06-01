import "package:flutter/material.dart";
import "package:flutter_app/common/ui/navigation_bar.dart";
import "package:zooinator_content_rendering/elements/node_element.dart";
import "package:zooinator_content_rendering/transformers/transformer.dart";

class NavbarTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) => element.name == "Navbar";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final tabs = getTabs(element, context);

    return ZooinatorNavigationBar(
      tabs: tabs,
    );
  }

  List<ZooinatorNavigationTab> getTabs(
    NodeElement nodeElement,
    BuildContext context,
  ) {
    final elements = nodeElement.find("Navtab");
    final list = <ZooinatorNavigationTab>[];

    for (final element in elements) {
      final text = element.getAttribute("text");
      final icon = element.resolveAttribute<IconData?>("icon", context, null);
      final content = element.children;
      if (text == null || icon == null || content.isEmpty) continue;

      final tab = ZooinatorNavigationTab(
        text: text.value,
        icon: icon,
        builder: (context) =>
            Transformer.transformOne(content.first, context) ??
            Text("Unable to render tab"),
      );

      list.add(tab);
    }

    return list;
  }
}
