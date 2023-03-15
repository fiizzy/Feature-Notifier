import 'package:feature_notifier/feature_notifier.dart';
import 'package:feature_notifier/src/utils/icon_selector.dart';
import 'package:flutter/material.dart';

class FeatureAlertNotifier {
  ///This method returns an alert dialog that allows you notify users of your new
  ///features.
  ///
  ///A common use case would be to call this method after your screen has completed it built, and to do this, you need to call the
  ///`WidgetsBinding.instance.addPostFrameCallback()`
  ///inside the init state of your stateful widget. Like so
  /// ```dart
  /// void initState() {
  ///    WidgetsBinding.instance.addPostFrameCallback((_) {
  ///       FeatureBottomModalSheetNotifier.notify();
  ///   }
  /// }
  /// ```
  /// To persist the open/closed state of the notifier, checkout `FeatureNotifier.isClosed()`
  /// method.
  static Future<Widget?> notify(
    BuildContext context, {
    required int featureKey,
    required void Function() onClose,
    required String description,
    required String title,
    String? buttonText,
    Color? backgroundColor,
    Color? buttonTextColor,
    double? buttonTextFontSize,
    Color? descriptionColor,
    double? descriptionFontSize,
    Widget? icon,
    void Function()? onTapButton,
    Color? strokeColor,
    double? strokeWidth,
    Color? titleColor,
    double? titleFontSize,
    bool? hasButton,
    bool? showIcon,
    Color? buttonBackgroundColor,
    Widget? image,
  }) async {
    !FeatureNotifierStorage.read(featureKey)
        ? showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: (showIcon ?? false ? 12 : 0)),
                              child: selectIcon(
                                showIcon: showIcon,
                                icon: icon,
                              ),
                            ),
                            SizedBox(
                              // width: MediaQuery.of(context).size.width *
                              //     .7,
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
                            Navigator.pop(context);
                            FeatureNotifierStorage.write(
                                value: true, id: featureKey);
                            onClose();
                            print("close Feature");
                          },
                        )
                      ]),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: descriptionFontSize ?? 16,
                            color: descriptionColor),
                      ),
                      image ?? Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: hasButton != null && hasButton != false
                            ? ElevatedButton(
                                onPressed: onTapButton,
                                style: ButtonStyle(
                                  elevation:
                                      MaterialStateProperty.all<double>(10),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color?>(
                                    buttonBackgroundColor ??
                                        const Color.fromARGB(255, 43, 93, 45),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color?>(
                                    buttonTextColor ?? Colors.white,
                                  ),
                                ),
                                child: SizedBox(
                                  // width: MediaQuery.of(context).size.width,
                                  height: 45,
                                  child: Center(
                                    child: Text(
                                      buttonText ?? "Explore Feature",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        textBaseline: TextBaseline.alphabetic,
                                        fontSize: buttonTextFontSize,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      )
                    ],
                  ));
            })
        : Container();
  }
}
