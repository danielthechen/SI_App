import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'allstudentpage_widget.dart' show AllstudentpageWidget;
import 'package:flutter/material.dart';

class AllstudentpageModel extends FlutterFlowModel<AllstudentpageWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for StudentList widget.
  final studentListController = FlutterFlowDataTableController<UsersRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    studentListController.dispose();
  }
}
