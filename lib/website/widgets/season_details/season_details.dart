import 'package:flutter/material.dart';
import 'package:nfc_demo/website/widgets/season_details/season_details_desktop.dart';
import 'package:nfc_demo/website/widgets/season_details/season_details_mobile.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../datamodels/season_details_model.dart';

class SeasonDetails extends StatelessWidget {
  final SeasonDetailsModel? details;
  const SeasonDetails({Key? key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<SeasonDetailsModel?>.value(
      value: details,
      child: ScreenTypeLayout(
        desktop: SeasonDetailsDesktop(),
        mobile: SeasonDetailsMobile(),
      ),
    );
  }
}
