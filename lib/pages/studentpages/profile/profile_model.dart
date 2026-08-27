import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  bool uploaded = false;

  String? tempselfie;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_newTempPhoto = false;
  FFUploadedFile uploadedLocalFile_newTempPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_newTempPhoto = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
