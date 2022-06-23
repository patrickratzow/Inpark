import "package:xml/xml.dart";

import "../elements/attribute.dart";
import "../elements/node_element.dart";

class ParserData {
  final Map<String, String> data = {};

  void add(String key, String value) {
    data[key] = value;
  }

  bool has(String key) => data.containsKey(key);

  String? get(String key) => data[key];
}

class Parser {
  NodeElement parse(String input, String id, ParserData data) {
    input = input.trim();
    if (input.isEmpty) {
      throw ArgumentError.value(input, "input", "Input can't be empty");
    }

    final document = XmlDocument.parse(input);
    final root = _parseElement(document.rootElement, data);

    return root;
  }

  NodeElement _parseElement(XmlElement element, ParserData data) {
    final name = element.name.toString();
    final innerText = element.innerText;
    final attributes = _parseAttributes(element, data);
    final children = element.children
        .map((child) {
          if (child is XmlElement) {
            return _parseElement(child, data);
          }
        })
        .whereType<NodeElement>()
        .toList();

    final nodeElement = NodeElement(
      name,
      attributes,
      children,
      innerText,
      null,
    );
    for (final child in nodeElement.children) {
      child.parent = nodeElement;
    }

    return nodeElement;
  }

  List<Attribute> _parseAttributes(XmlElement element, ParserData data) {
    return element.attributes.map(
      (attribute) {
        final name = attribute.name.local;
        String value = attribute.value;
        final matches = RegExp("\\\${(.*?)}").allMatches(value);
        for (final match in matches) {
          final key = match.group(1).toString();
          if (data.has(key)) {
            value = value.replaceAll("\${$key}", data.get(key) ?? "UNKNOWN");
          }
        }

        return Attribute(name, value);
      },
    ).toList();
  }
}
