
import 'package:flutter/material.dart';

import 'SetLocalization.dart';

String tr(BuildContext context,String key) {
  return SetLocalization.of(context)!.getTranslateValue(key)!;
}
