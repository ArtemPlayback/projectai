// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvitesStruct extends FFFirebaseStruct {
  InvitesStruct({
    DocumentReference? who,
    DocumentReference? where,
    String? role,
    DateTime? when,
    String? inviterName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _who = who,
        _where = where,
        _role = role,
        _when = when,
        _inviterName = inviterName,
        super(firestoreUtilData);

  // "who" field.
  DocumentReference? _who;
  DocumentReference? get who => _who;
  set who(DocumentReference? val) => _who = val;
  bool hasWho() => _who != null;

  // "where" field.
  DocumentReference? _where;
  DocumentReference? get where => _where;
  set where(DocumentReference? val) => _where = val;
  bool hasWhere() => _where != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  // "when" field.
  DateTime? _when;
  DateTime? get when => _when;
  set when(DateTime? val) => _when = val;
  bool hasWhen() => _when != null;

  // "inviterName" field.
  String? _inviterName;
  String get inviterName => _inviterName ?? '';
  set inviterName(String? val) => _inviterName = val;
  bool hasInviterName() => _inviterName != null;

  static InvitesStruct fromMap(Map<String, dynamic> data) => InvitesStruct(
        who: data['who'] as DocumentReference?,
        where: data['where'] as DocumentReference?,
        role: data['role'] as String?,
        when: data['when'] as DateTime?,
        inviterName: data['inviterName'] as String?,
      );

  static InvitesStruct? maybeFromMap(dynamic data) =>
      data is Map ? InvitesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'who': _who,
        'where': _where,
        'role': _role,
        'when': _when,
        'inviterName': _inviterName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'who': serializeParam(
          _who,
          ParamType.DocumentReference,
        ),
        'where': serializeParam(
          _where,
          ParamType.DocumentReference,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'when': serializeParam(
          _when,
          ParamType.DateTime,
        ),
        'inviterName': serializeParam(
          _inviterName,
          ParamType.String,
        ),
      }.withoutNulls;

  static InvitesStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvitesStruct(
        who: deserializeParam(
          data['who'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        where: deserializeParam(
          data['where'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['projects'],
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        when: deserializeParam(
          data['when'],
          ParamType.DateTime,
          false,
        ),
        inviterName: deserializeParam(
          data['inviterName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InvitesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvitesStruct &&
        who == other.who &&
        where == other.where &&
        role == other.role &&
        when == other.when &&
        inviterName == other.inviterName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([who, where, role, when, inviterName]);
}

InvitesStruct createInvitesStruct({
  DocumentReference? who,
  DocumentReference? where,
  String? role,
  DateTime? when,
  String? inviterName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvitesStruct(
      who: who,
      where: where,
      role: role,
      when: when,
      inviterName: inviterName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvitesStruct? updateInvitesStruct(
  InvitesStruct? invites, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    invites
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvitesStructData(
  Map<String, dynamic> firestoreData,
  InvitesStruct? invites,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (invites == null) {
    return;
  }
  if (invites.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && invites.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final invitesData = getInvitesFirestoreData(invites, forFieldValue);
  final nestedData = invitesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = invites.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvitesFirestoreData(
  InvitesStruct? invites, [
  bool forFieldValue = false,
]) {
  if (invites == null) {
    return {};
  }
  final firestoreData = mapToFirestore(invites.toMap());

  // Add any Firestore field values
  invites.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvitesListFirestoreData(
  List<InvitesStruct>? invitess,
) =>
    invitess?.map((e) => getInvitesFirestoreData(e, true)).toList() ?? [];
