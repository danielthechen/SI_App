import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GymRecord extends FirestoreRecord {
  GymRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "enterTime" field.
  DateTime? _enterTime;
  DateTime? get enterTime => _enterTime;
  bool hasEnterTime() => _enterTime != null;

  // "exitTime" field.
  DateTime? _exitTime;
  DateTime? get exitTime => _exitTime;
  bool hasExitTime() => _exitTime != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "student" field.
  StudentStruct? _student;
  StudentStruct get student => _student ?? StudentStruct();
  bool hasStudent() => _student != null;

  // "house" field.
  String? _house;
  String get house => _house ?? '';
  bool hasHouse() => _house != null;

  void _initializeFields() {
    _enterTime = snapshotData['enterTime'] as DateTime?;
    _exitTime = snapshotData['exitTime'] as DateTime?;
    _date = snapshotData['date'] as String?;
    _student = snapshotData['student'] is StudentStruct
        ? snapshotData['student']
        : StudentStruct.maybeFromMap(snapshotData['student']);
    _house = snapshotData['house'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gym');

  static Stream<GymRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GymRecord.fromSnapshot(s));

  static Future<GymRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GymRecord.fromSnapshot(s));

  static GymRecord fromSnapshot(DocumentSnapshot snapshot) => GymRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GymRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GymRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GymRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GymRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGymRecordData({
  DateTime? enterTime,
  DateTime? exitTime,
  String? date,
  StudentStruct? student,
  String? house,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'enterTime': enterTime,
      'exitTime': exitTime,
      'date': date,
      'student': StudentStruct().toMap(),
      'house': house,
    }.withoutNulls,
  );

  // Handle nested data for "student" field.
  addStudentStructData(firestoreData, student, 'student');

  return firestoreData;
}

class GymRecordDocumentEquality implements Equality<GymRecord> {
  const GymRecordDocumentEquality();

  @override
  bool equals(GymRecord? e1, GymRecord? e2) {
    return e1?.enterTime == e2?.enterTime &&
        e1?.exitTime == e2?.exitTime &&
        e1?.date == e2?.date &&
        e1?.student == e2?.student &&
        e1?.house == e2?.house;
  }

  @override
  int hash(GymRecord? e) => const ListEquality()
      .hash([e?.enterTime, e?.exitTime, e?.date, e?.student, e?.house]);

  @override
  bool isValidKey(Object? o) => o is GymRecord;
}
