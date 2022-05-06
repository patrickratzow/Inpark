import "dart:math" as math;

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));

  E maxBy<K extends Comparable<K>>(K Function(E) keyFunction) => reduce(
        (E a, E b) => keyFunction(a).compareTo(keyFunction(b)) > 1 ? a : b,
      );
}

extension ListExtensions<E> on List<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int index, bool isLast) toElement) {
    return asMap().entries.map(
        (entry) => toElement(entry.value, entry.key, entry.key == length - 1));
  }
}

extension IntIterables on Iterable<int> {
  int get max => reduce(math.max);
  int get min => reduce(math.min);
}
