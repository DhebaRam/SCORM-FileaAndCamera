import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datamodels/navbar_item_model.dart';

class NavBarItemMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarItemModel>(
      builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 30, top: 60),
          child: Row(
            children: <Widget>[
              Icon(model.iconData),
              SizedBox(width: 30),
              Text(
                model.title ?? '',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    );
  }
}