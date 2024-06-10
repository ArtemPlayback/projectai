import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_info" field.
  PostStruct? _postInfo;
  PostStruct get postInfo => _postInfo ?? PostStruct();
  bool hasPostInfo() => _postInfo != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  void _initializeFields() {
    _postInfo = PostStruct.maybeFromMap(snapshotData['post_info']);
    _user = snapshotData['user'] as DocumentReference?;
    _company = snapshotData['company'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  PostStruct? postInfo,
  DocumentReference? user,
  DocumentReference? company,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_info': PostStruct().toMap(),
      'user': user,
      'company': company,
    }.withoutNulls,
  );

  // Handle nested data for "post_info" field.
  addPostStructData(firestoreData, postInfo, 'post_info');

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    return e1?.postInfo == e2?.postInfo &&
        e1?.user == e2?.user &&
        e1?.company == e2?.company;
  }

  @override
  int hash(PostsRecord? e) =>
      const ListEquality().hash([e?.postInfo, e?.user, e?.company]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
