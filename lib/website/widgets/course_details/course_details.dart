import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../styles/text_styles.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? TextAlign.left
                : TextAlign.center;

        return SizedBox(
          width: 600,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'FLUTTER WEB.\nTHE BASICS',
                  style: titleTextStyle(sizingInformation.deviceScreenType),
                  textAlign: textAlignment,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
                  style: descriptionTextStyle(sizingInformation.deviceScreenType),
                  textAlign: textAlignment,
                )
              ],
            )
          ),
        );
      },
    );
  }
}
