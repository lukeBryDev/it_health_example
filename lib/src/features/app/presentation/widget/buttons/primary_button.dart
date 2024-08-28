import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final Color? colorDisabled;
  final TextStyle? titleStyle;
  final bool loading;
  final bool disabled;
  final double radius;
  final Color loadingColor;
  final EdgeInsets? padding;

  const ButtonPrimary({
    Key? key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
    this.color,
    this.titleStyle,
    this.colorDisabled = const Color(0xFF97A0B0),
    this.loading = false,
    this.disabled = false,
    this.radius = 8,
    this.loadingColor = Colors.white,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    final colorBt = color ?? themeColors.primary;

    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: padding ?? const EdgeInsets.fromLTRB(16, 8, 16, 7),
                backgroundColor: disabled ? colorBt.withOpacity(0.3) : colorBt,
                // disabledForegroundColor: const Color(0xFF97A0B0),
                disabledBackgroundColor: colorDisabled,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius)))),
            onPressed: disabled ? () {} : onPressed,
            child: loading
                ? loadingBox()
                : Text(
                    title,
                    style: titleStyle ?? const TextStyle(color: Colors.white),
                  )));
  }

  Widget loadingBox() => SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: loadingColor,
          strokeWidth: 2.5,
        ),
      );
}
