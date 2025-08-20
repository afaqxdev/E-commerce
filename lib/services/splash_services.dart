// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:task_app/routing/routing_name.dart';

class SplashServices {
  initializeApp(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.mainScreen,
      (route) => false,
    );
  }
}
