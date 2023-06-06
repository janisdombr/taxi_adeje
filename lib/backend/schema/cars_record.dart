import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarsRecord extends FirestoreRecord {
  CarsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "geo" field.
  LatLng? _geo;
  LatLng? get geo => _geo;
  bool hasGeo() => _geo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "car_brand" field.
  String? _carBrand;
  String get carBrand => _carBrand ?? '';
  bool hasCarBrand() => _carBrand != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  bool hasPicture() => _picture != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "driver_user_ref" field.
  DocumentReference? _driverUserRef;
  DocumentReference? get driverUserRef => _driverUserRef;
  bool hasDriverUserRef() => _driverUserRef != null;

  void _initializeFields() {
    _geo = snapshotData['geo'] as LatLng?;
    _name = snapshotData['name'] as String?;
    _carBrand = snapshotData['car_brand'] as String?;
    _phone = snapshotData['phone'] as String?;
    _picture = snapshotData['picture'] as String?;
    _driverName = snapshotData['driver_name'] as String?;
    _driverUserRef = snapshotData['driver_user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cars');

  static Stream<CarsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarsRecord.fromSnapshot(s));

  static Future<CarsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarsRecord.fromSnapshot(s));

  static CarsRecord fromSnapshot(DocumentSnapshot snapshot) => CarsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCarsRecordData({
  LatLng? geo,
  String? name,
  String? carBrand,
  String? phone,
  String? picture,
  String? driverName,
  DocumentReference? driverUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'geo': geo,
      'name': name,
      'car_brand': carBrand,
      'phone': phone,
      'picture': picture,
      'driver_name': driverName,
      'driver_user_ref': driverUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}
