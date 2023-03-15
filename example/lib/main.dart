import 'package:feature_notifier/feature_notifier.dart';
import 'package:flutter/material.dart';

void main() async {
  await FeatureNotifier.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("Build Completed");
      FeatureBottomModalSheetNotifier.notify(
        context,
        title: "Modal sheet example",
        description: "Modal sheet is a good way to display a feature",
        onClose: () {
          debugPrint("The modal sheet was closed");
        },
        featureKey: 3,
        hasButton: true,
      );
    });
  }

  void _reset() {
    setState(() {
      FeatureNotifier.persistAll();
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
                child: FeatureCardNotifier(
                  title: "Testing this out",
                  hasButton: true,
                  description:
                      'You can now show items without inviting friends!',
                  featureKey: 1,
                  onClose: () {},
                  onTapCard: () {},
                  showIcon: true,
                  onTapButton: () {},
                )),
            Padding(
                padding: const EdgeInsets.all(20),
                child: FeatureBarNotifier(
                  title:
                      "Testing this out You have pushed the button this many times:",

                  featureKey: 2,
                  onClose: () {},
                  onTapCard: () {},
                  showIcon: true,
                  // icon: Text("dog"),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,
        tooltip: 'Persist all features',
        child: const Icon(Icons.clear),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
