// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediaStruct extends FFFirebaseStruct {
  MediaStruct({
    String? image,
    String? video,
    String? document,
    MediaType? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _video = video,
        _document = document,
        _type = type,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;

  bool hasVideo() => _video != null;

  // "document" field.
  String? _document;
  String get document => _document ?? '';
  set document(String? val) => _document = val;

  bool hasDocument() => _document != null;

  // "type" field.
  MediaType? _type;
  MediaType get type => _type ?? MediaType.image;
  set type(MediaType? val) => _type = val;

  bool hasType() => _type != null;

  static MediaStruct fromMap(Map<String, dynamic> data) => MediaStruct(
        image: data['image'] as String?,
        video: data['video'] as String?,
        document: data['document'] as String?,
        type: deserializeEnum<MediaType>(data['type']),
      );

  static MediaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MediaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'video': _video,
        'document': _document,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'document': serializeParam(
          _document,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static MediaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediaStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
        document: deserializeParam(
          data['document'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<MediaType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'MediaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediaStruct &&
        image == other.image &&
        video == other.video &&
        document == other.document &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([image, video, document, type]);
}

MediaStruct createMediaStruct({
  String? image,
  String? video,
  String? document,
  MediaType? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MediaStruct(
      image: image,
      video: video,
      document: document,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MediaStruct? updateMediaStruct(
  MediaStruct? media, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    media
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMediaStructData(
  Map<String, dynamic> firestoreData,
  MediaStruct? media,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (media == null) {
    return;
  }
  if (media.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && media.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mediaData = getMediaFirestoreData(media, forFieldValue);
  final nestedData = mediaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = media.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMediaFirestoreData(
  MediaStruct? media, [
  bool forFieldValue = false,
]) {
  if (media == null) {
    return {};
  }
  final firestoreData = mapToFirestore(media.toMap());

  // Add any Firestore field values
  media.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMediaListFirestoreData(
  List<MediaStruct>? medias,
) =>
    medias?.map((e) => getMediaFirestoreData(e, true)).toList() ?? [];
