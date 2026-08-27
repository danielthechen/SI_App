import '/flutter_flow/flutter_flow_util.dart';
import 'troubleshooting_widget.dart' show TroubleshootingWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class TroubleshootingModel extends FlutterFlowModel<TroubleshootingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable-foundbug widget.
  late ExpandableController expandableFoundbugExpandableController1;

  // State field(s) for Expandable-foundbug widget.
  late ExpandableController expandableFoundbugExpandableController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableFoundbugExpandableController1.dispose();
    expandableFoundbugExpandableController2.dispose();
  }
}
