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
    return !FeatureNotifierStorage.read(1)
        ? LayoutBuilder(builder: (context, constraint) {
            return Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    border: Border.all(width: 1, color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Image.asset(
                                      "asset/party.png",
                                      height: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: constraint.maxWidth * .7,
                                    child: Text(
                                      "We have a new feature!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  setState(() {
                                    FeatureNotifierStorage.write(
                                        value: true, id: 1);
                                  });
                                  print("close Feature");
                                },
                              )
                            ]),
                      ),
                      Text(
                          "Checkout the new feature that we just released and make.",
                          style: TextStyle(fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ElevatedButton(
                          child: Text("Explore Feature"),
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(10),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 43, 93, 45))),
                        ),
                      )
                    ],
                  ),
                ));
          })
        : Container();
  }
}
