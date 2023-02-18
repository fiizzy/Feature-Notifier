import 'package:feature_notifier/utils/storage.dart';
import 'package:flutter/material.dart';

class FeatureNotifier extends StatefulWidget {
  const FeatureNotifier({super.key});

  @override
  State<FeatureNotifier> createState() => _FeatureNotifierState();
}

class _FeatureNotifierState extends State<FeatureNotifier> {
  @override
  void initState() {
    super.initState();
    FeatureNotifierStorage.write(true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
      child: !FeatureNotifierStorage.read("isViewed")
          ? Column(
              children: [
                Text("Feature Title and stuff"),
                TextButton(
                  child: Text("close feature"),
                  onPressed: () {
                    print("close Feature");
                  },
                )
              ],
            )
          : Container(),
    ));
  }
}
