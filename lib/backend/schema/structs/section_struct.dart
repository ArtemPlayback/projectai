// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectionStruct extends FFFirebaseStruct {
  SectionStruct({
    String? title,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _text = text,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static SectionStruct fromMap(Map<String, dynamic> data) => SectionStruct(
        title: data['title'] as String?,
        text: data['text'] as String?,
      );

  static SectionStruct? maybeFromMap(dynamic data) =>
      data is Map ? SectionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static SectionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SectionStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SectionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SectionStruct && title == other.title && text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([title, text]);
}

SectionStruct createSectionStruct({
  String? title,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SectionStruct(
      title: title,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SectionStruct? updateSectionStruct(
  SectionStruct? section, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    section
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSectionStructData(
  Map<String, dynamic> firestoreData,
  SectionStruct? section,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (section == null) {
    return;
  }
  if (section.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && section.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sectionData = getSectionFirestoreData(section, forFieldValue);
  final nestedData = sectionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = section.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSectionFirestoreData(
  SectionStruct? section, [
  bool forFieldValue = false,
]) {
  if (section == null) {
    return {};
  }
  final firestoreData = mapToFirestore(section.toMap());

  // Add any Firestore field values
  section.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSectionListFirestoreData(
  List<SectionStruct>? sections,
) =>
    sections?.map((e) => getSectionFirestoreData(e, true)).toList() ?? [];
