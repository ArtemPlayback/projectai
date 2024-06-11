// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectInformationStruct extends FFFirebaseStruct {
  ProjectInformationStruct({
    String? description,
    String? shortDescription,
    String? problemSolvation,
    String? consumers,
    String? iTproductFormat,
    String? potentialDevelopment,
    String? promotion,
    String? status,
    String? businessArea,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _shortDescription = shortDescription,
        _problemSolvation = problemSolvation,
        _consumers = consumers,
        _iTproductFormat = iTproductFormat,
        _potentialDevelopment = potentialDevelopment,
        _promotion = promotion,
        _status = status,
        _businessArea = businessArea,
        super(firestoreUtilData);

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "short_description" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  set shortDescription(String? val) => _shortDescription = val;
  bool hasShortDescription() => _shortDescription != null;

  // "problemSolvation" field.
  String? _problemSolvation;
  String get problemSolvation => _problemSolvation ?? '';
  set problemSolvation(String? val) => _problemSolvation = val;
  bool hasProblemSolvation() => _problemSolvation != null;

  // "consumers" field.
  String? _consumers;
  String get consumers => _consumers ?? '';
  set consumers(String? val) => _consumers = val;
  bool hasConsumers() => _consumers != null;

  // "ITproductFormat" field.
  String? _iTproductFormat;
  String get iTproductFormat => _iTproductFormat ?? '';
  set iTproductFormat(String? val) => _iTproductFormat = val;
  bool hasITproductFormat() => _iTproductFormat != null;

  // "potentialDevelopment" field.
  String? _potentialDevelopment;
  String get potentialDevelopment => _potentialDevelopment ?? '';
  set potentialDevelopment(String? val) => _potentialDevelopment = val;
  bool hasPotentialDevelopment() => _potentialDevelopment != null;

  // "promotion" field.
  String? _promotion;
  String get promotion => _promotion ?? '';
  set promotion(String? val) => _promotion = val;
  bool hasPromotion() => _promotion != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "businessArea" field.
  String? _businessArea;
  String get businessArea => _businessArea ?? '';
  set businessArea(String? val) => _businessArea = val;
  bool hasBusinessArea() => _businessArea != null;

  static ProjectInformationStruct fromMap(Map<String, dynamic> data) =>
      ProjectInformationStruct(
        description: data['description'] as String?,
        shortDescription: data['short_description'] as String?,
        problemSolvation: data['problemSolvation'] as String?,
        consumers: data['consumers'] as String?,
        iTproductFormat: data['ITproductFormat'] as String?,
        potentialDevelopment: data['potentialDevelopment'] as String?,
        promotion: data['promotion'] as String?,
        status: data['status'] as String?,
        businessArea: data['businessArea'] as String?,
      );

  static ProjectInformationStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectInformationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'description': _description,
        'short_description': _shortDescription,
        'problemSolvation': _problemSolvation,
        'consumers': _consumers,
        'ITproductFormat': _iTproductFormat,
        'potentialDevelopment': _potentialDevelopment,
        'promotion': _promotion,
        'status': _status,
        'businessArea': _businessArea,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'short_description': serializeParam(
          _shortDescription,
          ParamType.String,
        ),
        'problemSolvation': serializeParam(
          _problemSolvation,
          ParamType.String,
        ),
        'consumers': serializeParam(
          _consumers,
          ParamType.String,
        ),
        'ITproductFormat': serializeParam(
          _iTproductFormat,
          ParamType.String,
        ),
        'potentialDevelopment': serializeParam(
          _potentialDevelopment,
          ParamType.String,
        ),
        'promotion': serializeParam(
          _promotion,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'businessArea': serializeParam(
          _businessArea,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProjectInformationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProjectInformationStruct(
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        shortDescription: deserializeParam(
          data['short_description'],
          ParamType.String,
          false,
        ),
        problemSolvation: deserializeParam(
          data['problemSolvation'],
          ParamType.String,
          false,
        ),
        consumers: deserializeParam(
          data['consumers'],
          ParamType.String,
          false,
        ),
        iTproductFormat: deserializeParam(
          data['ITproductFormat'],
          ParamType.String,
          false,
        ),
        potentialDevelopment: deserializeParam(
          data['potentialDevelopment'],
          ParamType.String,
          false,
        ),
        promotion: deserializeParam(
          data['promotion'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        businessArea: deserializeParam(
          data['businessArea'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProjectInformationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectInformationStruct &&
        description == other.description &&
        shortDescription == other.shortDescription &&
        problemSolvation == other.problemSolvation &&
        consumers == other.consumers &&
        iTproductFormat == other.iTproductFormat &&
        potentialDevelopment == other.potentialDevelopment &&
        promotion == other.promotion &&
        status == other.status &&
        businessArea == other.businessArea;
  }

  @override
  int get hashCode => const ListEquality().hash([
        description,
        shortDescription,
        problemSolvation,
        consumers,
        iTproductFormat,
        potentialDevelopment,
        promotion,
        status,
        businessArea
      ]);
}

ProjectInformationStruct createProjectInformationStruct({
  String? description,
  String? shortDescription,
  String? problemSolvation,
  String? consumers,
  String? iTproductFormat,
  String? potentialDevelopment,
  String? promotion,
  String? status,
  String? businessArea,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectInformationStruct(
      description: description,
      shortDescription: shortDescription,
      problemSolvation: problemSolvation,
      consumers: consumers,
      iTproductFormat: iTproductFormat,
      potentialDevelopment: potentialDevelopment,
      promotion: promotion,
      status: status,
      businessArea: businessArea,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectInformationStruct? updateProjectInformationStruct(
  ProjectInformationStruct? projectInformation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectInformation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectInformationStructData(
  Map<String, dynamic> firestoreData,
  ProjectInformationStruct? projectInformation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectInformation == null) {
    return;
  }
  if (projectInformation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && projectInformation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectInformationData =
      getProjectInformationFirestoreData(projectInformation, forFieldValue);
  final nestedData =
      projectInformationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      projectInformation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectInformationFirestoreData(
  ProjectInformationStruct? projectInformation, [
  bool forFieldValue = false,
]) {
  if (projectInformation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectInformation.toMap());

  // Add any Firestore field values
  projectInformation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectInformationListFirestoreData(
  List<ProjectInformationStruct>? projectInformations,
) =>
    projectInformations
        ?.map((e) => getProjectInformationFirestoreData(e, true))
        .toList() ??
    [];
