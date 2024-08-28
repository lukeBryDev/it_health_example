import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_health_example/src/core/error/failures.dart';

class Show {
  static void eitherError(Failure l) {
    var message = l.message;
    if (l is ServerFailure && l.data!.containsKey("data")) {
      try {
        message = message! +
            l.data!['data'].values
                .toString()
                .replaceAll("[", ",")
                .replaceAll("]", "")
                .replaceAll("(", "")
                .replaceAll(")", "");
      } catch (_) {
        log("$_", name: "Error: eitherError");
      }
    }
    return snackbarError("¡Ups, algo va mal!", message ?? "");
  }

  static void snackbarError(
    String? title,
    String? subTitle, {
    String? svgIcon,
    String? svgRight,
    SnackPosition? snackPosition,
    Duration? duration,
    Duration? delay,
    void Function()? onTap,
    void Function(dynamic data)? onTapWithData,
    dynamic data,
    double? borderRadius,
    Color? borderColor,
    TextStyle? titleStyle,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Widget? widgetSubtitle,
  }) {
    Future.delayed(delay ?? const Duration(seconds: 0), () {
      Get.snackbar("", "",
          duration: duration ?? const Duration(seconds: 3),
          snackPosition: snackPosition ?? SnackPosition.TOP,
          titleText: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.crisis_alert,
                color: Colors.orange,
                size: 20,
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Text(title ?? "",
                    style: titleStyle ??
                        const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        )),
              ),
              const SizedBox(
                width: 110,
              ),
              IconButton(
                onPressed: () => Get.closeCurrentSnackbar(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          messageText: (subTitle != null && subTitle != "")
              ? Row(
                  children: [
                    Flexible(
                        child: Text(
                      subTitle,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                )
              : widgetSubtitle,
          backgroundColor: Colors.black,
          borderColor: borderColor ?? Colors.grey,
          borderRadius: borderRadius ?? 14,
          margin: margin ?? const EdgeInsets.symmetric(horizontal: 10),
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          borderWidth: 1, onTap: (GetSnackBar _) {
        if (onTap != null) {
          onTap.call();
        } else if (onTapWithData != null) {
          onTapWithData.call(data);
        }
      });
    });
  }
}
