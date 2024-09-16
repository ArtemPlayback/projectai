// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamMemberStruct extends FFFirebaseStruct {
  TeamMemberStruct({
    String? role,
    String? description,
    TeamMemberStatus? teamMember,
    DocumentReference? user,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _role = role,
        _description = description,
        _teamMember = teamMember,
        _user = user,
        super(firestoreUtilData);

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

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  static TeamMemberStruct fromMap(Map<String, dynamic> data) =>
      TeamMemberStruct(
        role: data['role'] as String?,
        description: data['description'] as String?,
        teamMember: deserializeEnum<TeamMemberStatus>(data['team_member']),
        user: data['user'] as DocumentReference?,
      );

  static TeamMemberStruct? maybeFromMap(dynamic data) => data is Map
      ? TeamMemberStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'role': _role,
        'description': _description,
        'team_member': _teamMember?.serialize(),
        'user': _user,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static TeamMemberStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamMemberStruct(
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
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'TeamMemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamMemberStruct &&
        role == other.role &&
        description == other.description &&
        teamMember == other.teamMember &&
        user == other.user;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([role, description, teamMember, user]);
}

TeamMemberStruct createTeamMemberStruct({
  String? role,
  String? description,
  TeamMemberStatus? teamMember,
  DocumentReference? user,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamMemberStruct(
      role: role,
      description: description,
      teamMember: teamMember,
      user: user,
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
