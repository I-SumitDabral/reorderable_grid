extension StringExtensions on String {
  String get intelliTrimOfTitle {
    return length > 15 ? '${substring(length - 8, length)}...' : this;
  }
}
