import "package:flutter/src/widgets/framework.dart";
import "package:flutter_app/sdui/transformers/transformer.dart";

import "../elements/node_element.dart";
import "../parser/parser.dart";

class ComponentTransformer extends Transformer {
  static Map<String, NodeElement> components = {};

  static void registerComponent(String name, String component) {
    final parser = Parser();
    final element = parser.parse(component, "component", ParserData());

    components[name] = element;
  }

  static void registerComponentNode(String name, NodeElement component) {
    components[name] = component;
  }

  @override
  bool shouldTransform(NodeElement element) =>
      components.containsKey(element.name);

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final component = components[element.name];

    return Transformer.transformOne(component!, context)!;
  }
}
