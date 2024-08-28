import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:it_health_example/src/core/validators/wrap/input_valid_wrap.dart';

enum CharacterInputError {
  empty,
  noLetters,
  maxLength,
  minLength,
}

// ignore: must_be_immutable
class CharacterInput extends FormzInput<String, CharacterInputError> {
  String? _messageError;
  final int? maxLength;
  final int? minLength;
  final bool optional;

  CharacterInput.pure({this.minLength, this.maxLength, this.optional = false})
      : super.pure('');

  CharacterInput.dirty(
      {String value = '',
      this.minLength,
      this.maxLength,
      this.optional = false})
      : super.dirty(value);

  String get messageError => "\u26A0 $_messageError";

  Widget? get customMessageError => isNotValid
      ? Row(
          children: [
            const Icon(
              Icons.info,
              color: Colors.red,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                _messageError.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            )
          ],
        )
      : null;

  @override
  CharacterInputError? validator(String value) {
    if (optional) return null;
    if (value.isEmpty) {
      _messageError = 'Campo obligatorio';
      return CharacterInputError.empty;
    }
    if (minLength != null) {
      if (value.length < minLength!) {
        _messageError = "Debe contener al menos $minLength caracteres.";
        return CharacterInputError.minLength;
      }
    }
    if (maxLength != null) {
      if (value.length > maxLength!) {
        _messageError = "No debe contener mas de $maxLength caracteres.";
        return CharacterInputError.maxLength;
      }
    }
    if (!RegExp("[0-9a-zA-Z]").hasMatch(value)) {
      _messageError = "Solo se permite el ingreso de letras y números.";
      return CharacterInputError.noLetters;
    }

    _messageError = null;
    return null;
  }
}

class WrapTextFormController extends TextEditingController
    with InputValidWrap<CharacterInput> {
  int? minLength;
  int? maxLength;
  bool optional;

  WrapTextFormController(
      {this.minLength, this.maxLength, this.optional = false}) {
    input = CharacterInput.pure(
        minLength: minLength, maxLength: maxLength, optional: optional);
    addListener(_onChange);
    super.start();
  }

  void _onChange() {
    if (optional && text.isEmpty) {
      input = CharacterInput.pure(optional: optional);
    }
    input = CharacterInput.dirty(
        value: text,
        minLength: minLength,
        maxLength: maxLength,
        optional: optional);
    terms.add(text);
  }
}
