class LanguageManager{
  static bool isTextArabic(String text) {
    for (int i = 0; i < text.length; i++) {
      final charCode = text.codeUnitAt(i);
      if (charCode >= 0x0600 && charCode <= 0x06FF) {
        return true;
      }
      if (charCode >= 0x0041 && charCode <= 0x007A) {
        return false;
      }
    }

    return false;
  }
}