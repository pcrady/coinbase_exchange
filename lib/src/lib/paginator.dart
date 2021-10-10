class Paginator<T, U> {
  U? before;
  U? after;
  List<T> elements;

  Paginator({
    this.before,
    this.after,
    required this.elements,
  });
}