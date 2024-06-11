// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsStruct extends FFFirebaseStruct {
  NotificationsStruct({
    DocumentReference? user,
    DocumentReference? event,
    DocumentReference? company,
    DateTime? when,
    NotificationTypes? type,
    InvitesStruct? invite,
    bool? isSeen,
    String? id,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _event = event,
        _company = company,
        _when = when,
        _type = type,
        _invite = invite,
        _isSeen = isSeen,
        _id = id,
        _text = text,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  set event(DocumentReference? val) => _event = val;
  bool hasEvent() => _event != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  set company(DocumentReference? val) => _company = val;
  bool hasCompany() => _company != null;

  // "when" field.
  DateTime? _when;
  DateTime? get when => _when;
  set when(DateTime? val) => _when = val;
  bool hasWhen() => _when != null;

  // "type" field.
  NotificationTypes? _type;
  NotificationTypes get type => _type ?? NotificationTypes.team_invite;
  set type(NotificationTypes? val) => _type = val;
  bool hasType() => _type != null;

  // "invite" field.
  InvitesStruct? _invite;
  InvitesStruct get invite => _invite ?? InvitesStruct();
  set invite(InvitesStruct? val) => _invite = val;
  void updateInvite(Function(InvitesStruct) updateFn) =>
      updateFn(_invite ??= InvitesStruct());
  bool hasInvite() => _invite != null;

  // "isSeen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  set isSeen(bool? val) => _isSeen = val;
  bool hasIsSeen() => _isSeen != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  static NotificationsStruct fromMap(Map<String, dynamic> data) =>
      NotificationsStruct(
        user: data['user'] as DocumentReference?,
        event: data['event'] as DocumentReference?,
        company: data['company'] as DocumentReference?,
        when: data['when'] as DateTime?,
        type: deserializeEnum<NotificationTypes>(data['type']),
        invite: InvitesStruct.maybeFromMap(data['invite']),
        isSeen: data['isSeen'] as bool?,
        id: data['id'] as String?,
        text: data['text'] as String?,
      );

  static NotificationsStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'event': _event,
        'company': _company,
        'when': _when,
        'type': _type?.serialize(),
        'invite': _invite?.toMap(),
        'isSeen': _isSeen,
        'id': _id,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'event': serializeParam(
          _event,
          ParamType.DocumentReference,
        ),
        'company': serializeParam(
          _company,
          ParamType.DocumentReference,
        ),
        'when': serializeParam(
          _when,
          ParamType.DateTime,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'invite': serializeParam(
          _invite,
          ParamType.DataStruct,
        ),
        'isSeen': serializeParam(
          _isSeen,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationsStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        event: deserializeParam(
          data['event'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['events'],
        ),
        company: deserializeParam(
          data['company'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['projects'],
        ),
        when: deserializeParam(
          data['when'],
          ParamType.DateTime,
          false,
        ),
        type: deserializeParam<NotificationTypes>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        invite: deserializeStructParam(
          data['invite'],
          ParamType.DataStruct,
          false,
          structBuilder: InvitesStruct.fromSerializableMap,
        ),
        isSeen: deserializeParam(
          data['isSeen'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotificationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationsStruct &&
        user == other.user &&
        event == other.event &&
        company == other.company &&
        when == other.when &&
        type == other.type &&
        invite == other.invite &&
        isSeen == other.isSeen &&
        id == other.id &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([user, event, company, when, type, invite, isSeen, id, text]);
}

NotificationsStruct createNotificationsStruct({
  DocumentReference? user,
  DocumentReference? event,
  DocumentReference? company,
  DateTime? when,
  NotificationTypes? type,
  InvitesStruct? invite,
  bool? isSeen,
  String? id,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationsStruct(
      user: user,
      event: event,
      company: company,
      when: when,
      type: type,
      invite: invite ?? (clearUnsetFields ? InvitesStruct() : null),
      isSeen: isSeen,
      id: id,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationsStruct? updateNotificationsStruct(
  NotificationsStruct? notifications, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notifications
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationsStructData(
  Map<String, dynamic> firestoreData,
  NotificationsStruct? notifications,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notifications == null) {
    return;
  }
  if (notifications.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notifications.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationsData =
      getNotificationsFirestoreData(notifications, forFieldValue);
  final nestedData =
      notificationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notifications.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationsFirestoreData(
  NotificationsStruct? notifications, [
  bool forFieldValue = false,
]) {
  if (notifications == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notifications.toMap());

  // Handle nested data for "invite" field.
  addInvitesStructData(
    firestoreData,
    notifications.hasInvite() ? notifications.invite : null,
    'invite',
    forFieldValue,
  );

  // Add any Firestore field values
  notifications.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationsListFirestoreData(
  List<NotificationsStruct>? notificationss,
) =>
    notificationss
        ?.map((e) => getNotificationsFirestoreData(e, true))
        .toList() ??
    [];
