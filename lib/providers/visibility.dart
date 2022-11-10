import 'package:flutter/cupertino.dart';

class VisibilityProvider with ChangeNotifier {
  //password fields
  bool _isEnabled = false;
  bool _isVisible = true;

  bool get isEnabled => _isEnabled;
  set isEnabled(bool value) {
    this._isEnabled = value;
    notifyListeners();
  }

  bool get isVisible => _isVisible;
  void changeVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

//for - myaccounts.dart - settings page
  //boolean variables to show and hide edit options
  bool _isEmailVisible = false;
  bool _isMobileVisible = false;
  bool _isAddressVisible = false;
  bool _isGenderVisible = false;
  bool _isEmailPrivate = false;

  get isEmailVisible => _isEmailVisible;
  get isMobileVisible => _isMobileVisible;
  get isAddressVisible => _isAddressVisible;
  get isGenderVisible => _isGenderVisible;
  get isEmailPrivate => _isEmailPrivate;

  void setEmailVisibility(bool value) {
    _isEmailVisible = value;
    notifyListeners();
  }

  void setMobileVisiblity(bool value) {
    _isMobileVisible = value;
    notifyListeners();
  }

  void setAddressVisiblity(bool value) {
    _isAddressVisible = value;
    notifyListeners();
  }

  void setGenderVisibility(bool value) {
    _isGenderVisible = value;
    notifyListeners();
  }

  void setEmailPrivacy(bool value) {
    _isEmailPrivate = value;
    notifyListeners();
  }
}
