// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentPropertiesStruct extends FFFirebaseStruct {
  DocumentPropertiesStruct({
    String? title,
    String? type,
    String? weight,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _type = type,
        _weight = weight,
        _text = text,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  set weight(String? val) => _weight = val;

  bool hasWeight() => _weight != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static DocumentPropertiesStruct fromMap(Map<String, dynamic> data) =>
      DocumentPropertiesStruct(
        title: data['title'] as String?,
        type: data['type'] as String?,
        weight: data['weight'] as String?,
        text: data['text'] as String?,
      );

  static DocumentPropertiesStruct? maybeFromMap(dynamic data) => data is Map
      ? DocumentPropertiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'type': _type,
        'weight': _weight,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static DocumentPropertiesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DocumentPropertiesStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
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
  String toString() => 'DocumentPropertiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DocumentPropertiesStruct &&
        title == other.title &&
        type == other.type &&
        weight == other.weight &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([title, type, weight, text]);
}

DocumentPropertiesStruct createDocumentPropertiesStruct({
  String? title,
  String? type,
  String? weight,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DocumentPropertiesStruct(
      title: title,
      type: type,
      weight: weight,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DocumentPropertiesStruct? updateDocumentPropertiesStruct(
  DocumentPropertiesStruct? documentProperties, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    documentProperties
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDocumentPropertiesStructData(
  Map<String, dynamic> firestoreData,
  DocumentPropertiesStruct? documentProperties,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (documentProperties == null) {
    return;
  }
  if (documentProperties.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && documentProperties.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final documentPropertiesData =
      getDocumentPropertiesFirestoreData(documentProperties, forFieldValue);
  final nestedData =
      documentPropertiesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      documentProperties.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDocumentPropertiesFirestoreData(
  DocumentPropertiesStruct? documentProperties, [
  bool forFieldValue = false,
]) {
  if (documentProperties == null) {
    return {};
  }
  final firestoreData = mapToFirestore(documentProperties.toMap());

  // Add any Firestore field values
  documentProperties.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDocumentPropertiesListFirestoreData(
  List<DocumentPropertiesStruct>? documentPropertiess,
) =>
    documentPropertiess
        ?.map((e) => getDocumentPropertiesFirestoreData(e, true))
        .toList() ??
    [];
