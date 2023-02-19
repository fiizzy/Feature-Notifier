import 'package:feature_notifier/utils/storage.dart';
import 'package:flutter/material.dart';

class BarDisplayNotifier extends StatefulWidget {
  const BarDisplayNotifier({super.key});

  @override
  State<BarDisplayNotifier> createState() => _BarDisplayNotifierState();
}

class _BarDisplayNotifierState extends State<BarDisplayNotifier> {
  @override
  Widget build(BuildContext context) {
    print("Last save value is ${FeatureNotifierStorage.read(1)}");
    return SizedBox(
        child: Center(
      child: !FeatureNotifierStorage.read(1)
          ? Column(
              children: [
                Text("Bar Display Type notifier"),
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
