import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiChatsRecord extends FirestoreRecord {
  AiChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "messages" field.
  List<ChatMessagesStruct>? _messages;
  List<ChatMessagesStruct> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _event = snapshotData['event'] as DocumentReference?;
    _product = snapshotData['product'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _messages = getStructList(
      snapshotData['messages'],
      ChatMessagesStruct.fromMap,
    );
    _company = snapshotData['company'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ai_chats');

  static Stream<AiChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AiChatsRecord.fromSnapshot(s));

  static Future<AiChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AiChatsRecord.fromSnapshot(s));

  static AiChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AiChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AiChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AiChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AiChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AiChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAiChatsRecordData({
  DocumentReference? user,
  DocumentReference? event,
  DocumentReference? product,
  String? type,
  DocumentReference? company,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'event': event,
      'product': product,
      'type': type,
      'company': company,
    }.withoutNulls,
  );

  return firestoreData;
}

class AiChatsRecordDocumentEquality implements Equality<AiChatsRecord> {
  const AiChatsRecordDocumentEquality();

  @override
  bool equals(AiChatsRecord? e1, AiChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.event == e2?.event &&
        e1?.product == e2?.product &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.messages, e2?.messages) &&
        e1?.company == e2?.company;
  }

  @override
  int hash(AiChatsRecord? e) => const ListEquality()
      .hash([e?.user, e?.event, e?.product, e?.type, e?.messages, e?.company]);

  @override
  bool isValidKey(Object? o) => o is AiChatsRecord;
}
