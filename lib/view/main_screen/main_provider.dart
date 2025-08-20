import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

import '../../const/app_strings.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      dev.log(
        AppStrings.changeNavIndexLog.replaceFirst('%s', index.toString()),
      );
      notifyListeners();
    }
  }

  void reset() {
    _currentIndex = 0;
    dev.log(AppStrings.changeNavIndexLog.replaceFirst('%s', '0'));
    notifyListeners();
  }
}
