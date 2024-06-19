// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostStruct extends FFFirebaseStruct {
  PostStruct({
    String? text,
    String? header,
    List<String>? images,
    DateTime? timestamp,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _header = header,
        _images = images,
        _timestamp = timestamp,
        _id = id,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "header" field.
  String? _header;
  String get header => _header ?? '';
  set header(String? val) => _header = val;

  bool hasHeader() => _header != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(images ??= []);
  }

  bool hasImages() => _images != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static PostStruct fromMap(Map<String, dynamic> data) => PostStruct(
        text: data['text'] as String?,
        header: data['header'] as String?,
        images: getDataList(data['images']),
        timestamp: data['timestamp'] as DateTime?,
        id: data['id'] as String?,
      );

  static PostStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'header': _header,
        'images': _images,
        'timestamp': _timestamp,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'header': serializeParam(
          _header,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        header: deserializeParam(
          data['header'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostStruct &&
        text == other.text &&
        header == other.header &&
        listEquality.equals(images, other.images) &&
        timestamp == other.timestamp &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([text, header, images, timestamp, id]);
}

PostStruct createPostStruct({
  String? text,
  String? header,
  DateTime? timestamp,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostStruct(
      text: text,
      header: header,
      timestamp: timestamp,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostStruct? updatePostStruct(
  PostStruct? post, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    post
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostStructData(
  Map<String, dynamic> firestoreData,
  PostStruct? post,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (post == null) {
    return;
  }
  if (post.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && post.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postData = getPostFirestoreData(post, forFieldValue);
  final nestedData = postData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = post.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostFirestoreData(
  PostStruct? post, [
  bool forFieldValue = false,
]) {
  if (post == null) {
    return {};
  }
  final firestoreData = mapToFirestore(post.toMap());

  // Add any Firestore field values
  post.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostListFirestoreData(
  List<PostStruct>? posts,
) =>
    posts?.map((e) => getPostFirestoreData(e, true)).toList() ?? [];
