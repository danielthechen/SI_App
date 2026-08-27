// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// student data
class StudentStruct extends FFFirebaseStruct {
  StudentStruct({
    /// Surname + Forename
    String? name,
    String? studentID,
    String? house,

    /// +2014
    int? graduationYear,
    bool? hasLeadershipRole,
    bool? isHeadofSchool,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _studentID = studentID,
        _house = house,
        _graduationYear = graduationYear,
        _hasLeadershipRole = hasLeadershipRole,
        _isHeadofSchool = isHeadofSchool,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "StudentID" field.
  String? _studentID;
  String get studentID => _studentID ?? '';
  set studentID(String? val) => _studentID = val;

  bool hasStudentID() => _studentID != null;

  // "House" field.
  String? _house;
  String get house => _house ?? '';
  set house(String? val) => _house = val;

  bool hasHouse() => _house != null;

  // "GraduationYear" field.
  int? _graduationYear;
  int get graduationYear => _graduationYear ?? 0;
  set graduationYear(int? val) => _graduationYear = val;

  void incrementGraduationYear(int amount) =>
      graduationYear = graduationYear + amount;

  bool hasGraduationYear() => _graduationYear != null;

  // "hasLeadershipRole" field.
  bool? _hasLeadershipRole;
  bool get hasLeadershipRole => _hasLeadershipRole ?? false;
  set hasLeadershipRole(bool? val) => _hasLeadershipRole = val;

  bool hasHasLeadershipRole() => _hasLeadershipRole != null;

  // "isHeadofSchool" field.
  bool? _isHeadofSchool;
  bool get isHeadofSchool => _isHeadofSchool ?? false;
  set isHeadofSchool(bool? val) => _isHeadofSchool = val;

  bool hasIsHeadofSchool() => _isHeadofSchool != null;

  static StudentStruct fromMap(Map<String, dynamic> data) => StudentStruct(
        name: data['Name'] as String?,
        studentID: data['StudentID'] as String?,
        house: data['House'] as String?,
        graduationYear: castToType<int>(data['GraduationYear']),
        hasLeadershipRole: data['hasLeadershipRole'] as bool?,
        isHeadofSchool: data['isHeadofSchool'] as bool?,
      );

  static StudentStruct? maybeFromMap(dynamic data) =>
      data is Map ? StudentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'StudentID': _studentID,
        'House': _house,
        'GraduationYear': _graduationYear,
        'hasLeadershipRole': _hasLeadershipRole,
        'isHeadofSchool': _isHeadofSchool,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'StudentID': serializeParam(
          _studentID,
          ParamType.String,
        ),
        'House': serializeParam(
          _house,
          ParamType.String,
        ),
        'GraduationYear': serializeParam(
          _graduationYear,
          ParamType.int,
        ),
        'hasLeadershipRole': serializeParam(
          _hasLeadershipRole,
          ParamType.bool,
        ),
        'isHeadofSchool': serializeParam(
          _isHeadofSchool,
          ParamType.bool,
        ),
      }.withoutNulls;

  static StudentStruct fromSerializableMap(Map<String, dynamic> data) =>
      StudentStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        studentID: deserializeParam(
          data['StudentID'],
          ParamType.String,
          false,
        ),
        house: deserializeParam(
          data['House'],
          ParamType.String,
          false,
        ),
        graduationYear: deserializeParam(
          data['GraduationYear'],
          ParamType.int,
          false,
        ),
        hasLeadershipRole: deserializeParam(
          data['hasLeadershipRole'],
          ParamType.bool,
          false,
        ),
        isHeadofSchool: deserializeParam(
          data['isHeadofSchool'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'StudentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StudentStruct &&
        name == other.name &&
        studentID == other.studentID &&
        house == other.house &&
        graduationYear == other.graduationYear &&
        hasLeadershipRole == other.hasLeadershipRole &&
        isHeadofSchool == other.isHeadofSchool;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        studentID,
        house,
        graduationYear,
        hasLeadershipRole,
        isHeadofSchool
      ]);
}

StudentStruct createStudentStruct({
  String? name,
  String? studentID,
  String? house,
  int? graduationYear,
  bool? hasLeadershipRole,
  bool? isHeadofSchool,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StudentStruct(
      name: name,
      studentID: studentID,
      house: house,
      graduationYear: graduationYear,
      hasLeadershipRole: hasLeadershipRole,
      isHeadofSchool: isHeadofSchool,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StudentStruct? updateStudentStruct(
  StudentStruct? student, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    student
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStudentStructData(
  Map<String, dynamic> firestoreData,
  StudentStruct? student,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (student == null) {
    return;
  }
  if (student.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && student.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final studentData = getStudentFirestoreData(student, forFieldValue);
  final nestedData = studentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = student.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStudentFirestoreData(
  StudentStruct? student, [
  bool forFieldValue = false,
]) {
  if (student == null) {
    return {};
  }
  final firestoreData = mapToFirestore(student.toMap());

  // Add any Firestore field values
  mapToFirestore(student.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStudentListFirestoreData(
  List<StudentStruct>? students,
) =>
    students?.map((e) => getStudentFirestoreData(e, true)).toList() ?? [];
