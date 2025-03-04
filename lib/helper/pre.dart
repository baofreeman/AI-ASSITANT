import 'package:hive_flutter/hive_flutter.dart';

class Pre {
  static late Box _box;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("MyData");
  }

  static bool get showOnboarding =>
      _box.get("showOnboarding", defaultValue: true);

  static set showOnboarding(bool v) => _box.put("showOnboarding", v);
}
