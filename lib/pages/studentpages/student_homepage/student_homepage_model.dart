import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'student_homepage_widget.dart' show StudentHomepageWidget;
import 'package:flutter/material.dart';

class StudentHomepageModel extends FlutterFlowModel<StudentHomepageWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? helpStudentController;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  GoldcoastRecord? todayDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  EbanRecord? massBan;
  // Stores action output result for [Backend Call - API (Google Sheet)] action in Container widget.
  ApiCallResponse? y13StudentName;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  GymRecord? gymDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    helpStudentController?.finish();
  }
}
