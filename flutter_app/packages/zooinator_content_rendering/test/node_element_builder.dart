import 'package:zooinator_content_rendering/elements/attribute.dart';
import 'package:zooinator_content_rendering/elements/node_element.dart';

class NodeElementBuilder {
  final String name;
  final List<Attribute> attributes = [];
  final List<NodeElement> children = [];
  String innerText = "";
  NodeElement? parent;

  NodeElementBuilder(this.name);

  NodeElementBuilder addAttribute(String name, String value) {
    attributes.add(Attribute(name, value));

    return this;
  }

  NodeElementBuilder addChild(NodeElement child) {
    children.add(child);

    return this;
  }

  NodeElementBuilder setInnerText(String text) {
    innerText = text;

    return this;
  }

  NodeElementBuilder setParent(NodeElement parent) {
    this.parent = parent;

    return this;
  }

  NodeElement build() {
    return NodeElement(
      name,
      attributes,
      children,
      innerText,
      parent,
    );
  }
}
