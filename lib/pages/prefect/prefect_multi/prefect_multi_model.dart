import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'prefect_multi_widget.dart' show PrefectMultiWidget;
import 'package:flutter/material.dart';

class PrefectMultiModel extends FlutterFlowModel<PrefectMultiWidget> {
  ///  Local state fields for this page.

  List<StudentsRecord> studentList = [];
  void addToStudentList(StudentsRecord item) => studentList.add(item);
  void removeFromStudentList(StudentsRecord item) => studentList.remove(item);
  void removeAtIndexFromStudentList(int index) => studentList.removeAt(index);
  void insertAtIndexInStudentList(int index, StudentsRecord item) =>
      studentList.insert(index, item);
  void updateStudentListAtIndex(int index, Function(StudentsRecord) updateFn) =>
      studentList[index] = updateFn(studentList[index]);

  int cartIndex = 0;

  String? year;

  String? house;

  String? name;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Year widget.
  String? yearValue;
  FormFieldController<String>? yearValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Year widget.
  List<StudentsRecord>? queryYearList;
  // State field(s) for house widget.
  String? houseValue;
  FormFieldController<String>? houseValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in house widget.
  List<StudentsRecord>? queryHouseList;
  // State field(s) for name widget.
  String? nameValue;
  FormFieldController<String>? nameValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
