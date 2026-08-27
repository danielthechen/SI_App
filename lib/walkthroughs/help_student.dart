import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/help_u_i/help_basic/help_basic_widget.dart';
import '/help_u_i/help_s_tthanks/help_s_tthanks_widget.dart';

// Focus widget keys for this walkthrough
final textTvt45s31 = GlobalKey();
final columnH26a8974 = GlobalKey();
final columnXit01on5 = GlobalKey();
final column1japhl3n = GlobalKey();
final columnElb9paao = GlobalKey();
final columnM5wnji92 = GlobalKey();
final column9jrttdrm = GlobalKey();
final column7rdu6dfk = GlobalKey();

/// helpStudent
///
/// A guide to teach new students how to use the app.
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Start
      TargetFocus(
        keyTarget: textTvt45s31,
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
                  'This is a quick walkthrough of the main functions of the SI signout app.',
            ),
          ),
        ],
      ),

      /// Gold Coast QR
      TargetFocus(
        keyTarget: columnH26a8974,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Gold Coast',
              textTitle:
                  'Click here to sign out of/into school when going to Gold Coast!',
              mainText:
                  'The scanner to sign back into school will appear once you have signed out!',
            ),
          ),
        ],
      ),

      /// Gym
      TargetFocus(
        keyTarget: columnXit01on5,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Day Gym',
              textTitle: 'Click here to sign in and out of the day gym!',
              mainText:
                  'This is only available for Y13 students who have completed the day gym induction.',
            ),
          ),
        ],
      ),

      /// Profile
      TargetFocus(
        keyTarget: column1japhl3n,
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
              mainText:
                  'You are able to log out and change your profile picture here.',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: columnElb9paao,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Merits/Spots',
              textTitle: 'Click here to give merits or spots',
              mainText: 'Only available for prefects and ambassadors!',
            ),
          ),
        ],
      ),

      /// Troubleshooting
      TargetFocus(
        keyTarget: columnM5wnji92,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Troubleshooting',
              textTitle: 'Explore common FAQs and info here.',
              mainText:
                  'This page serves as a quick guide to resolve common issues.',
            ),
          ),
        ],
      ),

      /// Contact us
      TargetFocus(
        keyTarget: column9jrttdrm,
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

      /// End
      TargetFocus(
        keyTarget: column7rdu6dfk,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpSTthanksWidget(),
          ),
        ],
      ),
    ];
