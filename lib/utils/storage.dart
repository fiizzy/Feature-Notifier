import 'package:get_storage/get_storage.dart';

class FeatureNotifierStorage {
  static GetStorage storage = GetStorage();
  static bool isViewed = storage.read("isViewed") ?? false;

  static write(bool? value) {
    final storage = GetStorage();
    storage.write("isViewed", true);
    isViewed = storage.read("isViewed");
    print("the value being written is $isViewed");
  }

  static read(String key) {
    final storage = GetStorage();
    isViewed = storage.read("isViewed");
    print("the value being read is $isViewed");
  }
}
