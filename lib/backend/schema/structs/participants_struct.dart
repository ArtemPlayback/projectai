// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParticipantsStruct extends FFFirebaseStruct {
  ParticipantsStruct({
    DocumentReference? user,
    DateTime? when,
    bool? applied,
    bool? joined,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _when = when,
        _applied = applied,
        _joined = joined,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "when" field.
  DateTime? _when;
  DateTime? get when => _when;
  set when(DateTime? val) => _when = val;

  bool hasWhen() => _when != null;

  // "applied" field.
  bool? _applied;
  bool get applied => _applied ?? false;
  set applied(bool? val) => _applied = val;

  bool hasApplied() => _applied != null;

  // "joined" field.
  bool? _joined;
  bool get joined => _joined ?? false;
  set joined(bool? val) => _joined = val;

  bool hasJoined() => _joined != null;

  static ParticipantsStruct fromMap(Map<String, dynamic> data) =>
      ParticipantsStruct(
        user: data['user'] as DocumentReference?,
        when: data['when'] as DateTime?,
        applied: data['applied'] as bool?,
        joined: data['joined'] as bool?,
      );

  static ParticipantsStruct? maybeFromMap(dynamic data) => data is Map
      ? ParticipantsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'when': _when,
        'applied': _applied,
        'joined': _joined,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'when': serializeParam(
          _when,
          ParamType.DateTime,
        ),
        'applied': serializeParam(
          _applied,
          ParamType.bool,
        ),
        'joined': serializeParam(
          _joined,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ParticipantsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParticipantsStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        when: deserializeParam(
          data['when'],
          ParamType.DateTime,
          false,
        ),
        applied: deserializeParam(
          data['applied'],
          ParamType.bool,
          false,
        ),
        joined: deserializeParam(
          data['joined'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ParticipantsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParticipantsStruct &&
        user == other.user &&
        when == other.when &&
        applied == other.applied &&
        joined == other.joined;
  }

  @override
  int get hashCode => const ListEquality().hash([user, when, applied, joined]);
}

ParticipantsStruct createParticipantsStruct({
  DocumentReference? user,
  DateTime? when,
  bool? applied,
  bool? joined,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParticipantsStruct(
      user: user,
      when: when,
      applied: applied,
      joined: joined,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParticipantsStruct? updateParticipantsStruct(
  ParticipantsStruct? participants, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    participants
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParticipantsStructData(
  Map<String, dynamic> firestoreData,
  ParticipantsStruct? participants,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (participants == null) {
    return;
  }
  if (participants.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && participants.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final participantsData =
      getParticipantsFirestoreData(participants, forFieldValue);
  final nestedData =
      participantsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = participants.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParticipantsFirestoreData(
  ParticipantsStruct? participants, [
  bool forFieldValue = false,
]) {
  if (participants == null) {
    return {};
  }
  final firestoreData = mapToFirestore(participants.toMap());

  // Add any Firestore field values
  participants.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParticipantsListFirestoreData(
  List<ParticipantsStruct>? participantss,
) =>
    participantss?.map((e) => getParticipantsFirestoreData(e, true)).toList() ??
    [];
