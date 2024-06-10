// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchItemStruct extends FFFirebaseStruct {
  SearchItemStruct({
    String? type,
    String? explanation,
    String? firebaseId,
    int? percent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _explanation = explanation,
        _firebaseId = firebaseId,
        _percent = percent,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "explanation" field.
  String? _explanation;
  String get explanation => _explanation ?? '';
  set explanation(String? val) => _explanation = val;
  bool hasExplanation() => _explanation != null;

  // "firebase_id" field.
  String? _firebaseId;
  String get firebaseId => _firebaseId ?? '';
  set firebaseId(String? val) => _firebaseId = val;
  bool hasFirebaseId() => _firebaseId != null;

  // "percent" field.
  int? _percent;
  int get percent => _percent ?? 0;
  set percent(int? val) => _percent = val;
  void incrementPercent(int amount) => _percent = percent + amount;
  bool hasPercent() => _percent != null;

  static SearchItemStruct fromMap(Map<String, dynamic> data) =>
      SearchItemStruct(
        type: data['type'] as String?,
        explanation: data['explanation'] as String?,
        firebaseId: data['firebase_id'] as String?,
        percent: castToType<int>(data['percent']),
      );

  static SearchItemStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'explanation': _explanation,
        'firebase_id': _firebaseId,
        'percent': _percent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'explanation': serializeParam(
          _explanation,
          ParamType.String,
        ),
        'firebase_id': serializeParam(
          _firebaseId,
          ParamType.String,
        ),
        'percent': serializeParam(
          _percent,
          ParamType.int,
        ),
      }.withoutNulls;

  static SearchItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchItemStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        explanation: deserializeParam(
          data['explanation'],
          ParamType.String,
          false,
        ),
        firebaseId: deserializeParam(
          data['firebase_id'],
          ParamType.String,
          false,
        ),
        percent: deserializeParam(
          data['percent'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SearchItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchItemStruct &&
        type == other.type &&
        explanation == other.explanation &&
        firebaseId == other.firebaseId &&
        percent == other.percent;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, explanation, firebaseId, percent]);
}

SearchItemStruct createSearchItemStruct({
  String? type,
  String? explanation,
  String? firebaseId,
  int? percent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchItemStruct(
      type: type,
      explanation: explanation,
      firebaseId: firebaseId,
      percent: percent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchItemStruct? updateSearchItemStruct(
  SearchItemStruct? searchItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchItemStructData(
  Map<String, dynamic> firestoreData,
  SearchItemStruct? searchItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchItem == null) {
    return;
  }
  if (searchItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchItemData = getSearchItemFirestoreData(searchItem, forFieldValue);
  final nestedData = searchItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = searchItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchItemFirestoreData(
  SearchItemStruct? searchItem, [
  bool forFieldValue = false,
]) {
  if (searchItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchItem.toMap());

  // Add any Firestore field values
  searchItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchItemListFirestoreData(
  List<SearchItemStruct>? searchItems,
) =>
    searchItems?.map((e) => getSearchItemFirestoreData(e, true)).toList() ?? [];
