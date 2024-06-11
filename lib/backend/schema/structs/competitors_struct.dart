// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompetitorsStruct extends FFFirebaseStruct {
  CompetitorsStruct({
    String? competitorName,
    List<CompetitorOptionsStruct>? options,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _competitorName = competitorName,
        _options = options,
        super(firestoreUtilData);

  // "competitorName" field.
  String? _competitorName;
  String get competitorName => _competitorName ?? '';
  set competitorName(String? val) => _competitorName = val;
  bool hasCompetitorName() => _competitorName != null;

  // "options" field.
  List<CompetitorOptionsStruct>? _options;
  List<CompetitorOptionsStruct> get options => _options ?? const [];
  set options(List<CompetitorOptionsStruct>? val) => _options = val;
  void updateOptions(Function(List<CompetitorOptionsStruct>) updateFn) =>
      updateFn(_options ??= []);
  bool hasOptions() => _options != null;

  static CompetitorsStruct fromMap(Map<String, dynamic> data) =>
      CompetitorsStruct(
        competitorName: data['competitorName'] as String?,
        options: getStructList(
          data['options'],
          CompetitorOptionsStruct.fromMap,
        ),
      );

  static CompetitorsStruct? maybeFromMap(dynamic data) => data is Map
      ? CompetitorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'competitorName': _competitorName,
        'options': _options?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'competitorName': serializeParam(
          _competitorName,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CompetitorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompetitorsStruct(
        competitorName: deserializeParam(
          data['competitorName'],
          ParamType.String,
          false,
        ),
        options: deserializeStructParam<CompetitorOptionsStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: CompetitorOptionsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CompetitorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CompetitorsStruct &&
        competitorName == other.competitorName &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode => const ListEquality().hash([competitorName, options]);
}

CompetitorsStruct createCompetitorsStruct({
  String? competitorName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompetitorsStruct(
      competitorName: competitorName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompetitorsStruct? updateCompetitorsStruct(
  CompetitorsStruct? competitors, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    competitors
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompetitorsStructData(
  Map<String, dynamic> firestoreData,
  CompetitorsStruct? competitors,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (competitors == null) {
    return;
  }
  if (competitors.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && competitors.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final competitorsData =
      getCompetitorsFirestoreData(competitors, forFieldValue);
  final nestedData =
      competitorsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = competitors.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompetitorsFirestoreData(
  CompetitorsStruct? competitors, [
  bool forFieldValue = false,
]) {
  if (competitors == null) {
    return {};
  }
  final firestoreData = mapToFirestore(competitors.toMap());

  // Add any Firestore field values
  competitors.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompetitorsListFirestoreData(
  List<CompetitorsStruct>? competitorss,
) =>
    competitorss?.map((e) => getCompetitorsFirestoreData(e, true)).toList() ??
    [];
