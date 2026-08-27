import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/help_u_i/help_basic/help_basic_widget.dart';

// Focus widget keys for this walkthrough
final rowAute6sjx = GlobalKey();
final columnJp8p2fux = GlobalKey();
final columnGffraz73 = GlobalKey();
final columnJcml2sc8 = GlobalKey();
final buttonMxoegers = GlobalKey();
final buttonEmsny2vc = GlobalKey();
final buttonO5bk35iw = GlobalKey();

/// prefectGuide
///
/// Guide for prefects to add merits/spots
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: rowAute6sjx,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Type',
              textTitle: 'Merit/Spot',
              mainText: 'Select whether to give a merit/spot',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: columnJp8p2fux,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Year',
              textTitle: 'Choose Year Group',
              mainText: 'Ask the student for their year group',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: columnGffraz73,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'House',
              textTitle: 'Choose House',
              mainText: 'Ask the student for their house',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: columnJcml2sc8,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Name',
              textTitle: 'Select their name',
              mainText:
                  'Ask the stuent for their name. This can only be done after filling in year and house!',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: buttonMxoegers,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Confirm',
              textTitle: 'Submit the merit/spot',
              mainText:
                  'Your merit/spot will be processed soon after submission!',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: buttonEmsny2vc,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'Add student',
              textTitle: 'For multiple students',
              mainText:
                  'If you wish to give the same merit/spot to multiple students, add another student and repeat!',
            ),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: buttonO5bk35iw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HelpBasicWidget(
              cardName: 'History',
              textTitle: 'View your previous submissions',
              mainText:
                  'You will have a 15 minute window to delete your submissions here, otherwise they will be processed but still viewable!',
            ),
          ),
        ],
      ),
    ];
