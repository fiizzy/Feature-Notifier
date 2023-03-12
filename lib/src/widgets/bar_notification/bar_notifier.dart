import 'package:feature_notifier/feature_notifier.dart';
import 'package:feature_notifier/src/utils/icon_selector.dart';
import 'package:flutter/material.dart';

///This widget returns a highly customizable bar that allows you notify users of your new feature.
///
///When a user closes this Notifier, the closed state is persisted and is never displayed again.
///To reset the closed state, call the `FeatureNotifier.persist()` method to persist the open
///state, and refresh or update your state after persisting to display and re-insert the feature
/// notifier into the widget tree.

class FeatureBarNotifier extends StatefulWidget {
  FeatureBarNotifier(
      {super.key,
      required this.featureKey,
      required this.onClose,
      required this.onTapCard,
      required this.title,
      this.backgroundColor,
      this.icon,
      this.strokeColor,
      this.strokeWidth,
      this.titleColor,
      this.titleFontSize,
      this.showIcon,
      this.fontWeight});

  @override
  State<FeatureBarNotifier> createState() => _CardFeatureNotifierState();

  Color? backgroundColor;
  Widget? icon;
  void Function() onClose;
  void Function() onTapCard;
  Color? strokeColor;
  double? strokeWidth;
  FontWeight? fontWeight;

  ///This is the tile of the feature that you want to show to your users
  String title;
  Color? titleColor;
  double? titleFontSize;
  bool? showIcon = true;

  ///This key is used to identify the particular feature that was built in the UI. Two features should not have the same feature key to avoid mis-behaviours
  int featureKey;
}

class _CardFeatureNotifierState extends State<FeatureBarNotifier> {
  @override
  Widget build(BuildContext context) {
    print(
        "Last save value is ${FeatureNotifierStorage.read(widget.featureKey)}");
    return !FeatureNotifierStorage.read(widget.featureKey)
        ? LayoutBuilder(builder: (context, constraint) {
            return GestureDetector(
              onTap: widget.onTapCard,
              child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.green[50],
                      border: Border.all(
                          width: widget.strokeWidth ?? 1,
                          color: widget.strokeColor ?? Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          selectIcon(
                            showIcon: widget.showIcon,
                            icon: widget.icon,
                          ),
                          SizedBox(
                            width: constraint.maxWidth * .7,
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight:
                                      widget.fontWeight ?? FontWeight.w400,
                                  fontSize: widget.titleFontSize ?? 16,
                                  color: widget.titleColor),
                            ),
                          ),
                          GestureDetector(
                            child: const Icon(Icons.close),
                            onTap: () {
                              setState(() {
                                FeatureNotifierStorage.write(
                                    value: true, id: widget.featureKey);
                              });
                              widget.onClose();
                              print("close Feature");
                            },
                          )
                        ]),
                  )),
            );
          })
        : Container();
  }
}
