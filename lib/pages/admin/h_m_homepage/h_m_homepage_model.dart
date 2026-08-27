import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'h_m_homepage_widget.dart' show HMHomepageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HMHomepageModel extends FlutterFlowModel<HMHomepageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? helpHMNewController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    helpHMNewController?.finish();
  }
}
