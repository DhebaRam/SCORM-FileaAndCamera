import 'package:flutter/material.dart';

import '../../routing/route_names.dart';
import '../navbar_item/navbar_item.dart';
import 'navigation_drawer_header.dart';

class NavigationDrawer2 extends StatelessWidget {
  const NavigationDrawer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NavigationDrawerHeader(),
            // BONUS: Combine the UI for this widget with the NavBarItem and make it responsive.
            // The UI for the current DrawerItem shows when it's in mobile, else it shows the NavBarItem ui.
            NavBarItem(
              'Episodes',
              EpisodesRoute,
              icon: Icons.videocam,
            ),
            NavBarItem(
              'About',
              AboutRoute,
              icon: Icons.help,
            ),
          ],
        )
      ),
    );
  }
}
