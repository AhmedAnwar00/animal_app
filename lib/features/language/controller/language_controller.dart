import 'package:animal_app/core/storage/locale_storage.dart';
import 'package:animal_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class LanguageController extends ChangeNotifier {
  LanguageController([LocaleStorage? storage])
    : _storage = storage ?? LocaleStorage();

  final LocaleStorage _storage;

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  Future<void> load() async {
    final code = await _storage.readLanguageCode();
    await _apply(code == 'ar' ? const Locale('ar') : const Locale('en'));
  }

  Future<void> toggle() async {
    final next = _locale.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');
    await _apply(next);
  }

  Future<void> _apply(Locale locale) async {
    await S.load(locale);
    _locale = locale;
    await _storage.saveLanguageCode(locale.languageCode);
    notifyListeners();
  }
}
