// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanItemStruct extends FFFirebaseStruct {
  PlanItemStruct({
    String? title,
    String? description,
    bool? isDone,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _isDone = isDone,
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

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  set isDone(bool? val) => _isDone = val;

  bool hasIsDone() => _isDone != null;

  static PlanItemStruct fromMap(Map<String, dynamic> data) => PlanItemStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        isDone: data['isDone'] as bool?,
      );

  static PlanItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlanItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'isDone': _isDone,
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
        'isDone': serializeParam(
          _isDone,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PlanItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanItemStruct(
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
        isDone: deserializeParam(
          data['isDone'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PlanItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlanItemStruct &&
        title == other.title &&
        description == other.description &&
        isDone == other.isDone;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description, isDone]);
}

PlanItemStruct createPlanItemStruct({
  String? title,
  String? description,
  bool? isDone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanItemStruct(
      title: title,
      description: description,
      isDone: isDone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanItemStruct? updatePlanItemStruct(
  PlanItemStruct? planItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    planItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanItemStructData(
  Map<String, dynamic> firestoreData,
  PlanItemStruct? planItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (planItem == null) {
    return;
  }
  if (planItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && planItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planItemData = getPlanItemFirestoreData(planItem, forFieldValue);
  final nestedData = planItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = planItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanItemFirestoreData(
  PlanItemStruct? planItem, [
  bool forFieldValue = false,
]) {
  if (planItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(planItem.toMap());

  // Add any Firestore field values
  planItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanItemListFirestoreData(
  List<PlanItemStruct>? planItems,
) =>
    planItems?.map((e) => getPlanItemFirestoreData(e, true)).toList() ?? [];
