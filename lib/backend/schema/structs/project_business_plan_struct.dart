// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectBusinessPlanStruct extends FFFirebaseStruct {
  ProjectBusinessPlanStruct({
    String? monetization,
    String? marketingPlan,
    String? goal,
    String? financialPlan,
    String? marketSize,
    String? productionPlan,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _monetization = monetization,
        _marketingPlan = marketingPlan,
        _goal = goal,
        _financialPlan = financialPlan,
        _marketSize = marketSize,
        _productionPlan = productionPlan,
        super(firestoreUtilData);

  // "monetization" field.
  String? _monetization;
  String get monetization => _monetization ?? '';
  set monetization(String? val) => _monetization = val;
  bool hasMonetization() => _monetization != null;

  // "marketingPlan" field.
  String? _marketingPlan;
  String get marketingPlan => _marketingPlan ?? '';
  set marketingPlan(String? val) => _marketingPlan = val;
  bool hasMarketingPlan() => _marketingPlan != null;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  set goal(String? val) => _goal = val;
  bool hasGoal() => _goal != null;

  // "financialPlan" field.
  String? _financialPlan;
  String get financialPlan => _financialPlan ?? '';
  set financialPlan(String? val) => _financialPlan = val;
  bool hasFinancialPlan() => _financialPlan != null;

  // "marketSize" field.
  String? _marketSize;
  String get marketSize => _marketSize ?? '';
  set marketSize(String? val) => _marketSize = val;
  bool hasMarketSize() => _marketSize != null;

  // "productionPlan" field.
  String? _productionPlan;
  String get productionPlan => _productionPlan ?? '';
  set productionPlan(String? val) => _productionPlan = val;
  bool hasProductionPlan() => _productionPlan != null;

  static ProjectBusinessPlanStruct fromMap(Map<String, dynamic> data) =>
      ProjectBusinessPlanStruct(
        monetization: data['monetization'] as String?,
        marketingPlan: data['marketingPlan'] as String?,
        goal: data['goal'] as String?,
        financialPlan: data['financialPlan'] as String?,
        marketSize: data['marketSize'] as String?,
        productionPlan: data['productionPlan'] as String?,
      );

  static ProjectBusinessPlanStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectBusinessPlanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'monetization': _monetization,
        'marketingPlan': _marketingPlan,
        'goal': _goal,
        'financialPlan': _financialPlan,
        'marketSize': _marketSize,
        'productionPlan': _productionPlan,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'monetization': serializeParam(
          _monetization,
          ParamType.String,
        ),
        'marketingPlan': serializeParam(
          _marketingPlan,
          ParamType.String,
        ),
        'goal': serializeParam(
          _goal,
          ParamType.String,
        ),
        'financialPlan': serializeParam(
          _financialPlan,
          ParamType.String,
        ),
        'marketSize': serializeParam(
          _marketSize,
          ParamType.String,
        ),
        'productionPlan': serializeParam(
          _productionPlan,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProjectBusinessPlanStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProjectBusinessPlanStruct(
        monetization: deserializeParam(
          data['monetization'],
          ParamType.String,
          false,
        ),
        marketingPlan: deserializeParam(
          data['marketingPlan'],
          ParamType.String,
          false,
        ),
        goal: deserializeParam(
          data['goal'],
          ParamType.String,
          false,
        ),
        financialPlan: deserializeParam(
          data['financialPlan'],
          ParamType.String,
          false,
        ),
        marketSize: deserializeParam(
          data['marketSize'],
          ParamType.String,
          false,
        ),
        productionPlan: deserializeParam(
          data['productionPlan'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProjectBusinessPlanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectBusinessPlanStruct &&
        monetization == other.monetization &&
        marketingPlan == other.marketingPlan &&
        goal == other.goal &&
        financialPlan == other.financialPlan &&
        marketSize == other.marketSize &&
        productionPlan == other.productionPlan;
  }

  @override
  int get hashCode => const ListEquality().hash([
        monetization,
        marketingPlan,
        goal,
        financialPlan,
        marketSize,
        productionPlan
      ]);
}

ProjectBusinessPlanStruct createProjectBusinessPlanStruct({
  String? monetization,
  String? marketingPlan,
  String? goal,
  String? financialPlan,
  String? marketSize,
  String? productionPlan,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectBusinessPlanStruct(
      monetization: monetization,
      marketingPlan: marketingPlan,
      goal: goal,
      financialPlan: financialPlan,
      marketSize: marketSize,
      productionPlan: productionPlan,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectBusinessPlanStruct? updateProjectBusinessPlanStruct(
  ProjectBusinessPlanStruct? projectBusinessPlan, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectBusinessPlan
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectBusinessPlanStructData(
  Map<String, dynamic> firestoreData,
  ProjectBusinessPlanStruct? projectBusinessPlan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectBusinessPlan == null) {
    return;
  }
  if (projectBusinessPlan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && projectBusinessPlan.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectBusinessPlanData =
      getProjectBusinessPlanFirestoreData(projectBusinessPlan, forFieldValue);
  final nestedData =
      projectBusinessPlanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      projectBusinessPlan.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectBusinessPlanFirestoreData(
  ProjectBusinessPlanStruct? projectBusinessPlan, [
  bool forFieldValue = false,
]) {
  if (projectBusinessPlan == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectBusinessPlan.toMap());

  // Add any Firestore field values
  projectBusinessPlan.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectBusinessPlanListFirestoreData(
  List<ProjectBusinessPlanStruct>? projectBusinessPlans,
) =>
    projectBusinessPlans
        ?.map((e) => getProjectBusinessPlanFirestoreData(e, true))
        .toList() ??
    [];
