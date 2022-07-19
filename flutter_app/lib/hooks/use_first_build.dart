import "package:flutter_hooks/flutter_hooks.dart";

bool useFirstBuild() {
  final builds = useRef(0);
  useEffect(() {
    builds.value++;

    return null;
  });

  return builds.value <= 1;
}
