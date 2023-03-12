import 'package:get_storage/get_storage.dart';

///Start the persisting of all feature notifiers. It is import to `await` this method or side effects will occur.
Future<void> featureNotifierInit() async {
  await GetStorage.init();
}
