import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  bool _isDrawerOpen = false;
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;

  bool get isDrawerOpen => _isDrawerOpen;
  double get xOffset => _xOffset;
  double get yOffset => _yOffset;
  double get scaleFactor => _scaleFactor;

  void openDrawer() {
    _isDrawerOpen = true;
    _xOffset = 250; //MediaQuery.of(context).size.width * 0.65;
    _yOffset = 170; // MediaQuery.of(context).size.height * 0.15;
    _scaleFactor = 0.7;
    notifyListeners();
  }

  void closeDrawer() {
    _isDrawerOpen = false;
    _xOffset = 0; //MediaQuery.of(context).size.width * 0.65;
    _yOffset = 0; // MediaQuery.of(context).size.height * 0.15;
    _scaleFactor = 1;
    notifyListeners();
  }
}
