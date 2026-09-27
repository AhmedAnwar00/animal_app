import 'package:animal_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

extension L10nContext on BuildContext {
  S get l10n => S.of(this);
}
