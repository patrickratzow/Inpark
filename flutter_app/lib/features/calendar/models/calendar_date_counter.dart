class CalendarDateCounter {
  int previous;
  int current;
  int next;

  CalendarDateCounter({
    this.previous = 0,
    this.current = 0,
    this.next = 0,
  });

  int increment(bool isActive) {
    if (isActive) {
      return ++current;
    } else if (current == 0) {
      return ++previous;
    }

    return ++next;
  }
}