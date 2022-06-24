import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_use/flutter_use.dart";

import "../sdui/content_renderer.dart";
import "../sdui/parser/parser.dart";

RenderResult useRenderer<T extends HasContent>(T model) {
  final context = useContext();
  final state = useRef(ConnectionState.waiting);
  final obj = useMemoized(() => model);
  final renderedContent = useState<Widget?>(null);

  useEffectOnce(() {
    state.value = ConnectionState.active;
    obj.content.then(
      (value) {
        state.value = ConnectionState.done;
        final renderer = ContentRenderer();
        final data = ParserData();
        final result = renderer.render(value, context, data);

        renderedContent.value = result;
      },
    ).catchError(
      (error) {
        state.value = ConnectionState.done;
        renderedContent.value = Text(error.toString());
      },
    );

    return null;
  });

  return RenderResult(
    state: state.value,
    widget: renderedContent.value,
  );
}

@immutable
class RenderResult {
  final ConnectionState state;
  final Widget? widget;

  RenderResult({
    required this.state,
    this.widget,
  });
}

abstract class HasContent {
  Future<String> get content;
}
