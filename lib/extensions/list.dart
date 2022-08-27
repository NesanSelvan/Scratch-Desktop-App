extension Typing<T> on List<T> {
  /// Provide access to the generic type at runtime.
  Type get genericType => T;
}
