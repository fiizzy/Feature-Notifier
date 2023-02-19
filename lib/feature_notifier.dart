import 'package:feature_notifier/utils/storage.dart';
import 'package:flutter/material.dart';

class FeatureNotifier extends StatefulWidget {
  const FeatureNotifier({super.key});

  @override
  State<FeatureNotifier> createState() => _FeatureNotifierState();
}

class _FeatureNotifierState extends State<FeatureNotifier> {
  @override
  Widget build(BuildContext context) {
    print("Last save value is ${FeatureNotifierStorage.read(1)}");
    return SizedBox(
        child: Center(
      child: !FeatureNotifierStorage.read(1)
          ? Column(
              children: [
                Text("Feature Title and stuff"),
                TextButton(
                  child: Text("close feature"),
                  onPressed: () {
                    setState(() {
                      FeatureNotifierStorage.write(value: true, id: 1);
                    });
                    print("close Feature");
                  },
                )
              ],
            )
          : Container(),
    ));
  }
}
