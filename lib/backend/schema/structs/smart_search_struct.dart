// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SmartSearchStruct extends FFFirebaseStruct {
  SmartSearchStruct({
    DateTime? when,
    String? result,
    String? queryStr,
    List<SearchItemStruct>? searchResults,
    String? text,
    bool? isDone,
    List<PlanItemStruct>? plan,
    bool? planOpen,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _when = when,
        _result = result,
        _queryStr = queryStr,
        _searchResults = searchResults,
        _text = text,
        _isDone = isDone,
        _plan = plan,
        _planOpen = planOpen,
        super(firestoreUtilData);

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

  // "searchResults" field.
  List<SearchItemStruct>? _searchResults;
  List<SearchItemStruct> get searchResults => _searchResults ?? const [];
  set searchResults(List<SearchItemStruct>? val) => _searchResults = val;

  void updateSearchResults(Function(List<SearchItemStruct>) updateFn) {
    updateFn(_searchResults ??= []);
  }

  bool hasSearchResults() => _searchResults != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  set isDone(bool? val) => _isDone = val;

  bool hasIsDone() => _isDone != null;

  // "plan" field.
  List<PlanItemStruct>? _plan;
  List<PlanItemStruct> get plan => _plan ?? const [];
  set plan(List<PlanItemStruct>? val) => _plan = val;

  void updatePlan(Function(List<PlanItemStruct>) updateFn) {
    updateFn(_plan ??= []);
  }

  bool hasPlan() => _plan != null;

  // "planOpen" field.
  bool? _planOpen;
  bool get planOpen => _planOpen ?? false;
  set planOpen(bool? val) => _planOpen = val;

  bool hasPlanOpen() => _planOpen != null;

  static SmartSearchStruct fromMap(Map<String, dynamic> data) =>
      SmartSearchStruct(
        when: data['when'] as DateTime?,
        result: data['result'] as String?,
        queryStr: data['query_str'] as String?,
        searchResults: getStructList(
          data['searchResults'],
          SearchItemStruct.fromMap,
        ),
        text: data['text'] as String?,
        isDone: data['isDone'] as bool?,
        plan: getStructList(
          data['plan'],
          PlanItemStruct.fromMap,
        ),
        planOpen: data['planOpen'] as bool?,
      );

  static SmartSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? SmartSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'when': _when,
        'result': _result,
        'query_str': _queryStr,
        'searchResults': _searchResults?.map((e) => e.toMap()).toList(),
        'text': _text,
        'isDone': _isDone,
        'plan': _plan?.map((e) => e.toMap()).toList(),
        'planOpen': _planOpen,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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
        'searchResults': serializeParam(
          _searchResults,
          ParamType.DataStruct,
          isList: true,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'isDone': serializeParam(
          _isDone,
          ParamType.bool,
        ),
        'plan': serializeParam(
          _plan,
          ParamType.DataStruct,
          isList: true,
        ),
        'planOpen': serializeParam(
          _planOpen,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SmartSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      SmartSearchStruct(
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
        searchResults: deserializeStructParam<SearchItemStruct>(
          data['searchResults'],
          ParamType.DataStruct,
          true,
          structBuilder: SearchItemStruct.fromSerializableMap,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        isDone: deserializeParam(
          data['isDone'],
          ParamType.bool,
          false,
        ),
        plan: deserializeStructParam<PlanItemStruct>(
          data['plan'],
          ParamType.DataStruct,
          true,
          structBuilder: PlanItemStruct.fromSerializableMap,
        ),
        planOpen: deserializeParam(
          data['planOpen'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SmartSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SmartSearchStruct &&
        when == other.when &&
        result == other.result &&
        queryStr == other.queryStr &&
        listEquality.equals(searchResults, other.searchResults) &&
        text == other.text &&
        isDone == other.isDone &&
        listEquality.equals(plan, other.plan) &&
        planOpen == other.planOpen;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [when, result, queryStr, searchResults, text, isDone, plan, planOpen]);
}

SmartSearchStruct createSmartSearchStruct({
  DateTime? when,
  String? result,
  String? queryStr,
  String? text,
  bool? isDone,
  bool? planOpen,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SmartSearchStruct(
      when: when,
      result: result,
      queryStr: queryStr,
      text: text,
      isDone: isDone,
      planOpen: planOpen,
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
