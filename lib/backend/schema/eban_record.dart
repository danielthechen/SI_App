import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EbanRecord extends FirestoreRecord {
  EbanRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "banUntil" field.
  DateTime? _banUntil;
  DateTime? get banUntil => _banUntil;
  bool hasBanUntil() => _banUntil != null;

  void _initializeFields() {
    _banUntil = snapshotData['banUntil'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eban');

  static Stream<EbanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EbanRecord.fromSnapshot(s));

  static Future<EbanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EbanRecord.fromSnapshot(s));

  static EbanRecord fromSnapshot(DocumentSnapshot snapshot) => EbanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EbanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EbanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EbanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EbanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEbanRecordData({
  DateTime? banUntil,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'banUntil': banUntil,
    }.withoutNulls,
  );

  return firestoreData;
}

class EbanRecordDocumentEquality implements Equality<EbanRecord> {
  const EbanRecordDocumentEquality();

  @override
  bool equals(EbanRecord? e1, EbanRecord? e2) {
    return e1?.banUntil == e2?.banUntil;
  }

  @override
  int hash(EbanRecord? e) => const ListEquality().hash([e?.banUntil]);

  @override
  bool isValidKey(Object? o) => o is EbanRecord;
}
