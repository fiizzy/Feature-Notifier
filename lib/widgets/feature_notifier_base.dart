import 'package:feature_notifier/utils/storage.dart';
import 'package:flutter/material.dart';

class FeatureNotifier {
  ///This method allows you to close your custom feature displayed widget.
  ///To update the state, called the `isClosed()` method to check whether a feature notifier has been closed previously or not
  static void close({required int featureKey}) {
    FeatureNotifierStorage.write(value: true, id: featureKey);
  }

  ///This method lets you close your class
  static bool isClosed({required int featureKey}) {
    return FeatureNotifierStorage.read(featureKey);
  }

  static void persist({required int featureKey}) {
    FeatureNotifierStorage.erase(featureKey);
  }

  static void persistAll() {
    FeatureNotifierStorage.eraseAll();
  }
}
