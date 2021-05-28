import 'package:get/get.dart';
import 'package:autoservice/generated/locale/ar.dart';
import 'package:autoservice/generated/locale/en.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
