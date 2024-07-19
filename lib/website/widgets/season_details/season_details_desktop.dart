import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../datamodels/season_details_model.dart';
import '../../styles/text_styles.dart';

class SeasonDetailsDesktop extends StatelessWidget {
  const SeasonDetailsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SeasonDetailsModel>(
      builder: (context, details, child) {
        return ResponsiveBuilder(
          builder: (context, sizingInformation) => Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                details.title ?? '',
                style: titleTextStyle(sizingInformation.deviceScreenType),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: Text(
                  details.description ?? '',
                  style: descriptionTextStyle(sizingInformation.deviceScreenType),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

