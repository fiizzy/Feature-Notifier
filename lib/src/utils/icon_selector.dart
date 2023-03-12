import 'package:flutter/material.dart';

Widget selectIcon({bool? showIcon, Widget? icon}) {
  Image defaultIcon = Image.asset(
    "asset/party.png",
    height: 30,
  );

  if (showIcon == true && icon == null) {
    return defaultIcon;
  } else if (showIcon == false && icon == null) {
    return Container();
  } else if (showIcon == true && icon != null) {
    return icon;
  } else if (showIcon == null && icon == null) {
    return defaultIcon;
  } else if (showIcon == null && icon != null) {
    return defaultIcon;
  } else if (showIcon == false && icon != null) {
    return Container();
  } else {
    return defaultIcon;
  }
}
