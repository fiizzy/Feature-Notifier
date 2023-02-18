import 'package:flutter/material.dart';

class FeatureNotifier extends StatefulWidget {
  const FeatureNotifier({super.key});

  @override
  State<FeatureNotifier> createState() => _FeatureNotifierState();
}

class _FeatureNotifierState extends State<FeatureNotifier> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        child: Center(
      child: Text("click to see new available feature!"),
    ));
  }
}
