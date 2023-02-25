import 'package:feature_notifier/feature_notifier.dart';
import 'package:feature_notifier/widgets/bottom_modal_sheet_notifier/bottom_modal_sheet_notifier.dart';
import 'package:feature_notifier/widgets/card_notifier/card_notifier.dart';
import 'package:flutter/material.dart';

void main() async {
  await featureNotifierInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feature Notifier Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Feature Notifier test"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do something
      print("Build Completed");
      FeatureBottomModalSheetNotifier.notify(
        context,
        title: "Modal sheet example",
        description: "Modal sheet is a good way to display a feature",
        onClose: () {},
        featureKey: 2,
        onTapCard: () {},
        hasButton: true,
      );
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      FeatureNotifierStorage.erase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20),
                child: CardFeatureNotifier(
                  title: "Testing this out",
                  hasButton: true,
                  // buttonText: 'Just a Button',
                  description:
                      'You can now show items without inviting friends!',
                  featureKey: 1,
                  onClose: () {},
                  onTapCard: () {},
                  showIcon: true,
                  onTapButton: () {},
                  // icon: Text("dog"),
                )),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.clear),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
