import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoldcoastRecord extends FirestoreRecord {
  GoldcoastRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "student" field.
  StudentStruct? _student;
  StudentStruct get student => _student ?? StudentStruct();
  bool hasStudent() => _student != null;

  // "exitTime" field.
  DateTime? _exitTime;
  DateTime? get exitTime => _exitTime;
  bool hasExitTime() => _exitTime != null;

  // "reenterTime" field.
  DateTime? _reenterTime;
  DateTime? get reenterTime => _reenterTime;
  bool hasReenterTime() => _reenterTime != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  void _initializeFields() {
    _student = snapshotData['student'] is StudentStruct
        ? snapshotData['student']
        : StudentStruct.maybeFromMap(snapshotData['student']);
    _exitTime = snapshotData['exitTime'] as DateTime?;
    _reenterTime = snapshotData['reenterTime'] as DateTime?;
    _date = snapshotData['date'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goldcoast');

  static Stream<GoldcoastRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoldcoastRecord.fromSnapshot(s));

  static Future<GoldcoastRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoldcoastRecord.fromSnapshot(s));

  static GoldcoastRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoldcoastRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoldcoastRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoldcoastRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoldcoastRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoldcoastRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoldcoastRecordData({
  StudentStruct? student,
  DateTime? exitTime,
  DateTime? reenterTime,
  String? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student': StudentStruct().toMap(),
      'exitTime': exitTime,
      'reenterTime': reenterTime,
      'date': date,
    }.withoutNulls,
  );

  // Handle nested data for "student" field.
  addStudentStructData(firestoreData, student, 'student');

  return firestoreData;
}

class GoldcoastRecordDocumentEquality implements Equality<GoldcoastRecord> {
  const GoldcoastRecordDocumentEquality();

  @override
  bool equals(GoldcoastRecord? e1, GoldcoastRecord? e2) {
    return e1?.student == e2?.student &&
        e1?.exitTime == e2?.exitTime &&
        e1?.reenterTime == e2?.reenterTime &&
        e1?.date == e2?.date;
  }

  @override
  int hash(GoldcoastRecord? e) => const ListEquality()
      .hash([e?.student, e?.exitTime, e?.reenterTime, e?.date]);

  @override
  bool isValidKey(Object? o) => o is GoldcoastRecord;
}
