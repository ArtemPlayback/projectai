// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CashFlowStruct extends FFFirebaseStruct {
  CashFlowStruct({
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

  static CashFlowStruct fromMap(Map<String, dynamic> data) => CashFlowStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static CashFlowStruct? maybeFromMap(dynamic data) =>
      data is Map ? CashFlowStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static CashFlowStruct fromSerializableMap(Map<String, dynamic> data) =>
      CashFlowStruct(
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
  String toString() => 'CashFlowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CashFlowStruct &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description]);
}

CashFlowStruct createCashFlowStruct({
  String? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CashFlowStruct(
      title: title,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CashFlowStruct? updateCashFlowStruct(
  CashFlowStruct? cashFlow, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cashFlow
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCashFlowStructData(
  Map<String, dynamic> firestoreData,
  CashFlowStruct? cashFlow,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cashFlow == null) {
    return;
  }
  if (cashFlow.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cashFlow.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cashFlowData = getCashFlowFirestoreData(cashFlow, forFieldValue);
  final nestedData = cashFlowData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cashFlow.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCashFlowFirestoreData(
  CashFlowStruct? cashFlow, [
  bool forFieldValue = false,
]) {
  if (cashFlow == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cashFlow.toMap());

  // Add any Firestore field values
  cashFlow.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCashFlowListFirestoreData(
  List<CashFlowStruct>? cashFlows,
) =>
    cashFlows?.map((e) => getCashFlowFirestoreData(e, true)).toList() ?? [];
