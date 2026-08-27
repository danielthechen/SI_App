import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/help_u_i/help_basic/help_basic_widget.dart';

// Focus widget keys for this walkthrough
final text222drn3u = GlobalKey();
final iconJpumlc06 = GlobalKey();
final icon09222qvp = GlobalKey();
final iconXwupchaw = GlobalKey();
final rowUkr5fm9z = GlobalKey();

/// helpPE
///
/// A guide to help PE staff use the app.
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: text222drn3u,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Welcome!',
              textTitle: 'Welcome to your home page!',
              mainText:
                  'This a quick walkthrough of the main functions of the gym app for PE Gym Administrators..',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: iconJpumlc06,
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

      /// Step 3
      TargetFocus(
        keyTarget: icon09222qvp,
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

      /// Step 4
      TargetFocus(
        keyTarget: iconXwupchaw,
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

      /// Step 5
      TargetFocus(
        keyTarget: rowUkr5fm9z,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Finally...',
              textTitle: 'Thank you for using our app!',
              mainText:
                  'We hope we\'ve made managing the gym process easier for you, and we look forward to serving you in the future.',
            ),
          ),
        ],
      ),
    ];
