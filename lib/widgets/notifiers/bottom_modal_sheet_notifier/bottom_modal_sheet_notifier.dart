import 'package:feature_notifier/interface/interface_notifier.dart';
import 'package:feature_notifier/utils/icon_selector.dart';
import 'package:feature_notifier/utils/storage.dart';
import 'package:flutter/material.dart';

class FeatureBottomModalSheetNotifier {
  static featureBottomModalSheetNotifier(BuildContext context,
      {required featureKey,
      required onClose,
      required description,
      required onTapCard,
      required title,
      buttonText,
      backgroundColor,
      buttonTextColor,
      buttonTextFontSize,
      descriptionColor,
      descriptionFontSize,
      icon,
      onTapButton,
      strokeColor,
      strokeWidth,
      titleColor,
      titleFontSize,
      hasButton,
      showIcon,
      buttonBackgroundColor}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return !FeatureNotifierStorage.read(featureKey)
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right:
                                                  (showIcon ?? false ? 12 : 0)),
                                          child: selectIcon(
                                            showIcon: showIcon,
                                            icon: icon,
                                          ),
                                        ),
                                        SizedBox(
                                          width: constraint.maxWidth * .7,
                                          child: Text(
                                            title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: titleFontSize ?? 16,
                                                color: titleColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      child: Icon(Icons.close),
                                      onTap: () {
                                        FeatureNotifierStorage.write(
                                            value: true, id: featureKey);
                                        onClose();
                                        print("close Feature");
                                      },
                                    )
                                  ]),
                            ),
                            Text(
                              description,
                              style: TextStyle(
                                  fontSize: descriptionFontSize ?? 16,
                                  color: descriptionColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: hasButton != null && hasButton != false
                                  ? ElevatedButton(
                                      onPressed: onTapButton,
                                      style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                10),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color?>(
                                          buttonBackgroundColor ??
                                              const Color.fromARGB(
                                                  255, 43, 93, 45),
                                        ),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color?>(
                                          buttonTextColor ?? Colors.white,
                                        ),
                                      ),
                                      child: Text(
                                        buttonText == null
                                            ? "Explore Feature"
                                            : buttonText!,
                                        style: TextStyle(
                                          fontSize: buttonTextFontSize,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            )
                          ],
                        ),
                      ));
                })
              : Container();
        });
  }
}
