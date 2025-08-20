import 'package:flutter/material.dart';
import 'package:task_app/services/splash_services.dart';

enum SplashState { idle, initializing, completed }

class SplashProvider extends ChangeNotifier {
  final SplashServices splashServices;
  SplashState _state = SplashState.idle;

  SplashState get state => _state;

  SplashProvider({required this.splashServices});

  Future<void> initializeApp(BuildContext context) async {
    _state = SplashState.initializing;
    notifyListeners();

    await splashServices.initializeApp(context);

    _state = SplashState.completed;
    notifyListeners();
  }
}
