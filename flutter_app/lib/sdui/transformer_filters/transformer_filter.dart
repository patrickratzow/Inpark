import "../elements/node_element.dart";
import "language_filter.dart";

abstract class TransformerFilter {
  static Set<TransformerFilter> filters = {
    LanguageFilter(),
  };

  // If filter should run on this element
  bool shouldRun(NodeElement element);
  // If the element should be transformed
  bool shouldInclude(NodeElement element);

  static bool filter(NodeElement element) {
    var filters = TransformerFilter.filters.where(
      (filter) => filter.shouldRun(element),
    );
    if (filters.isEmpty) return true;

    return filters.every((filter) => filter.shouldInclude(element));
  }
}
