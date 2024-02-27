extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeEach() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}
