import 'package:shared_preferences/shared_preferences.dart';

class FeatureNotifierStorage {
  static dynamic storageInstance = SharedPreferences.getInstance();
  static bool isViewed = false;

  static write(String key) async {
    storageInstance = await SharedPreferences.getInstance();
    await storageInstance!.setBool('isViewed', true);
  }

  static read(String value) async {
    storageInstance = await SharedPreferences.getInstance();
    isViewed = storageInstance!.getBool('isViewed') ?? false;
  }
}
