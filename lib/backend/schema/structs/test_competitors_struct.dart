// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestCompetitorsStruct extends FFFirebaseStruct {
  TestCompetitorsStruct({
    String? title,
    String? advantages,
    String? disadvantages,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _advantages = advantages,
        _disadvantages = disadvantages,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "advantages" field.
  String? _advantages;
  String get advantages => _advantages ?? '';
  set advantages(String? val) => _advantages = val;
  bool hasAdvantages() => _advantages != null;

  // "disadvantages" field.
  String? _disadvantages;
  String get disadvantages => _disadvantages ?? '';
  set disadvantages(String? val) => _disadvantages = val;
  bool hasDisadvantages() => _disadvantages != null;

  static TestCompetitorsStruct fromMap(Map<String, dynamic> data) =>
      TestCompetitorsStruct(
        title: data['title'] as String?,
        advantages: data['advantages'] as String?,
        disadvantages: data['disadvantages'] as String?,
      );

  static TestCompetitorsStruct? maybeFromMap(dynamic data) => data is Map
      ? TestCompetitorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'advantages': _advantages,
        'disadvantages': _disadvantages,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'advantages': serializeParam(
          _advantages,
          ParamType.String,
        ),
        'disadvantages': serializeParam(
          _disadvantages,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestCompetitorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestCompetitorsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        advantages: deserializeParam(
          data['advantages'],
          ParamType.String,
          false,
        ),
        disadvantages: deserializeParam(
          data['disadvantages'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestCompetitorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestCompetitorsStruct &&
        title == other.title &&
        advantages == other.advantages &&
        disadvantages == other.disadvantages;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, advantages, disadvantages]);
}

TestCompetitorsStruct createTestCompetitorsStruct({
  String? title,
  String? advantages,
  String? disadvantages,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestCompetitorsStruct(
      title: title,
      advantages: advantages,
      disadvantages: disadvantages,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestCompetitorsStruct? updateTestCompetitorsStruct(
  TestCompetitorsStruct? testCompetitors, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    testCompetitors
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestCompetitorsStructData(
  Map<String, dynamic> firestoreData,
  TestCompetitorsStruct? testCompetitors,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (testCompetitors == null) {
    return;
  }
  if (testCompetitors.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && testCompetitors.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testCompetitorsData =
      getTestCompetitorsFirestoreData(testCompetitors, forFieldValue);
  final nestedData =
      testCompetitorsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = testCompetitors.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestCompetitorsFirestoreData(
  TestCompetitorsStruct? testCompetitors, [
  bool forFieldValue = false,
]) {
  if (testCompetitors == null) {
    return {};
  }
  final firestoreData = mapToFirestore(testCompetitors.toMap());

  // Add any Firestore field values
  testCompetitors.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestCompetitorsListFirestoreData(
  List<TestCompetitorsStruct>? testCompetitorss,
) =>
    testCompetitorss
        ?.map((e) => getTestCompetitorsFirestoreData(e, true))
        .toList() ??
    [];
