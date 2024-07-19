import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navigation_bar_mobile.dart';
import 'navigation_bar_tablet_desktop.dart';

class NavigationBar1 extends StatelessWidget {
  const NavigationBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context)=> const NavigationBarMobile(),
      tablet:  (context)=> const NavigationBarTabletDesktop(),
    );
  }
}
