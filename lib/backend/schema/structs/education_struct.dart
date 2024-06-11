// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationStruct extends FFFirebaseStruct {
  EducationStruct({
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

  static EducationStruct fromMap(Map<String, dynamic> data) => EducationStruct(
        title: data['title'] as String?,
        details: data['details'] as String?,
      );

  static EducationStruct? maybeFromMap(dynamic data) => data is Map
      ? EducationStruct.fromMap(data.cast<String, dynamic>())
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

  static EducationStruct fromSerializableMap(Map<String, dynamic> data) =>
      EducationStruct(
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
  String toString() => 'EducationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EducationStruct &&
        title == other.title &&
        details == other.details;
  }

  @override
  int get hashCode => const ListEquality().hash([title, details]);
}

EducationStruct createEducationStruct({
  String? title,
  String? details,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EducationStruct(
      title: title,
      details: details,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EducationStruct? updateEducationStruct(
  EducationStruct? education, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    education
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEducationStructData(
  Map<String, dynamic> firestoreData,
  EducationStruct? education,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (education == null) {
    return;
  }
  if (education.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && education.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final educationData = getEducationFirestoreData(education, forFieldValue);
  final nestedData = educationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = education.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEducationFirestoreData(
  EducationStruct? education, [
  bool forFieldValue = false,
]) {
  if (education == null) {
    return {};
  }
  final firestoreData = mapToFirestore(education.toMap());

  // Add any Firestore field values
  education.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEducationListFirestoreData(
  List<EducationStruct>? educations,
) =>
    educations?.map((e) => getEducationFirestoreData(e, true)).toList() ?? [];
