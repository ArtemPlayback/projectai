import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "projects" field.
  List<DocumentReference>? _projects;
  List<DocumentReference> get projects => _projects ?? const [];
  bool hasProjects() => _projects != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "invites" field.
  List<InvitesStruct>? _invites;
  List<InvitesStruct> get invites => _invites ?? const [];
  bool hasInvites() => _invites != null;

  // "haveChatWith" field.
  List<DocumentReference>? _haveChatWith;
  List<DocumentReference> get haveChatWith => _haveChatWith ?? const [];
  bool hasHaveChatWith() => _haveChatWith != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "blockedUsers" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "smartSearchHistory" field.
  List<SmartSearchStruct>? _smartSearchHistory;
  List<SmartSearchStruct> get smartSearchHistory =>
      _smartSearchHistory ?? const [];
  bool hasSmartSearchHistory() => _smartSearchHistory != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "products" field.
  List<DocumentReference>? _products;
  List<DocumentReference> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  // "events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "sections" field.
  List<SectionStruct>? _sections;
  List<SectionStruct> get sections => _sections ?? const [];
  bool hasSections() => _sections != null;

  // "pushNotifications" field.
  bool? _pushNotifications;
  bool get pushNotifications => _pushNotifications ?? false;
  bool hasPushNotifications() => _pushNotifications != null;

  // "professional_information" field.
  String? _professionalInformation;
  String get professionalInformation => _professionalInformation ?? '';
  bool hasProfessionalInformation() => _professionalInformation != null;

  // "subscriptions" field.
  List<SubscriptionsStruct>? _subscriptions;
  List<SubscriptionsStruct> get subscriptions => _subscriptions ?? const [];
  bool hasSubscriptions() => _subscriptions != null;

  // "socialmedia" field.
  SocialmediaStruct? _socialmedia;
  SocialmediaStruct get socialmedia => _socialmedia ?? SocialmediaStruct();
  bool hasSocialmedia() => _socialmedia != null;

  // "subscribers" field.
  List<SubscriptionsStruct>? _subscribers;
  List<SubscriptionsStruct> get subscribers => _subscribers ?? const [];
  bool hasSubscribers() => _subscribers != null;

  // "AI_chats" field.
  List<AichatStruct>? _aIChats;
  List<AichatStruct> get aIChats => _aIChats ?? const [];
  bool hasAIChats() => _aIChats != null;

  // "notification_chat" field.
  DocumentReference? _notificationChat;
  DocumentReference? get notificationChat => _notificationChat;
  bool hasNotificationChat() => _notificationChat != null;

  // "mute_notifications" field.
  bool? _muteNotifications;
  bool get muteNotifications => _muteNotifications ?? false;
  bool hasMuteNotifications() => _muteNotifications != null;

  // "saved" field.
  List<SavedStruct>? _saved;
  List<SavedStruct> get saved => _saved ?? const [];
  bool hasSaved() => _saved != null;

  // "projectOptions" field.
  List<CompetitorOptionsStruct>? _projectOptions;
  List<CompetitorOptionsStruct> get projectOptions =>
      _projectOptions ?? const [];
  bool hasProjectOptions() => _projectOptions != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _projects = getDataList(snapshotData['projects']);
    _description = snapshotData['description'] as String?;
    _invites = getStructList(
      snapshotData['invites'],
      InvitesStruct.fromMap,
    );
    _haveChatWith = getDataList(snapshotData['haveChatWith']);
    _cover = snapshotData['cover'] as String?;
    _blockedUsers = getDataList(snapshotData['blockedUsers']);
    _smartSearchHistory = getStructList(
      snapshotData['smartSearchHistory'],
      SmartSearchStruct.fromMap,
    );
    _images = getDataList(snapshotData['images']);
    _products = getDataList(snapshotData['products']);
    _events = getDataList(snapshotData['events']);
    _sections = getStructList(
      snapshotData['sections'],
      SectionStruct.fromMap,
    );
    _pushNotifications = snapshotData['pushNotifications'] as bool?;
    _professionalInformation =
        snapshotData['professional_information'] as String?;
    _subscriptions = getStructList(
      snapshotData['subscriptions'],
      SubscriptionsStruct.fromMap,
    );
    _socialmedia = SocialmediaStruct.maybeFromMap(snapshotData['socialmedia']);
    _subscribers = getStructList(
      snapshotData['subscribers'],
      SubscriptionsStruct.fromMap,
    );
    _aIChats = getStructList(
      snapshotData['AI_chats'],
      AichatStruct.fromMap,
    );
    _notificationChat = snapshotData['notification_chat'] as DocumentReference?;
    _muteNotifications = snapshotData['mute_notifications'] as bool?;
    _saved = getStructList(
      snapshotData['saved'],
      SavedStruct.fromMap,
    );
    _projectOptions = getStructList(
      snapshotData['projectOptions'],
      CompetitorOptionsStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? description,
  String? cover,
  bool? pushNotifications,
  String? professionalInformation,
  SocialmediaStruct? socialmedia,
  DocumentReference? notificationChat,
  bool? muteNotifications,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'description': description,
      'cover': cover,
      'pushNotifications': pushNotifications,
      'professional_information': professionalInformation,
      'socialmedia': SocialmediaStruct().toMap(),
      'notification_chat': notificationChat,
      'mute_notifications': muteNotifications,
    }.withoutNulls,
  );

  // Handle nested data for "socialmedia" field.
  addSocialmediaStructData(firestoreData, socialmedia, 'socialmedia');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.projects, e2?.projects) &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.invites, e2?.invites) &&
        listEquality.equals(e1?.haveChatWith, e2?.haveChatWith) &&
        e1?.cover == e2?.cover &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        listEquality.equals(e1?.smartSearchHistory, e2?.smartSearchHistory) &&
        listEquality.equals(e1?.images, e2?.images) &&
        listEquality.equals(e1?.products, e2?.products) &&
        listEquality.equals(e1?.events, e2?.events) &&
        listEquality.equals(e1?.sections, e2?.sections) &&
        e1?.pushNotifications == e2?.pushNotifications &&
        e1?.professionalInformation == e2?.professionalInformation &&
        listEquality.equals(e1?.subscriptions, e2?.subscriptions) &&
        e1?.socialmedia == e2?.socialmedia &&
        listEquality.equals(e1?.subscribers, e2?.subscribers) &&
        listEquality.equals(e1?.aIChats, e2?.aIChats) &&
        e1?.notificationChat == e2?.notificationChat &&
        e1?.muteNotifications == e2?.muteNotifications &&
        listEquality.equals(e1?.saved, e2?.saved) &&
        listEquality.equals(e1?.projectOptions, e2?.projectOptions);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.projects,
        e?.description,
        e?.invites,
        e?.haveChatWith,
        e?.cover,
        e?.blockedUsers,
        e?.smartSearchHistory,
        e?.images,
        e?.products,
        e?.events,
        e?.sections,
        e?.pushNotifications,
        e?.professionalInformation,
        e?.subscriptions,
        e?.socialmedia,
        e?.subscribers,
        e?.aIChats,
        e?.notificationChat,
        e?.muteNotifications,
        e?.saved,
        e?.projectOptions
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
