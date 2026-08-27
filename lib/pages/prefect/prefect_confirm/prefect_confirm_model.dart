import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'prefect_confirm_widget.dart' show PrefectConfirmWidget;
import 'package:flutter/material.dart';

class PrefectConfirmModel extends FlutterFlowModel<PrefectConfirmWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
