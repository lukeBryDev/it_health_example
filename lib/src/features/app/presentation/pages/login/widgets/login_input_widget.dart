import 'package:flutter/material.dart';

class LoginInputWidget extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final Widget? suffixIcon;

  const LoginInputWidget(
      {Key? key,
      required this.name,
      this.controller,
      this.keyboardType,
      this.obscureText = false,
      this.textInputAction,
      this.autofillHints,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.black12,
          selectionHandleColor: Colors.white,
        ),
      ),
      child: TextFormField(
          autofillHints: autofillHints,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          cursorColor: Colors.blue,
          controller: controller,
          style: const TextStyle(color: Colors.black),
          keyboardType: keyboardType,
          obscureText: obscureText,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            labelText: name,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            suffixIcon: suffixIcon,
          )),
    );
  }
}
