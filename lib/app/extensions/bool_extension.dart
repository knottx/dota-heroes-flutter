extension ListBoolExtension on List<bool> {
  bool get atLeastOneTrue {
    return any((e) => (e == true));
  }
}
