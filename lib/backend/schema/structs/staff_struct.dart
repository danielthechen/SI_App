// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// list of booleans
class StaffStruct extends FFFirebaseStruct {
  StaffStruct({
    /// HM or AHM
    bool? isBoarding,
    bool? isPE,
    bool? isAdmin,
    String? house,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isBoarding = isBoarding,
        _isPE = isPE,
        _isAdmin = isAdmin,
        _house = house,
        super(firestoreUtilData);

  // "isBoarding" field.
  bool? _isBoarding;
  bool get isBoarding => _isBoarding ?? false;
  set isBoarding(bool? val) => _isBoarding = val;

  bool hasIsBoarding() => _isBoarding != null;

  // "isPE" field.
  bool? _isPE;
  bool get isPE => _isPE ?? false;
  set isPE(bool? val) => _isPE = val;

  bool hasIsPE() => _isPE != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  set isAdmin(bool? val) => _isAdmin = val;

  bool hasIsAdmin() => _isAdmin != null;

  // "House" field.
  String? _house;
  String get house => _house ?? '';
  set house(String? val) => _house = val;

  bool hasHouse() => _house != null;

  static StaffStruct fromMap(Map<String, dynamic> data) => StaffStruct(
        isBoarding: data['isBoarding'] as bool?,
        isPE: data['isPE'] as bool?,
        isAdmin: data['isAdmin'] as bool?,
        house: data['House'] as String?,
      );

  static StaffStruct? maybeFromMap(dynamic data) =>
      data is Map ? StaffStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'isBoarding': _isBoarding,
        'isPE': _isPE,
        'isAdmin': _isAdmin,
        'House': _house,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isBoarding': serializeParam(
          _isBoarding,
          ParamType.bool,
        ),
        'isPE': serializeParam(
          _isPE,
          ParamType.bool,
        ),
        'isAdmin': serializeParam(
          _isAdmin,
          ParamType.bool,
        ),
        'House': serializeParam(
          _house,
          ParamType.String,
        ),
      }.withoutNulls;

  static StaffStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaffStruct(
        isBoarding: deserializeParam(
          data['isBoarding'],
          ParamType.bool,
          false,
        ),
        isPE: deserializeParam(
          data['isPE'],
          ParamType.bool,
          false,
        ),
        isAdmin: deserializeParam(
          data['isAdmin'],
          ParamType.bool,
          false,
        ),
        house: deserializeParam(
          data['House'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StaffStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffStruct &&
        isBoarding == other.isBoarding &&
        isPE == other.isPE &&
        isAdmin == other.isAdmin &&
        house == other.house;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([isBoarding, isPE, isAdmin, house]);
}

StaffStruct createStaffStruct({
  bool? isBoarding,
  bool? isPE,
  bool? isAdmin,
  String? house,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StaffStruct(
      isBoarding: isBoarding,
      isPE: isPE,
      isAdmin: isAdmin,
      house: house,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StaffStruct? updateStaffStruct(
  StaffStruct? staff, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    staff
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStaffStructData(
  Map<String, dynamic> firestoreData,
  StaffStruct? staff,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (staff == null) {
    return;
  }
  if (staff.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && staff.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final staffData = getStaffFirestoreData(staff, forFieldValue);
  final nestedData = staffData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = staff.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStaffFirestoreData(
  StaffStruct? staff, [
  bool forFieldValue = false,
]) {
  if (staff == null) {
    return {};
  }
  final firestoreData = mapToFirestore(staff.toMap());

  // Add any Firestore field values
  mapToFirestore(staff.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStaffListFirestoreData(
  List<StaffStruct>? staffs,
) =>
    staffs?.map((e) => getStaffFirestoreData(e, true)).toList() ?? [];
