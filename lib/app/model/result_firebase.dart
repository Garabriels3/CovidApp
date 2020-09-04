class Result<T> {
  final T item;

  bool get success => item != null;

  final String errorMessage;

  Result({this.item, this.errorMessage});
}

class VoidResult {
  bool get success => errorMessage == null;

  final String errorMessage;

  VoidResult({this.errorMessage});
}
