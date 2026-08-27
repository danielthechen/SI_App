import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'p_e_portal_widget.dart' show PEPortalWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class PEPortalModel extends FlutterFlowModel<PEPortalWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? helpPEController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    helpPEController?.finish();
  }
}
