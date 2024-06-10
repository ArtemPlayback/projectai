// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SolutionsStruct extends FFFirebaseStruct {
  SolutionsStruct({
    String? title,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static SolutionsStruct fromMap(Map<String, dynamic> data) => SolutionsStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static SolutionsStruct? maybeFromMap(dynamic data) => data is Map
      ? SolutionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static SolutionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SolutionsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SolutionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SolutionsStruct &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description]);
}

SolutionsStruct createSolutionsStruct({
  String? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SolutionsStruct(
      title: title,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SolutionsStruct? updateSolutionsStruct(
  SolutionsStruct? solutions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    solutions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSolutionsStructData(
  Map<String, dynamic> firestoreData,
  SolutionsStruct? solutions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (solutions == null) {
    return;
  }
  if (solutions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && solutions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final solutionsData = getSolutionsFirestoreData(solutions, forFieldValue);
  final nestedData = solutionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = solutions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSolutionsFirestoreData(
  SolutionsStruct? solutions, [
  bool forFieldValue = false,
]) {
  if (solutions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(solutions.toMap());

  // Add any Firestore field values
  solutions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSolutionsListFirestoreData(
  List<SolutionsStruct>? solutionss,
) =>
    solutionss?.map((e) => getSolutionsFirestoreData(e, true)).toList() ?? [];
