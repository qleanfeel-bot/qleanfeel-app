class PhoneValidator {
  static String? validate(String value) {
    final cleaned = value.replaceAll(RegExp(r'\D'), '');

    if (cleaned.length < 10) {
      return 'Введите корректный номер';
    }

    return null;
  }
}