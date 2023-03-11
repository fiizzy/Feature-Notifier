import 'package:feature_notifier/feature_notifier.dart';
import 'package:feature_notifier/utils/storage.dart';
import 'package:flutter/material.dart';

class FeatureNotifier {
  ///This method allows you to close your custom Feature Notifier widget. To update the state and remove the currently displayed widget from the widget tree, you need to use the `FeatureNotifier.isClosed()` method which returns a bool, to read the value of your currently displayed or closed feature notifier, and show or hide your custom widget accordingly.
  static void close({required int featureKey}) {
    FeatureNotifierStorage.write(value: true, id: featureKey);
  }

  ///This method returns a bool which allows you check whether a particular feature notifier (custom or not) has been closed or not. This is helpful when you want to update the state of your UI to show or hide a custom feature notifier that is opened (```isClosed() is false```) or closed (```isClosed() is true```) respectively.
  static bool isClosed({required int featureKey}) {
    return FeatureNotifierStorage.read(featureKey);
  }

  ///This method allows you to keep a particular feature notifier alive after it has been previously closed by passing in the `featureKey`. Call this method when you want to reset the `isClosed()` value to false. This is useful when you want to choose to display a feature notifier after a new login, which means that this method has to be called when the user logs out so that it can be persisted.
  static void persist({required int featureKey}) {
    FeatureNotifierStorage.erase(featureKey);
  }

  ///This method allows you to keep all feature notifiers alive after it has been previously closed. Call this method when you want to reset the `isClosed()` value to false. This is useful when you want to choose to display a feature notifier after a new login, which means that this method has to be called when the user logs out so that it can be persisted. To persist a single feature notifier, use the `FeatureNotifier.persist()` and pass in the `featureKey` to identify the feature to be persisted.
  static void persistAll() {
    FeatureNotifierStorage.eraseAll();
  }
}
