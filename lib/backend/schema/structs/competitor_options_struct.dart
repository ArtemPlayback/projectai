// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompetitorOptionsStruct extends FFFirebaseStruct {
  CompetitorOptionsStruct({
    String? option,
    bool? presence,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _option = option,
        _presence = presence,
        super(firestoreUtilData);

  // "option" field.
  String? _option;
  String get option => _option ?? '';
  set option(String? val) => _option = val;
  bool hasOption() => _option != null;

  // "presence" field.
  bool? _presence;
  bool get presence => _presence ?? false;
  set presence(bool? val) => _presence = val;
  bool hasPresence() => _presence != null;

  static CompetitorOptionsStruct fromMap(Map<String, dynamic> data) =>
      CompetitorOptionsStruct(
        option: data['option'] as String?,
        presence: data['presence'] as bool?,
      );

  static CompetitorOptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? CompetitorOptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'option': _option,
        'presence': _presence,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'option': serializeParam(
          _option,
          ParamType.String,
        ),
        'presence': serializeParam(
          _presence,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CompetitorOptionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CompetitorOptionsStruct(
        option: deserializeParam(
          data['option'],
          ParamType.String,
          false,
        ),
        presence: deserializeParam(
          data['presence'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CompetitorOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompetitorOptionsStruct &&
        option == other.option &&
        presence == other.presence;
  }

  @override
  int get hashCode => const ListEquality().hash([option, presence]);
}

CompetitorOptionsStruct createCompetitorOptionsStruct({
  String? option,
  bool? presence,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompetitorOptionsStruct(
      option: option,
      presence: presence,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompetitorOptionsStruct? updateCompetitorOptionsStruct(
  CompetitorOptionsStruct? competitorOptions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    competitorOptions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompetitorOptionsStructData(
  Map<String, dynamic> firestoreData,
  CompetitorOptionsStruct? competitorOptions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (competitorOptions == null) {
    return;
  }
  if (competitorOptions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && competitorOptions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final competitorOptionsData =
      getCompetitorOptionsFirestoreData(competitorOptions, forFieldValue);
  final nestedData =
      competitorOptionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = competitorOptions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompetitorOptionsFirestoreData(
  CompetitorOptionsStruct? competitorOptions, [
  bool forFieldValue = false,
]) {
  if (competitorOptions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(competitorOptions.toMap());

  // Add any Firestore field values
  competitorOptions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompetitorOptionsListFirestoreData(
  List<CompetitorOptionsStruct>? competitorOptionss,
) =>
    competitorOptionss
        ?.map((e) => getCompetitorOptionsFirestoreData(e, true))
        .toList() ??
    [];
