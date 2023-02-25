import 'package:feature_notifier/interface/interface_notifier.dart';
import 'package:feature_notifier/utils/icon_selector.dart';
import 'package:feature_notifier/utils/storage.dart';
import 'package:flutter/material.dart';

class CardFeatureNotifier extends StatefulWidget implements IFeatureNotifier {
  CardFeatureNotifier(
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
  State<CardFeatureNotifier> createState() => _CardFeatureNotifierState();

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

  ///This is the tile of the feature that you want to show to your users
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

class _CardFeatureNotifierState extends State<CardFeatureNotifier> {
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
                                          value: true, id: 1);
                                    });
                                    widget.onClose();
                                    print("close Feature");
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
