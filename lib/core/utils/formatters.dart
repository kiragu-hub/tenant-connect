class Formatters {
  Formatters._();

  static String formatName(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? 'Tenant' : trimmed;
  }
}
