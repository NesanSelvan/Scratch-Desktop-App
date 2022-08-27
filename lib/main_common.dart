import 'package:environments/environments.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'enum/application.dart';

void mainCommon() {
  switch (Application.environment) {
    case Environments.production:
      debugPrint = (String? message, {int? wrapWidth}) {};
      break;
    default:
  }

  runApp(MyApp());
}
