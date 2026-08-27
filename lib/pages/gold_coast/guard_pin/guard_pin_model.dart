import '/flutter_flow/flutter_flow_util.dart';
import 'guard_pin_widget.dart' show GuardPinWidget;
import 'package:flutter/material.dart';

class GuardPinModel extends FlutterFlowModel<GuardPinWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
