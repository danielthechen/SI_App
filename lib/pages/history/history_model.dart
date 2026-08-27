import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  Local state fields for this page.

  List<MeritspotsRecord> selected = [];
  void addToSelected(MeritspotsRecord item) => selected.add(item);
  void removeFromSelected(MeritspotsRecord item) => selected.remove(item);
  void removeAtIndexFromSelected(int index) => selected.removeAt(index);
  void insertAtIndexInSelected(int index, MeritspotsRecord item) =>
      selected.insert(index, item);
  void updateSelectedAtIndex(int index, Function(MeritspotsRecord) updateFn) =>
      selected[index] = updateFn(selected[index]);

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<MeritspotsRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
