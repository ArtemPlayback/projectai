// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamMemberStruct extends FFFirebaseStruct {
  TeamMemberStruct({
    DocumentReference? userReference,
    String? role,
    String? description,
    TeamMemberStatus? teamMember,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userReference = userReference,
        _role = role,
        _description = description,
        _teamMember = teamMember,
        super(firestoreUtilData);

  // "user_reference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  set userReference(DocumentReference? val) => _userReference = val;
  bool hasUserReference() => _userReference != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "team_member" field.
  TeamMemberStatus? _teamMember;
  TeamMemberStatus get teamMember => _teamMember ?? TeamMemberStatus.isWaiting;
  set teamMember(TeamMemberStatus? val) => _teamMember = val;
  bool hasTeamMember() => _teamMember != null;

  static TeamMemberStruct fromMap(Map<String, dynamic> data) =>
      TeamMemberStruct(
        userReference: data['user_reference'] as DocumentReference?,
        role: data['role'] as String?,
        description: data['description'] as String?,
        teamMember: deserializeEnum<TeamMemberStatus>(data['team_member']),
      );

  static TeamMemberStruct? maybeFromMap(dynamic data) => data is Map
      ? TeamMemberStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_reference': _userReference,
        'role': _role,
        'description': _description,
        'team_member': _teamMember?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_reference': serializeParam(
          _userReference,
          ParamType.DocumentReference,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'team_member': serializeParam(
          _teamMember,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static TeamMemberStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamMemberStruct(
        userReference: deserializeParam(
          data['user_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        teamMember: deserializeParam<TeamMemberStatus>(
          data['team_member'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'TeamMemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamMemberStruct &&
        userReference == other.userReference &&
        role == other.role &&
        description == other.description &&
        teamMember == other.teamMember;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userReference, role, description, teamMember]);
}

TeamMemberStruct createTeamMemberStruct({
  DocumentReference? userReference,
  String? role,
  String? description,
  TeamMemberStatus? teamMember,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamMemberStruct(
      userReference: userReference,
      role: role,
      description: description,
      teamMember: teamMember,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamMemberStruct? updateTeamMemberStruct(
  TeamMemberStruct? teamMemberStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teamMemberStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamMemberStructData(
  Map<String, dynamic> firestoreData,
  TeamMemberStruct? teamMemberStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teamMemberStruct == null) {
    return;
  }
  if (teamMemberStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && teamMemberStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamMemberStructData =
      getTeamMemberFirestoreData(teamMemberStruct, forFieldValue);
  final nestedData =
      teamMemberStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = teamMemberStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamMemberFirestoreData(
  TeamMemberStruct? teamMemberStruct, [
  bool forFieldValue = false,
]) {
  if (teamMemberStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teamMemberStruct.toMap());

  // Add any Firestore field values
  teamMemberStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamMemberListFirestoreData(
  List<TeamMemberStruct>? teamMemberStructs,
) =>
    teamMemberStructs
        ?.map((e) => getTeamMemberFirestoreData(e, true))
        .toList() ??
    [];
