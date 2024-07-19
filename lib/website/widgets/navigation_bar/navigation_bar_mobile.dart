import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../services/navigation_service.dart';
import 'navbar_logo.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              locator<NavigationService>().scaffoldKey.currentState?.openDrawer();
            },
          ),
          const NavBarLogo()
        ],
      ),
    );
  }
}
