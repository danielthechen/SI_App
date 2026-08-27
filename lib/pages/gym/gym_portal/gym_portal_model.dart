import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gym_portal_widget.dart' show GymPortalWidget;
import 'package:flutter/material.dart';

class GymPortalModel extends FlutterFlowModel<GymPortalWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  List<GoldcoastRecord> empList = [];
  void addToEmpList(GoldcoastRecord item) => empList.add(item);
  void removeFromEmpList(GoldcoastRecord item) => empList.remove(item);
  void removeAtIndexFromEmpList(int index) => empList.removeAt(index);
  void insertAtIndexInEmpList(int index, GoldcoastRecord item) =>
      empList.insert(index, item);
  void updateEmpListAtIndex(int index, Function(GoldcoastRecord) updateFn) =>
      empList[index] = updateFn(empList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<GymRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
