import 'package:feature_notifier/feature_notifier.dart';
import 'package:feature_notifier/src/interface/interface_notifier.dart';
import 'package:feature_notifier/src/utils/icon_selector.dart';
import 'package:flutter/material.dart';

///This widget returns a highly customizable card that allows you notify users of your new feature.
///
///When a user closes this Notifier, the closed state is persisted and is never displayed again.
///To reset the closed state, call the `FeatureNotifier.persist()` method to persist the open
///state, and refresh or update your state after persisting to display and re-insert the feature
/// notifier into the widget tree.
class FeatureCardNotifier extends StatefulWidget implements IFeatureNotifier {
  FeatureCardNotifier(
      {super.key,
      required this.featureKey,
      required this.onClose,
      required this.description,
      required this.onTapCard,
      required this.title,
      this.buttonText,
      this.backgroundColor,
      this.buttonTextColor,
      this.buttonTextFontSize,
      this.descriptionColor,
      this.descriptionFontSize,
      this.icon,
      this.onTapButton,
      this.strokeColor,
      this.strokeWidth,
      this.titleColor,
      this.titleFontSize,
      this.hasButton,
      this.showIcon,
      this.buttonBackgroundColor});

  @override
  State<FeatureCardNotifier> createState() => _FeatureCardNotifierState();

  @override
  Color? backgroundColor;

  @override
  String? buttonText;

  @override
  Color? buttonTextColor;

  @override
  double? buttonTextFontSize;

  @override
  String description;

  @override
  Color? descriptionColor;

  @override
  double? descriptionFontSize;

  @override
  Widget? icon;

  @override
  void Function() onClose;

  @override
  void Function()? onTapButton;

  @override
  void Function() onTapCard;

  @override
  Color? strokeColor;

  @override
  double? strokeWidth;

  ///This is the title of the feature that you want to show to your users
  @override
  String title;

  @override
  Color? titleColor;

  @override
  double? titleFontSize;

  @override
  Color? buttonBackgroundColor;

  @override
  bool? showIcon = true;

  ///This key is used to identify the particular feature that was built in the UI. Two features should not have the same feature key to avoid mis-behaviours
  @override
  int featureKey;

  @override
  bool? hasButton = false;
}

class _FeatureCardNotifierState extends State<FeatureCardNotifier> {
  @override
  Widget build(BuildContext context) {
    return !FeatureNotifierStorage.read(widget.featureKey)
        ? LayoutBuilder(builder: (context, constraint) {
            return GestureDetector(
              onTap: widget.onTapCard,
              child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: widget.backgroundColor ?? Colors.green[50],
                      border: Border.all(
                          width: widget.strokeWidth ?? 1,
                          color: widget.strokeColor ?? Colors.green),
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
                                      padding: EdgeInsets.only(
                                          right: (widget.showIcon ?? false
                                              ? 12
                                              : 0)),
                                      child: selectIcon(
                                        showIcon: widget.showIcon,
                                        icon: widget.icon,
                                      ),
                                    ),
                                    SizedBox(
                                      width: constraint.maxWidth * .7,
                                      child: Text(
                                        widget.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                widget.titleFontSize ?? 16,
                                            color: widget.titleColor),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    setState(() {
                                      FeatureNotifierStorage.write(
                                          value: true, id: widget.featureKey);
                                    });
                                    widget.onClose();
                                  },
                                )
                              ]),
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(
                              fontSize: widget.descriptionFontSize ?? 16,
                              color: widget.descriptionColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: widget.hasButton != null &&
                                  widget.hasButton != false
                              ? ElevatedButton(
                                  onPressed: widget.onTapButton,
                                  style: ButtonStyle(
                                    elevation:
                                        MaterialStateProperty.all<double>(10),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color?>(
                                      widget.buttonBackgroundColor ??
                                          const Color.fromARGB(255, 43, 93, 45),
                                    ),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color?>(
                                      widget.buttonTextColor ?? Colors.white,
                                    ),
                                  ),
                                  child: Text(
                                    widget.buttonText == null
                                        ? "Explore Feature"
                                        : widget.buttonText!,
                                    style: TextStyle(
                                      fontSize: widget.buttonTextFontSize,
                                    ),
                                  ),
                                )
                              : Container(),
                        )
                      ],
                    ),
                  )),
            );
          })
        : Container();
  }
}
