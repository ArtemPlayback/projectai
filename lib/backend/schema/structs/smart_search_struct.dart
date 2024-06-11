// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SmartSearchStruct extends FFFirebaseStruct {
  SmartSearchStruct({
    String? type,
    DateTime? when,
    String? result,
    String? queryStr,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _when = when,
        _result = result,
        _queryStr = queryStr,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "when" field.
  DateTime? _when;
  DateTime? get when => _when;
  set when(DateTime? val) => _when = val;
  bool hasWhen() => _when != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  set result(String? val) => _result = val;
  bool hasResult() => _result != null;

  // "query_str" field.
  String? _queryStr;
  String get queryStr => _queryStr ?? '';
  set queryStr(String? val) => _queryStr = val;
  bool hasQueryStr() => _queryStr != null;

  static SmartSearchStruct fromMap(Map<String, dynamic> data) =>
      SmartSearchStruct(
        type: data['type'] as String?,
        when: data['when'] as DateTime?,
        result: data['result'] as String?,
        queryStr: data['query_str'] as String?,
      );

  static SmartSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? SmartSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'when': _when,
        'result': _result,
        'query_str': _queryStr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'when': serializeParam(
          _when,
          ParamType.DateTime,
        ),
        'result': serializeParam(
          _result,
          ParamType.String,
        ),
        'query_str': serializeParam(
          _queryStr,
          ParamType.String,
        ),
      }.withoutNulls;

  static SmartSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      SmartSearchStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        when: deserializeParam(
          data['when'],
          ParamType.DateTime,
          false,
        ),
        result: deserializeParam(
          data['result'],
          ParamType.String,
          false,
        ),
        queryStr: deserializeParam(
          data['query_str'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SmartSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SmartSearchStruct &&
        type == other.type &&
        when == other.when &&
        result == other.result &&
        queryStr == other.queryStr;
  }

  @override
  int get hashCode => const ListEquality().hash([type, when, result, queryStr]);
}

SmartSearchStruct createSmartSearchStruct({
  String? type,
  DateTime? when,
  String? result,
  String? queryStr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SmartSearchStruct(
      type: type,
      when: when,
      result: result,
      queryStr: queryStr,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SmartSearchStruct? updateSmartSearchStruct(
  SmartSearchStruct? smartSearch, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    smartSearch
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSmartSearchStructData(
  Map<String, dynamic> firestoreData,
  SmartSearchStruct? smartSearch,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (smartSearch == null) {
    return;
  }
  if (smartSearch.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && smartSearch.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final smartSearchData =
      getSmartSearchFirestoreData(smartSearch, forFieldValue);
  final nestedData =
      smartSearchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = smartSearch.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSmartSearchFirestoreData(
  SmartSearchStruct? smartSearch, [
  bool forFieldValue = false,
]) {
  if (smartSearch == null) {
    return {};
  }
  final firestoreData = mapToFirestore(smartSearch.toMap());

  // Add any Firestore field values
  smartSearch.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSmartSearchListFirestoreData(
  List<SmartSearchStruct>? smartSearchs,
) =>
    smartSearchs?.map((e) => getSmartSearchFirestoreData(e, true)).toList() ??
    [];
