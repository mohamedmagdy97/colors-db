import 'package:flutter/material.dart';

extension Validator on String {
  String? noValidate() {
    return null;
  }

  String? firstValidate(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? 'Please enter this field';
    }

    if (this.trim().startsWith('a')) {
      return message ?? 'Field must not start with A';
    }

    if (this.trim().length < 5 || this.trim().length > 9) {
      return message ?? 'Value should be between 5 to 9 char';
    }

    return null;
  }

  String? validateEmpty(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? 'Please enter this field';
    }
    return null;
  }
}
