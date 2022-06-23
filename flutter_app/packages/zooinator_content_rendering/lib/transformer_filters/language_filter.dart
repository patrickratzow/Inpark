import 'package:zooinator_content_rendering/transformer_filters/transformer_filter.dart';

import '../elements/node_element.dart';

class LanguageFilter extends TransformerFilter {
  @override
  bool shouldRun(NodeElement element) {
    final language = element.getAttribute("lang");
    if (language == null) return false;
    final parent = element.parent;
    if (parent == null) return false;
    final childrenWithLanguageCount = parent.children
        .where((child) => child.getAttribute("lang") != null)
        .length;
    if (childrenWithLanguageCount <= 1) return false;

    return true;
  }

  @override
  bool shouldInclude(NodeElement element) {
    final currentLanguage = getCurrentLanguage();
    final ancestor = element.parent!;
    final targets =
        ancestor.children.where((child) => child.getAttribute("lang") != null);
    if (targets.length == 1) return true;

    return element.getAttribute("lang")?.value == currentLanguage;
  }

  String getCurrentLanguage() => "da";
}
