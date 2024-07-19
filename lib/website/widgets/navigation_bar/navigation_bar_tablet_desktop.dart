import 'package:flutter/material.dart';

import '../../routing/route_names.dart';
import '../navbar_item/navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Episodes', EpisodesRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('About', AboutRoute),
            ],
          )
        ],
      ),
    );
  }
}
