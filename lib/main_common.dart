import 'package:environments/environments.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'package:annai_store/app.dart';
import 'package:annai_store/enum/application.dart';

Future<void> mainCommon() async {
  switch (Application.environment) {
    case Environments.production:
      debugPrint = (String? message, {int? wrapWidth}) {};
    default:
  }
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
