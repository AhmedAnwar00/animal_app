import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorage {
  static const _languageCodeKey = 'language_code';

  Future<String?> readLanguageCode() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_languageCodeKey);
  }

  Future<void> saveLanguageCode(String languageCode) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_languageCodeKey, languageCode);
  }
}
