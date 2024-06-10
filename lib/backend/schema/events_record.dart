import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_info" field.
  EventStruct? _eventInfo;
  EventStruct get eventInfo => _eventInfo ?? EventStruct();
  bool hasEventInfo() => _eventInfo != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "project" field.
  DocumentReference? _project;
  DocumentReference? get project => _project;
  bool hasProject() => _project != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "isFinished" field.
  bool? _isFinished;
  bool get isFinished => _isFinished ?? false;
  bool hasIsFinished() => _isFinished != null;

  // "custom_id" field.
  String? _customId;
  String get customId => _customId ?? '';
  bool hasCustomId() => _customId != null;

  // "participant_users" field.
  List<ParticipantsStruct>? _participantUsers;
  List<ParticipantsStruct> get participantUsers =>
      _participantUsers ?? const [];
  bool hasParticipantUsers() => _participantUsers != null;

  // "users_applied_to_join" field.
  List<ParticipantsStruct>? _usersAppliedToJoin;
  List<ParticipantsStruct> get usersAppliedToJoin =>
      _usersAppliedToJoin ?? const [];
  bool hasUsersAppliedToJoin() => _usersAppliedToJoin != null;

  void _initializeFields() {
    _eventInfo = EventStruct.maybeFromMap(snapshotData['event_info']);
    _user = snapshotData['user'] as DocumentReference?;
    _project = snapshotData['project'] as DocumentReference?;
    _participants = getDataList(snapshotData['participants']);
    _isFinished = snapshotData['isFinished'] as bool?;
    _customId = snapshotData['custom_id'] as String?;
    _participantUsers = getStructList(
      snapshotData['participant_users'],
      ParticipantsStruct.fromMap,
    );
    _usersAppliedToJoin = getStructList(
      snapshotData['users_applied_to_join'],
      ParticipantsStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  EventStruct? eventInfo,
  DocumentReference? user,
  DocumentReference? project,
  bool? isFinished,
  String? customId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_info': EventStruct().toMap(),
      'user': user,
      'project': project,
      'isFinished': isFinished,
      'custom_id': customId,
    }.withoutNulls,
  );

  // Handle nested data for "event_info" field.
  addEventStructData(firestoreData, eventInfo, 'event_info');

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventInfo == e2?.eventInfo &&
        e1?.user == e2?.user &&
        e1?.project == e2?.project &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.isFinished == e2?.isFinished &&
        e1?.customId == e2?.customId &&
        listEquality.equals(e1?.participantUsers, e2?.participantUsers) &&
        listEquality.equals(e1?.usersAppliedToJoin, e2?.usersAppliedToJoin);
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.eventInfo,
        e?.user,
        e?.project,
        e?.participants,
        e?.isFinished,
        e?.customId,
        e?.participantUsers,
        e?.usersAppliedToJoin
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
