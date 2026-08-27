import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _Selfie = await secureStorage.getString('ff_Selfie') ?? _Selfie;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_StudentInfo') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_StudentInfo') ?? '{}';
          _StudentInfo =
              StudentStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_accessAuth') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_accessAuth') ?? '{}';
          _accessAuth = AccessAuthenticatorsStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_StaffType') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_StaffType') ?? '{}';
          _StaffType =
              StaffStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  /// user selfie!
  String _Selfie = '';
  String get Selfie => _Selfie;
  set Selfie(String value) {
    _Selfie = value;
    secureStorage.setString('ff_Selfie', value);
  }

  void deleteSelfie() {
    secureStorage.delete(key: 'ff_Selfie');
  }

  StudentStruct _StudentInfo = StudentStruct();
  StudentStruct get StudentInfo => _StudentInfo;
  set StudentInfo(StudentStruct value) {
    _StudentInfo = value;
    secureStorage.setString('ff_StudentInfo', value.serialize());
  }

  void deleteStudentInfo() {
    secureStorage.delete(key: 'ff_StudentInfo');
  }

  void updateStudentInfoStruct(Function(StudentStruct) updateFn) {
    updateFn(_StudentInfo);
    secureStorage.setString('ff_StudentInfo', _StudentInfo.serialize());
  }

  AccessAuthenticatorsStruct _accessAuth =
      AccessAuthenticatorsStruct.fromSerializableMap(jsonDecode('{}'));
  AccessAuthenticatorsStruct get accessAuth => _accessAuth;
  set accessAuth(AccessAuthenticatorsStruct value) {
    _accessAuth = value;
    secureStorage.setString('ff_accessAuth', value.serialize());
  }

  void deleteAccessAuth() {
    secureStorage.delete(key: 'ff_accessAuth');
  }

  void updateAccessAuthStruct(Function(AccessAuthenticatorsStruct) updateFn) {
    updateFn(_accessAuth);
    secureStorage.setString('ff_accessAuth', _accessAuth.serialize());
  }

  StaffStruct _StaffType = StaffStruct();
  StaffStruct get StaffType => _StaffType;
  set StaffType(StaffStruct value) {
    _StaffType = value;
    secureStorage.setString('ff_StaffType', value.serialize());
  }

  void deleteStaffType() {
    secureStorage.delete(key: 'ff_StaffType');
  }

  void updateStaffTypeStruct(Function(StaffStruct) updateFn) {
    updateFn(_StaffType);
    secureStorage.setString('ff_StaffType', _StaffType.serialize());
  }

  List<PrefectItemStruct> _prefectCart = [];
  List<PrefectItemStruct> get prefectCart => _prefectCart;
  set prefectCart(List<PrefectItemStruct> value) {
    _prefectCart = value;
  }

  void addToPrefectCart(PrefectItemStruct value) {
    prefectCart.add(value);
  }

  void removeFromPrefectCart(PrefectItemStruct value) {
    prefectCart.remove(value);
  }

  void removeAtIndexFromPrefectCart(int index) {
    prefectCart.removeAt(index);
  }

  void updatePrefectCartAtIndex(
    int index,
    PrefectItemStruct Function(PrefectItemStruct) updateFn,
  ) {
    prefectCart[index] = updateFn(_prefectCart[index]);
  }

  void insertAtIndexInPrefectCart(int index, PrefectItemStruct value) {
    prefectCart.insert(index, value);
  }

  bool _loginRedirected = false;
  bool get loginRedirected => _loginRedirected;
  set loginRedirected(bool value) {
    _loginRedirected = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
