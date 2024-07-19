import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../datamodels/season_details_model.dart';
import '../../styles/text_styles.dart';

class SeasonDetailsMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SeasonDetailsModel>(
      builder: (context, details, child) {
        return ResponsiveBuilder(
          builder: (context, sizingInformation) => Column(
            children: <Widget>[
              Text(
                details.title ?? '',
                style: titleTextStyle(sizingInformation.deviceScreenType),
              ),
              const SizedBox(height: 50),
              Text(
                details.description ?? '',
                style: descriptionTextStyle(sizingInformation.deviceScreenType),
              ),
            ],
          ),
        );
      },
    );
  }
}
