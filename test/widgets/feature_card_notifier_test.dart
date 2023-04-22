import 'package:feature_notifier/feature_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
  });
  testWidgets("Test Feature Card Notifier Widget", (WidgetTester tester) async {
    ///Arrange widget for test
    final FeatureCardNotifier featureCardNotifier = FeatureCardNotifier(
      title: "Test Title",
      hasButton: true,
      description: 'Test Description',
      featureKey: 1,
      onClose: () {},
      onTapCard: () {},
      showIcon: true,
      onTapButton: () {},
    );

    //act on arrangement
    await tester.pumpWidget(MaterialApp(home: featureCardNotifier));

    //assert result
    expect(find.text("Test Description"), findsOneWidget);
  });
}
