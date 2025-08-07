import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index, BuildContext context) {
    _currentIndex = index;
    notifyListeners();

    // Define your routes in the same order as the BottomNavigationBar items
    final List<String> routes = [
      '/home',
      '/shop',
      '/calendar',
      '/cart',
      '/profile',
    ];
    context.go(routes[index]); // Update the navigation
  }
}
