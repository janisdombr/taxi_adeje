// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarStruct extends FFFirebaseStruct {
  CarStruct({
    String? name,
    String? carBrand,
    String? phone,
    LatLng? geo,
    String? picture,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _carBrand = carBrand,
        _phone = phone,
        _geo = geo,
        _picture = picture,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "car_brand" field.
  String? _carBrand;
  String get carBrand => _carBrand ?? '';
  set carBrand(String? val) => _carBrand = val;
  bool hasCarBrand() => _carBrand != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "geo" field.
  LatLng? _geo;
  LatLng? get geo => _geo;
  set geo(LatLng? val) => _geo = val;
  bool hasGeo() => _geo != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  set picture(String? val) => _picture = val;
  bool hasPicture() => _picture != null;

  static CarStruct fromMap(Map<String, dynamic> data) => CarStruct(
        name: data['name'] as String?,
        carBrand: data['car_brand'] as String?,
        phone: data['phone'] as String?,
        geo: data['geo'] as LatLng?,
        picture: data['picture'] as String?,
      );

  static CarStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CarStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'car_brand': _carBrand,
        'phone': _phone,
        'geo': _geo,
        'picture': _picture,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'car_brand': serializeParam(
          _carBrand,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'geo': serializeParam(
          _geo,
          ParamType.LatLng,
        ),
        'picture': serializeParam(
          _picture,
          ParamType.String,
        ),
      }.withoutNulls;

  static CarStruct fromSerializableMap(Map<String, dynamic> data) => CarStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        carBrand: deserializeParam(
          data['car_brand'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        geo: deserializeParam(
          data['geo'],
          ParamType.LatLng,
          false,
        ),
        picture: deserializeParam(
          data['picture'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CarStruct(${toMap()})';
}

CarStruct createCarStruct({
  String? name,
  String? carBrand,
  String? phone,
  LatLng? geo,
  String? picture,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CarStruct(
      name: name,
      carBrand: carBrand,
      phone: phone,
      geo: geo,
      picture: picture,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CarStruct? updateCarStruct(
  CarStruct? car, {
  bool clearUnsetFields = true,
}) =>
    car
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addCarStructData(
  Map<String, dynamic> firestoreData,
  CarStruct? car,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (car == null) {
    return;
  }
  if (car.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && car.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final carData = getCarFirestoreData(car, forFieldValue);
  final nestedData = carData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = car.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCarFirestoreData(
  CarStruct? car, [
  bool forFieldValue = false,
]) {
  if (car == null) {
    return {};
  }
  final firestoreData = mapToFirestore(car.toMap());

  // Add any Firestore field values
  car.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCarListFirestoreData(
  List<CarStruct>? cars,
) =>
    cars?.map((e) => getCarFirestoreData(e, true)).toList() ?? [];
