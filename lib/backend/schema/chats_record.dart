import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat_messages" field.
  List<ChatMessagesStruct>? _chatMessages;
  List<ChatMessagesStruct> get chatMessages => _chatMessages ?? const [];
  bool hasChatMessages() => _chatMessages != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "messages" field.
  List<String>? _messages;
  List<String> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "chat_type" field.
  String? _chatType;
  String get chatType => _chatType ?? '';
  bool hasChatType() => _chatType != null;

  void _initializeFields() {
    _chatMessages = getStructList(
      snapshotData['chat_messages'],
      ChatMessagesStruct.fromMap,
    );
    _users = getDataList(snapshotData['users']);
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _company = snapshotData['company'] as DocumentReference?;
    _product = snapshotData['product'] as DocumentReference?;
    _event = snapshotData['event'] as DocumentReference?;
    _messages = getDataList(snapshotData['messages']);
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _chatType = snapshotData['chat_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DateTime? lastMessageTime,
  String? type,
  DocumentReference? company,
  DocumentReference? product,
  DocumentReference? event,
  String? title,
  String? image,
  String? chatType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message_time': lastMessageTime,
      'type': type,
      'company': company,
      'product': product,
      'event': event,
      'title': title,
      'image': image,
      'chat_type': chatType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.chatMessages, e2?.chatMessages) &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.type == e2?.type &&
        e1?.company == e2?.company &&
        e1?.product == e2?.product &&
        e1?.event == e2?.event &&
        listEquality.equals(e1?.messages, e2?.messages) &&
        e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.chatType == e2?.chatType;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.chatMessages,
        e?.users,
        e?.lastMessageTime,
        e?.type,
        e?.company,
        e?.product,
        e?.event,
        e?.messages,
        e?.title,
        e?.image,
        e?.chatType
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
