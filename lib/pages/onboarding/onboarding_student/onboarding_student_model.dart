import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'onboarding_student_widget.dart' show OnboardingStudentWidget;
import 'package:flutter/material.dart';

class OnboardingStudentModel extends FlutterFlowModel<OnboardingStudentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  bool isDataUploading_tempSelfie = false;
  FFUploadedFile uploadedLocalFile_tempSelfie =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_tempSelfie = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
