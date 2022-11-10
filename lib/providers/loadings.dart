import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool _isLoaded = false;
  bool _islinearloading = false;

  get isLoaded => _isLoaded;
  get isIndicatorLoaded => _islinearloading;

  set isLoaded(value) => _isLoaded;
  set isLinearLoaded(value) => _islinearloading;

  void loadPage(bool state) {
    _isLoaded = state;
    notifyListeners();
  }

  void loadLinearProgress(bool state) {
    _islinearloading = state;
    notifyListeners();
  }
}
