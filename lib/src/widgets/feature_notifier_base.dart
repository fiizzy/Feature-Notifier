import 'package:feature_notifier/src/utils/storage.dart';
import 'package:get_storage/get_storage.dart';

class FeatureNotifier {
  ///Start the persisting of all feature notifiers. It is important to `await` this method or side effects will occur.
  static Future<void> init() async {
    await GetStorage.init();
  }

  ///Closes your custom Feature Notifier widget.
  ///
  ///To update the state and remove the currently displayed widget from the
  ///widget tree, you need to use the `FeatureNotifier.isClosed()` method
  ///which returns a bool, to read the value of your currently displayed or
  ///closed feature notifier, and show or hide your custom widget accordingly.
  static void close({required int featureKey}) {
    FeatureNotifierStorage.write(value: true, id: featureKey);
  }

  ///Whether a particular feature notifier (custom or not) has been closed or not.
  ///
  ///This is helpful when you want to update the state of your UI to show or hide
  /// a custom feature notifier that is opened (```isClosed() is false```)
  /// or closed (```isClosed() is true```) respectively.
  static bool isClosed({required int featureKey}) {
    return FeatureNotifierStorage.read(featureKey);
  }

  ///Keeps a particular feature notifier alive after it has been previously closed.
  ///It does this by accepting  the `featureKey` as a parameter so that the
  ///particular feature can be uniquely identified. Call this method when you want
  /// to reset the `isClosed()` value to `false`. This is useful when you want to
  /// choose to display a feature notifier after a new login, which means that this
  ///  method has to be called when the user logs out so that it can be persisted.
  static void persist({required int featureKey}) {
    FeatureNotifierStorage.erase(featureKey);
  }

  ///Keeps all feature notifiers alive after they have been previously closed.
  ///
  ///Call this method when you want to reset the `isClosed()` value to `false`
  ///for all the feature notifiers. This is useful when you want to choose to
  ///display all feature notifiers after a new login, which means that this method
  /// has to be called when the user logs out so that all values can be persisted/reset.
  ///  To persist a single feature notifier, use the `FeatureNotifier.persist()`
  ///and pass in the `featureKey` to identify the feature to be persisted.
  static void persistAll() {
    FeatureNotifierStorage.eraseAll();
  }
}
