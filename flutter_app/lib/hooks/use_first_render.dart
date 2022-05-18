import "package:flutter_hooks/flutter_hooks.dart";

bool useFirstRender() {
  final renders = useRef(0);
  useEffect(() {
    renders.value++;

    return null;
  });

  return renders.value <= 1;
}
