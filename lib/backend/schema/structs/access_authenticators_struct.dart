// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AccessAuthenticatorsStruct extends FFFirebaseStruct {
  AccessAuthenticatorsStruct({
    /// initial terms and conditions
    bool? signedAppToCs,
    bool? signedGCPolicy,
    bool? signedPrefectPolicy,
    bool? gymInducted,
    DateTime? banUntil,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _signedAppToCs = signedAppToCs,
        _signedGCPolicy = signedGCPolicy,
        _signedPrefectPolicy = signedPrefectPolicy,
        _gymInducted = gymInducted,
        _banUntil = banUntil,
        super(firestoreUtilData);

  // "signedAppToCs" field.
  bool? _signedAppToCs;
  bool get signedAppToCs => _signedAppToCs ?? false;
  set signedAppToCs(bool? val) => _signedAppToCs = val;

  bool hasSignedAppToCs() => _signedAppToCs != null;

  // "signedGCPolicy" field.
  bool? _signedGCPolicy;
  bool get signedGCPolicy => _signedGCPolicy ?? false;
  set signedGCPolicy(bool? val) => _signedGCPolicy = val;

  bool hasSignedGCPolicy() => _signedGCPolicy != null;

  // "signedPrefectPolicy" field.
  bool? _signedPrefectPolicy;
  bool get signedPrefectPolicy => _signedPrefectPolicy ?? false;
  set signedPrefectPolicy(bool? val) => _signedPrefectPolicy = val;

  bool hasSignedPrefectPolicy() => _signedPrefectPolicy != null;

  // "gymInducted" field.
  bool? _gymInducted;
  bool get gymInducted => _gymInducted ?? false;
  set gymInducted(bool? val) => _gymInducted = val;

  bool hasGymInducted() => _gymInducted != null;

  // "banUntil" field.
  DateTime? _banUntil;
  DateTime get banUntil => _banUntil ?? DateTime.fromMicrosecondsSinceEpoch(0);
  set banUntil(DateTime? val) => _banUntil = val;

  bool hasBanUntil() => _banUntil != null;

  static AccessAuthenticatorsStruct fromMap(Map<String, dynamic> data) =>
      AccessAuthenticatorsStruct(
        signedAppToCs: data['signedAppToCs'] as bool?,
        signedGCPolicy: data['signedGCPolicy'] as bool?,
        signedPrefectPolicy: data['signedPrefectPolicy'] as bool?,
        gymInducted: data['gymInducted'] as bool?,
        banUntil: data['banUntil'] as DateTime?,
      );

  static AccessAuthenticatorsStruct? maybeFromMap(dynamic data) => data is Map
      ? AccessAuthenticatorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'signedAppToCs': _signedAppToCs,
        'signedGCPolicy': _signedGCPolicy,
        'signedPrefectPolicy': _signedPrefectPolicy,
        'gymInducted': _gymInducted,
        'banUntil': _banUntil,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'signedAppToCs': serializeParam(
          _signedAppToCs,
          ParamType.bool,
        ),
        'signedGCPolicy': serializeParam(
          _signedGCPolicy,
          ParamType.bool,
        ),
        'signedPrefectPolicy': serializeParam(
          _signedPrefectPolicy,
          ParamType.bool,
        ),
        'gymInducted': serializeParam(
          _gymInducted,
          ParamType.bool,
        ),
        'banUntil': serializeParam(
          _banUntil,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AccessAuthenticatorsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AccessAuthenticatorsStruct(
        signedAppToCs: deserializeParam(
          data['signedAppToCs'],
          ParamType.bool,
          false,
        ),
        signedGCPolicy: deserializeParam(
          data['signedGCPolicy'],
          ParamType.bool,
          false,
        ),
        signedPrefectPolicy: deserializeParam(
          data['signedPrefectPolicy'],
          ParamType.bool,
          false,
        ),
        gymInducted: deserializeParam(
          data['gymInducted'],
          ParamType.bool,
          false,
        ),
        banUntil: deserializeParam(
          data['banUntil'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AccessAuthenticatorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AccessAuthenticatorsStruct &&
        signedAppToCs == other.signedAppToCs &&
        signedGCPolicy == other.signedGCPolicy &&
        signedPrefectPolicy == other.signedPrefectPolicy &&
        gymInducted == other.gymInducted &&
        banUntil == other.banUntil;
  }

  @override
  int get hashCode => const ListEquality().hash([
        signedAppToCs,
        signedGCPolicy,
        signedPrefectPolicy,
        gymInducted,
        banUntil
      ]);
}

AccessAuthenticatorsStruct createAccessAuthenticatorsStruct({
  bool? signedAppToCs,
  bool? signedGCPolicy,
  bool? signedPrefectPolicy,
  bool? gymInducted,
  DateTime? banUntil,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AccessAuthenticatorsStruct(
      signedAppToCs: signedAppToCs,
      signedGCPolicy: signedGCPolicy,
      signedPrefectPolicy: signedPrefectPolicy,
      gymInducted: gymInducted,
      banUntil: banUntil,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AccessAuthenticatorsStruct? updateAccessAuthenticatorsStruct(
  AccessAuthenticatorsStruct? accessAuthenticators, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    accessAuthenticators
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAccessAuthenticatorsStructData(
  Map<String, dynamic> firestoreData,
  AccessAuthenticatorsStruct? accessAuthenticators,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (accessAuthenticators == null) {
    return;
  }
  if (accessAuthenticators.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && accessAuthenticators.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final accessAuthenticatorsData =
      getAccessAuthenticatorsFirestoreData(accessAuthenticators, forFieldValue);
  final nestedData =
      accessAuthenticatorsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      accessAuthenticators.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAccessAuthenticatorsFirestoreData(
  AccessAuthenticatorsStruct? accessAuthenticators, [
  bool forFieldValue = false,
]) {
  if (accessAuthenticators == null) {
    return {};
  }
  final firestoreData = mapToFirestore(accessAuthenticators.toMap());

  // Add any Firestore field values
  mapToFirestore(accessAuthenticators.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAccessAuthenticatorsListFirestoreData(
  List<AccessAuthenticatorsStruct>? accessAuthenticatorss,
) =>
    accessAuthenticatorss
        ?.map((e) => getAccessAuthenticatorsFirestoreData(e, true))
        .toList() ??
    [];
