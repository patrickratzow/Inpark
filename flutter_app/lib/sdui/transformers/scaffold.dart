import 'package:flutter/material.dart';

import '../elements/node_element.dart';
import 'transformer.dart';

class ScaffoldTransformer extends Transformer {
  @override
  bool shouldTransform(NodeElement element) => element.name == "Scaffold";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final extendBodyBehindAppBar =
        element.getAttribute("extendBodyBehindAppBar")?.value == "true";
    final appBar = getAppBar(element, context);
    final body = getBody(element, context);

    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar,
      body: body,
    );
  }

  PreferredSizeWidget? getAppBar(NodeElement element, BuildContext context) {
    final appBar = element.find("AppBar");
    if (appBar.isEmpty) return null;

    return Transformer.transformOne(appBar.first, context)
        as PreferredSizeWidget;
  }

  Widget? getBody(NodeElement element, BuildContext context) {
    final body = element.find("Body");
    if (body.isEmpty) return null;

    return Transformer.transformOne(body.first.children.first, context);
  }
}
