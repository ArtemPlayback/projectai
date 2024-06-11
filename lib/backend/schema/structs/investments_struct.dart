// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvestmentsStruct extends FFFirebaseStruct {
  InvestmentsStruct({
    String? investmentFrom,
    String? invstmentsUpTo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _investmentFrom = investmentFrom,
        _invstmentsUpTo = invstmentsUpTo,
        super(firestoreUtilData);

  // "investmentFrom" field.
  String? _investmentFrom;
  String get investmentFrom => _investmentFrom ?? '';
  set investmentFrom(String? val) => _investmentFrom = val;
  bool hasInvestmentFrom() => _investmentFrom != null;

  // "invstmentsUpTo" field.
  String? _invstmentsUpTo;
  String get invstmentsUpTo => _invstmentsUpTo ?? '';
  set invstmentsUpTo(String? val) => _invstmentsUpTo = val;
  bool hasInvstmentsUpTo() => _invstmentsUpTo != null;

  static InvestmentsStruct fromMap(Map<String, dynamic> data) =>
      InvestmentsStruct(
        investmentFrom: data['investmentFrom'] as String?,
        invstmentsUpTo: data['invstmentsUpTo'] as String?,
      );

  static InvestmentsStruct? maybeFromMap(dynamic data) => data is Map
      ? InvestmentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'investmentFrom': _investmentFrom,
        'invstmentsUpTo': _invstmentsUpTo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'investmentFrom': serializeParam(
          _investmentFrom,
          ParamType.String,
        ),
        'invstmentsUpTo': serializeParam(
          _invstmentsUpTo,
          ParamType.String,
        ),
      }.withoutNulls;

  static InvestmentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvestmentsStruct(
        investmentFrom: deserializeParam(
          data['investmentFrom'],
          ParamType.String,
          false,
        ),
        invstmentsUpTo: deserializeParam(
          data['invstmentsUpTo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InvestmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvestmentsStruct &&
        investmentFrom == other.investmentFrom &&
        invstmentsUpTo == other.invstmentsUpTo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([investmentFrom, invstmentsUpTo]);
}

InvestmentsStruct createInvestmentsStruct({
  String? investmentFrom,
  String? invstmentsUpTo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvestmentsStruct(
      investmentFrom: investmentFrom,
      invstmentsUpTo: invstmentsUpTo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvestmentsStruct? updateInvestmentsStruct(
  InvestmentsStruct? investments, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    investments
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvestmentsStructData(
  Map<String, dynamic> firestoreData,
  InvestmentsStruct? investments,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (investments == null) {
    return;
  }
  if (investments.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && investments.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final investmentsData =
      getInvestmentsFirestoreData(investments, forFieldValue);
  final nestedData =
      investmentsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = investments.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvestmentsFirestoreData(
  InvestmentsStruct? investments, [
  bool forFieldValue = false,
]) {
  if (investments == null) {
    return {};
  }
  final firestoreData = mapToFirestore(investments.toMap());

  // Add any Firestore field values
  investments.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvestmentsListFirestoreData(
  List<InvestmentsStruct>? investmentss,
) =>
    investmentss?.map((e) => getInvestmentsFirestoreData(e, true)).toList() ??
    [];
