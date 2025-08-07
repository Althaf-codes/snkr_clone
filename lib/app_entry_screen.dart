import 'package:flutter/material.dart';

import 'package:snkr_app/screens/drawer_screen.dart';
import 'package:snkr_app/screens/main_screen.dart';

class AppEntryScreen extends StatelessWidget {
  Widget child;
  AppEntryScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainScreen(
            child: child,
          )
        ],
      ),
    );
  }
}
