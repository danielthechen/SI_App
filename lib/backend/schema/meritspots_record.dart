import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeritspotsRecord extends FirestoreRecord {
  MeritspotsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "prefect" field.
  StudentStruct? _prefect;
  StudentStruct get prefect => _prefect ?? StudentStruct();
  bool hasPrefect() => _prefect != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "studentName" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  bool hasStudentName() => _studentName != null;

  // "studentHouse" field.
  String? _studentHouse;
  String get studentHouse => _studentHouse ?? '';
  bool hasStudentHouse() => _studentHouse != null;

  // "studentYear" field.
  String? _studentYear;
  String get studentYear => _studentYear ?? '';
  bool hasStudentYear() => _studentYear != null;

  // "meritspot" field.
  String? _meritspot;
  String get meritspot => _meritspot ?? '';
  bool hasMeritspot() => _meritspot != null;

  void _initializeFields() {
    _time = snapshotData['time'] as DateTime?;
    _prefect = snapshotData['prefect'] is StudentStruct
        ? snapshotData['prefect']
        : StudentStruct.maybeFromMap(snapshotData['prefect']);
    _reason = snapshotData['reason'] as String?;
    _studentName = snapshotData['studentName'] as String?;
    _studentHouse = snapshotData['studentHouse'] as String?;
    _studentYear = snapshotData['studentYear'] as String?;
    _meritspot = snapshotData['meritspot'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meritspots');

  static Stream<MeritspotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeritspotsRecord.fromSnapshot(s));

  static Future<MeritspotsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeritspotsRecord.fromSnapshot(s));

  static MeritspotsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeritspotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeritspotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeritspotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeritspotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeritspotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeritspotsRecordData({
  DateTime? time,
  StudentStruct? prefect,
  String? reason,
  String? studentName,
  String? studentHouse,
  String? studentYear,
  String? meritspot,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
      'prefect': StudentStruct().toMap(),
      'reason': reason,
      'studentName': studentName,
      'studentHouse': studentHouse,
      'studentYear': studentYear,
      'meritspot': meritspot,
    }.withoutNulls,
  );

  // Handle nested data for "prefect" field.
  addStudentStructData(firestoreData, prefect, 'prefect');

  return firestoreData;
}

class MeritspotsRecordDocumentEquality implements Equality<MeritspotsRecord> {
  const MeritspotsRecordDocumentEquality();

  @override
  bool equals(MeritspotsRecord? e1, MeritspotsRecord? e2) {
    return e1?.time == e2?.time &&
        e1?.prefect == e2?.prefect &&
        e1?.reason == e2?.reason &&
        e1?.studentName == e2?.studentName &&
        e1?.studentHouse == e2?.studentHouse &&
        e1?.studentYear == e2?.studentYear &&
        e1?.meritspot == e2?.meritspot;
  }

  @override
  int hash(MeritspotsRecord? e) => const ListEquality().hash([
        e?.time,
        e?.prefect,
        e?.reason,
        e?.studentName,
        e?.studentHouse,
        e?.studentYear,
        e?.meritspot
      ]);

  @override
  bool isValidKey(Object? o) => o is MeritspotsRecord;
}
