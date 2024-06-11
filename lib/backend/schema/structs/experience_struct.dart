// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExperienceStruct extends FFFirebaseStruct {
  ExperienceStruct({
    String? title,
    String? details,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _details = details,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;
  bool hasDetails() => _details != null;

  static ExperienceStruct fromMap(Map<String, dynamic> data) =>
      ExperienceStruct(
        title: data['title'] as String?,
        details: data['details'] as String?,
      );

  static ExperienceStruct? maybeFromMap(dynamic data) => data is Map
      ? ExperienceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'details': _details,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'details': serializeParam(
          _details,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExperienceStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExperienceStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        details: deserializeParam(
          data['details'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExperienceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExperienceStruct &&
        title == other.title &&
        details == other.details;
  }

  @override
  int get hashCode => const ListEquality().hash([title, details]);
}

ExperienceStruct createExperienceStruct({
  String? title,
  String? details,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExperienceStruct(
      title: title,
      details: details,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExperienceStruct? updateExperienceStruct(
  ExperienceStruct? experience, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    experience
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExperienceStructData(
  Map<String, dynamic> firestoreData,
  ExperienceStruct? experience,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (experience == null) {
    return;
  }
  if (experience.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && experience.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final experienceData = getExperienceFirestoreData(experience, forFieldValue);
  final nestedData = experienceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = experience.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExperienceFirestoreData(
  ExperienceStruct? experience, [
  bool forFieldValue = false,
]) {
  if (experience == null) {
    return {};
  }
  final firestoreData = mapToFirestore(experience.toMap());

  // Add any Firestore field values
  experience.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExperienceListFirestoreData(
  List<ExperienceStruct>? experiences,
) =>
    experiences?.map((e) => getExperienceFirestoreData(e, true)).toList() ?? [];
