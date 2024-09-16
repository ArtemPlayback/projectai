// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SmartsearchSessionStruct extends FFFirebaseStruct {
  SmartsearchSessionStruct({
    String? title,
    List<SmartSearchStruct>? smartsearchItems,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _smartsearchItems = smartsearchItems,
        _id = id,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "smartsearch_items" field.
  List<SmartSearchStruct>? _smartsearchItems;
  List<SmartSearchStruct> get smartsearchItems => _smartsearchItems ?? const [];
  set smartsearchItems(List<SmartSearchStruct>? val) => _smartsearchItems = val;

  void updateSmartsearchItems(Function(List<SmartSearchStruct>) updateFn) {
    updateFn(_smartsearchItems ??= []);
  }

  bool hasSmartsearchItems() => _smartsearchItems != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static SmartsearchSessionStruct fromMap(Map<String, dynamic> data) =>
      SmartsearchSessionStruct(
        title: data['title'] as String?,
        smartsearchItems: getStructList(
          data['smartsearch_items'],
          SmartSearchStruct.fromMap,
        ),
        id: data['id'] as String?,
      );

  static SmartsearchSessionStruct? maybeFromMap(dynamic data) => data is Map
      ? SmartsearchSessionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'smartsearch_items': _smartsearchItems?.map((e) => e.toMap()).toList(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'smartsearch_items': serializeParam(
          _smartsearchItems,
          ParamType.DataStruct,
          isList: true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static SmartsearchSessionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SmartsearchSessionStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        smartsearchItems: deserializeStructParam<SmartSearchStruct>(
          data['smartsearch_items'],
          ParamType.DataStruct,
          true,
          structBuilder: SmartSearchStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SmartsearchSessionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SmartsearchSessionStruct &&
        title == other.title &&
        listEquality.equals(smartsearchItems, other.smartsearchItems) &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([title, smartsearchItems, id]);
}

SmartsearchSessionStruct createSmartsearchSessionStruct({
  String? title,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SmartsearchSessionStruct(
      title: title,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SmartsearchSessionStruct? updateSmartsearchSessionStruct(
  SmartsearchSessionStruct? smartsearchSession, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    smartsearchSession
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSmartsearchSessionStructData(
  Map<String, dynamic> firestoreData,
  SmartsearchSessionStruct? smartsearchSession,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (smartsearchSession == null) {
    return;
  }
  if (smartsearchSession.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && smartsearchSession.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final smartsearchSessionData =
      getSmartsearchSessionFirestoreData(smartsearchSession, forFieldValue);
  final nestedData =
      smartsearchSessionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      smartsearchSession.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSmartsearchSessionFirestoreData(
  SmartsearchSessionStruct? smartsearchSession, [
  bool forFieldValue = false,
]) {
  if (smartsearchSession == null) {
    return {};
  }
  final firestoreData = mapToFirestore(smartsearchSession.toMap());

  // Add any Firestore field values
  smartsearchSession.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSmartsearchSessionListFirestoreData(
  List<SmartsearchSessionStruct>? smartsearchSessions,
) =>
    smartsearchSessions
        ?.map((e) => getSmartsearchSessionFirestoreData(e, true))
        .toList() ??
    [];
