import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectsRecord extends FirestoreRecord {
  ProjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "projectInformation" field.
  ProjectInformationStruct? _projectInformation;
  ProjectInformationStruct get projectInformation =>
      _projectInformation ?? ProjectInformationStruct();
  bool hasProjectInformation() => _projectInformation != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "businessPlan" field.
  ProjectBusinessPlanStruct? _businessPlan;
  ProjectBusinessPlanStruct get businessPlan =>
      _businessPlan ?? ProjectBusinessPlanStruct();
  bool hasBusinessPlan() => _businessPlan != null;

  // "pitchDeck" field.
  PitchdeckStruct? _pitchDeck;
  PitchdeckStruct get pitchDeck => _pitchDeck ?? PitchdeckStruct();
  bool hasPitchDeck() => _pitchDeck != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  // "products" field.
  List<DocumentReference>? _products;
  List<DocumentReference> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  // "events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "custom_id" field.
  String? _customId;
  String get customId => _customId ?? '';
  bool hasCustomId() => _customId != null;

  // "team" field.
  List<TeamMemberStruct>? _team;
  List<TeamMemberStruct> get team => _team ?? const [];
  bool hasTeam() => _team != null;

  // "subscriptions" field.
  List<SubscriptionsStruct>? _subscriptions;
  List<SubscriptionsStruct> get subscriptions => _subscriptions ?? const [];
  bool hasSubscriptions() => _subscriptions != null;

  // "subscribers" field.
  List<SubscriptionsStruct>? _subscribers;
  List<SubscriptionsStruct> get subscribers => _subscribers ?? const [];
  bool hasSubscribers() => _subscribers != null;

  // "socialmedia" field.
  SocialmediaStruct? _socialmedia;
  SocialmediaStruct get socialmedia => _socialmedia ?? SocialmediaStruct();
  bool hasSocialmedia() => _socialmedia != null;

  // "sections" field.
  List<SectionStruct>? _sections;
  List<SectionStruct> get sections => _sections ?? const [];
  bool hasSections() => _sections != null;

  // "invites" field.
  List<InvitesStruct>? _invites;
  List<InvitesStruct> get invites => _invites ?? const [];
  bool hasInvites() => _invites != null;

  // "team_members" field.
  List<TeamMemberStruct>? _teamMembers;
  List<TeamMemberStruct> get teamMembers => _teamMembers ?? const [];
  bool hasTeamMembers() => _teamMembers != null;

  // "testCompetitors" field.
  List<TestCompetitorsStruct>? _testCompetitors;
  List<TestCompetitorsStruct> get testCompetitors =>
      _testCompetitors ?? const [];
  bool hasTestCompetitors() => _testCompetitors != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _cover = snapshotData['cover'] as String?;
    _projectInformation = ProjectInformationStruct.maybeFromMap(
        snapshotData['projectInformation']);
    _user = snapshotData['user'] as DocumentReference?;
    _businessPlan =
        ProjectBusinessPlanStruct.maybeFromMap(snapshotData['businessPlan']);
    _pitchDeck = PitchdeckStruct.maybeFromMap(snapshotData['pitchDeck']);
    _images = getDataList(snapshotData['images']);
    _mainImage = snapshotData['main_image'] as String?;
    _products = getDataList(snapshotData['products']);
    _events = getDataList(snapshotData['events']);
    _customId = snapshotData['custom_id'] as String?;
    _team = getStructList(
      snapshotData['team'],
      TeamMemberStruct.fromMap,
    );
    _subscriptions = getStructList(
      snapshotData['subscriptions'],
      SubscriptionsStruct.fromMap,
    );
    _subscribers = getStructList(
      snapshotData['subscribers'],
      SubscriptionsStruct.fromMap,
    );
    _socialmedia = SocialmediaStruct.maybeFromMap(snapshotData['socialmedia']);
    _sections = getStructList(
      snapshotData['sections'],
      SectionStruct.fromMap,
    );
    _invites = getStructList(
      snapshotData['invites'],
      InvitesStruct.fromMap,
    );
    _teamMembers = getStructList(
      snapshotData['team_members'],
      TeamMemberStruct.fromMap,
    );
    _testCompetitors = getStructList(
      snapshotData['testCompetitors'],
      TestCompetitorsStruct.fromMap,
    );
    _completed = snapshotData['completed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectsRecord.fromSnapshot(s));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectsRecord.fromSnapshot(s));

  static ProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectsRecordData({
  String? title,
  String? cover,
  ProjectInformationStruct? projectInformation,
  DocumentReference? user,
  ProjectBusinessPlanStruct? businessPlan,
  PitchdeckStruct? pitchDeck,
  String? mainImage,
  String? customId,
  SocialmediaStruct? socialmedia,
  bool? completed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'cover': cover,
      'projectInformation': ProjectInformationStruct().toMap(),
      'user': user,
      'businessPlan': ProjectBusinessPlanStruct().toMap(),
      'pitchDeck': PitchdeckStruct().toMap(),
      'main_image': mainImage,
      'custom_id': customId,
      'socialmedia': SocialmediaStruct().toMap(),
      'completed': completed,
    }.withoutNulls,
  );

  // Handle nested data for "projectInformation" field.
  addProjectInformationStructData(
      firestoreData, projectInformation, 'projectInformation');

  // Handle nested data for "businessPlan" field.
  addProjectBusinessPlanStructData(firestoreData, businessPlan, 'businessPlan');

  // Handle nested data for "pitchDeck" field.
  addPitchdeckStructData(firestoreData, pitchDeck, 'pitchDeck');

  // Handle nested data for "socialmedia" field.
  addSocialmediaStructData(firestoreData, socialmedia, 'socialmedia');

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.cover == e2?.cover &&
        e1?.projectInformation == e2?.projectInformation &&
        e1?.user == e2?.user &&
        e1?.businessPlan == e2?.businessPlan &&
        e1?.pitchDeck == e2?.pitchDeck &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.mainImage == e2?.mainImage &&
        listEquality.equals(e1?.products, e2?.products) &&
        listEquality.equals(e1?.events, e2?.events) &&
        e1?.customId == e2?.customId &&
        listEquality.equals(e1?.team, e2?.team) &&
        listEquality.equals(e1?.subscriptions, e2?.subscriptions) &&
        listEquality.equals(e1?.subscribers, e2?.subscribers) &&
        e1?.socialmedia == e2?.socialmedia &&
        listEquality.equals(e1?.sections, e2?.sections) &&
        listEquality.equals(e1?.invites, e2?.invites) &&
        listEquality.equals(e1?.teamMembers, e2?.teamMembers) &&
        listEquality.equals(e1?.testCompetitors, e2?.testCompetitors) &&
        e1?.completed == e2?.completed;
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.cover,
        e?.projectInformation,
        e?.user,
        e?.businessPlan,
        e?.pitchDeck,
        e?.images,
        e?.mainImage,
        e?.products,
        e?.events,
        e?.customId,
        e?.team,
        e?.subscriptions,
        e?.subscribers,
        e?.socialmedia,
        e?.sections,
        e?.invites,
        e?.teamMembers,
        e?.testCompetitors,
        e?.completed
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
