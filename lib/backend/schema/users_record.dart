import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "accessAuth" field.
  AccessAuthenticatorsStruct? _accessAuth;
  AccessAuthenticatorsStruct get accessAuth =>
      _accessAuth ?? AccessAuthenticatorsStruct();
  bool hasAccessAuth() => _accessAuth != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "isOldUser" field.
  bool? _isOldUser;
  bool get isOldUser => _isOldUser ?? false;
  bool hasIsOldUser() => _isOldUser != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "student" field.
  StudentStruct? _student;
  StudentStruct get student => _student ?? StudentStruct();
  bool hasStudent() => _student != null;

  // "teacher" field.
  StaffStruct? _teacher;
  StaffStruct get teacher => _teacher ?? StaffStruct();
  bool hasTeacher() => _teacher != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _accessAuth = snapshotData['accessAuth'] is AccessAuthenticatorsStruct
        ? snapshotData['accessAuth']
        : AccessAuthenticatorsStruct.maybeFromMap(snapshotData['accessAuth']);
    _displayName = snapshotData['display_name'] as String?;
    _isOldUser = snapshotData['isOldUser'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _student = snapshotData['student'] is StudentStruct
        ? snapshotData['student']
        : StudentStruct.maybeFromMap(snapshotData['student']);
    _teacher = snapshotData['teacher'] is StaffStruct
        ? snapshotData['teacher']
        : StaffStruct.maybeFromMap(snapshotData['teacher']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  AccessAuthenticatorsStruct? accessAuth,
  String? displayName,
  bool? isOldUser,
  String? photoUrl,
  String? phoneNumber,
  DateTime? createdTime,
  String? uid,
  StudentStruct? student,
  StaffStruct? teacher,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'accessAuth': AccessAuthenticatorsStruct().toMap(),
      'display_name': displayName,
      'isOldUser': isOldUser,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'uid': uid,
      'student': StudentStruct().toMap(),
      'teacher': StaffStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "accessAuth" field.
  addAccessAuthenticatorsStructData(firestoreData, accessAuth, 'accessAuth');

  // Handle nested data for "student" field.
  addStudentStructData(firestoreData, student, 'student');

  // Handle nested data for "teacher" field.
  addStaffStructData(firestoreData, teacher, 'teacher');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.accessAuth == e2?.accessAuth &&
        e1?.displayName == e2?.displayName &&
        e1?.isOldUser == e2?.isOldUser &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.uid == e2?.uid &&
        e1?.student == e2?.student &&
        e1?.teacher == e2?.teacher;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.accessAuth,
        e?.displayName,
        e?.isOldUser,
        e?.photoUrl,
        e?.phoneNumber,
        e?.createdTime,
        e?.uid,
        e?.student,
        e?.teacher
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
