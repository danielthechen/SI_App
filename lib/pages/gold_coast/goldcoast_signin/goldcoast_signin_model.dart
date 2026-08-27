import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'goldcoast_signin_widget.dart' show GoldcoastSigninWidget;
import 'package:flutter/material.dart';

class GoldcoastSigninModel extends FlutterFlowModel<GoldcoastSigninWidget> {
  ///  Local state fields for this page.

  int? currentTimeNum;

  int? qrTimeNum;

  ///  State fields for stateful widgets in this page.

  var qrTime = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  GoldcoastRecord? todayDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? hMs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
