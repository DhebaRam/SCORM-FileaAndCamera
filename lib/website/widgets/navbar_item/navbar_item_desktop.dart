import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datamodels/navbar_item_model.dart';

class NavBarItemTabletDesktop extends StatelessWidget {
  const NavBarItemTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarItemModel>(
      builder: (context, model, child) {
        return Text(
          model.title ?? '',
          style: const TextStyle(fontSize: 18),
        );
      },
    );
  }
}
