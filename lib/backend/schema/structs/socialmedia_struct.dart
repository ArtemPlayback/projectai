// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialmediaStruct extends FFFirebaseStruct {
  SocialmediaStruct({
    String? instagram,
    String? telegram,
    String? email,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _instagram = instagram,
        _telegram = telegram,
        _email = email,
        super(firestoreUtilData);

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  set instagram(String? val) => _instagram = val;
  bool hasInstagram() => _instagram != null;

  // "telegram" field.
  String? _telegram;
  String get telegram => _telegram ?? '';
  set telegram(String? val) => _telegram = val;
  bool hasTelegram() => _telegram != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  static SocialmediaStruct fromMap(Map<String, dynamic> data) =>
      SocialmediaStruct(
        instagram: data['instagram'] as String?,
        telegram: data['telegram'] as String?,
        email: data['email'] as String?,
      );

  static SocialmediaStruct? maybeFromMap(dynamic data) => data is Map
      ? SocialmediaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'instagram': _instagram,
        'telegram': _telegram,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'instagram': serializeParam(
          _instagram,
          ParamType.String,
        ),
        'telegram': serializeParam(
          _telegram,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static SocialmediaStruct fromSerializableMap(Map<String, dynamic> data) =>
      SocialmediaStruct(
        instagram: deserializeParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        telegram: deserializeParam(
          data['telegram'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SocialmediaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SocialmediaStruct &&
        instagram == other.instagram &&
        telegram == other.telegram &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([instagram, telegram, email]);
}

SocialmediaStruct createSocialmediaStruct({
  String? instagram,
  String? telegram,
  String? email,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SocialmediaStruct(
      instagram: instagram,
      telegram: telegram,
      email: email,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SocialmediaStruct? updateSocialmediaStruct(
  SocialmediaStruct? socialmedia, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    socialmedia
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSocialmediaStructData(
  Map<String, dynamic> firestoreData,
  SocialmediaStruct? socialmedia,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (socialmedia == null) {
    return;
  }
  if (socialmedia.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && socialmedia.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final socialmediaData =
      getSocialmediaFirestoreData(socialmedia, forFieldValue);
  final nestedData =
      socialmediaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = socialmedia.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSocialmediaFirestoreData(
  SocialmediaStruct? socialmedia, [
  bool forFieldValue = false,
]) {
  if (socialmedia == null) {
    return {};
  }
  final firestoreData = mapToFirestore(socialmedia.toMap());

  // Add any Firestore field values
  socialmedia.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSocialmediaListFirestoreData(
  List<SocialmediaStruct>? socialmedias,
) =>
    socialmedias?.map((e) => getSocialmediaFirestoreData(e, true)).toList() ??
    [];
