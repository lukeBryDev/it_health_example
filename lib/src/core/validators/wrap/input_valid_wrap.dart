import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

mixin class InputValidWrap<T> {
  late T input;
  FocusNode focusNode = FocusNode();

  BehaviorSubject<String> terms = BehaviorSubject<String>();
  late Stream<String> _hotUpdate;

  Stream<String> get hotUpdate => _hotUpdate;

  void start() {
    _hotUpdate = terms
        .debounce((_) => TimerStream(true, const Duration(milliseconds: 500)))
        .switchMap((q) async* {
      yield q;
    });
  }
}
