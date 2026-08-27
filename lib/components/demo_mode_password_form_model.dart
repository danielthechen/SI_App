import '/flutter_flow/flutter_flow_util.dart';
import 'demo_mode_password_form_widget.dart' show DemoModePasswordFormWidget;
import 'package:flutter/material.dart';

class DemoModePasswordFormModel
    extends FlutterFlowModel<DemoModePasswordFormWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Passcode widget.
  FocusNode? passcodeFocusNode;
  TextEditingController? passcodeTextController;
  late bool passcodeVisibility;
  String? Function(BuildContext, String?)? passcodeTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passcodeVisibility = false;
  }

  @override
  void dispose() {
    passcodeFocusNode?.dispose();
    passcodeTextController?.dispose();
  }
}
