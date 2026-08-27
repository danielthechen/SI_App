// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PrefectItemStruct extends FFFirebaseStruct {
  PrefectItemStruct({
    String? name,
    String? house,
    String? year,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _house = house,
        _year = year,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "house" field.
  String? _house;
  String get house => _house ?? '';
  set house(String? val) => _house = val;

  bool hasHouse() => _house != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;

  bool hasYear() => _year != null;

  static PrefectItemStruct fromMap(Map<String, dynamic> data) =>
      PrefectItemStruct(
        name: data['name'] as String?,
        house: data['house'] as String?,
        year: data['year'] as String?,
      );

  static PrefectItemStruct? maybeFromMap(dynamic data) => data is Map
      ? PrefectItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'house': _house,
        'year': _year,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'house': serializeParam(
          _house,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
      }.withoutNulls;

  static PrefectItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrefectItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        house: deserializeParam(
          data['house'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PrefectItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrefectItemStruct &&
        name == other.name &&
        house == other.house &&
        year == other.year;
  }

  @override
  int get hashCode => const ListEquality().hash([name, house, year]);
}

PrefectItemStruct createPrefectItemStruct({
  String? name,
  String? house,
  String? year,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PrefectItemStruct(
      name: name,
      house: house,
      year: year,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PrefectItemStruct? updatePrefectItemStruct(
  PrefectItemStruct? prefectItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    prefectItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPrefectItemStructData(
  Map<String, dynamic> firestoreData,
  PrefectItemStruct? prefectItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (prefectItem == null) {
    return;
  }
  if (prefectItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && prefectItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final prefectItemData =
      getPrefectItemFirestoreData(prefectItem, forFieldValue);
  final nestedData =
      prefectItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = prefectItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPrefectItemFirestoreData(
  PrefectItemStruct? prefectItem, [
  bool forFieldValue = false,
]) {
  if (prefectItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(prefectItem.toMap());

  // Add any Firestore field values
  mapToFirestore(prefectItem.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPrefectItemListFirestoreData(
  List<PrefectItemStruct>? prefectItems,
) =>
    prefectItems?.map((e) => getPrefectItemFirestoreData(e, true)).toList() ??
    [];
