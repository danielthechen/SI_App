import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/help_u_i/help_basic/help_basic_widget.dart';

// Focus widget keys for this walkthrough
final textUkfyz8mv = GlobalKey();
final iconButtonA7njcc23 = GlobalKey();
final iconButton6jkicjwh = GlobalKey();
final iconButtonCn359oew = GlobalKey();
final iconButtonOcpyi0lf = GlobalKey();
final iconButtonLmg8fiac = GlobalKey();

/// HelpHM New
///
/// A guide to help HM how to use the app
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textUkfyz8mv,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Welcome!',
              textTitle: 'Welcome to your homepage',
              mainText:
                  'This a quick walkthrough of the main functions of the SI signout app for HMs.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: iconButtonA7njcc23,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Students',
              textTitle: 'Find a list of students here.',
              mainText: 'You can ban any students from going to Gold Coast.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: iconButton6jkicjwh,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Gold Coast',
              textTitle: 'Gold Coast Portal',
              mainText:
                  'Click on the icon to see a list of students who left for Gold Coast',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: iconButtonCn359oew,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Gym',
              textTitle: 'Gym Portal',
              mainText:
                  'Click on the icon to see a list of students who went to the gym today',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: iconButtonOcpyi0lf,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Profile',
              textTitle: 'Click here to access your profile and settings.',
              mainText: 'You are able to log out here.',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: iconButtonLmg8fiac,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Contact Us',
              textTitle: 'Find our contact information here.',
              mainText:
                  'If you have any issues, or have found any bugs, please contact us here.',
            ),
          ),
        ],
      ),
    ];
