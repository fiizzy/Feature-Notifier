import 'package:flutter/material.dart';

abstract class IFeatureNotifier {
  late int featureKey;
  late String title;
  late Color? titleColor;
  late Color? closeIconColor;
  late double? titleFontSize;
  late String description;
  late Color? descriptionColor;
  late double? descriptionFontSize;
  late String? buttonText;
  late Color? buttonTextColor;
  late double? buttonTextFontSize;
  late Color? buttonBackgroundColor;
  late Widget? icon;
  late bool? showIcon;
  late void Function() onClose;
  late void Function()? onTapButton;
  late Color? backgroundColor;
  late Color? strokeColor;
  late double? strokeWidth;
  late void Function() onTapCard;
  late bool? hasButton;
}
