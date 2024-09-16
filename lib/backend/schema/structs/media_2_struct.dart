// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Media2Struct extends FFFirebaseStruct {
  Media2Struct({
    String? imageUrl,
    String? videoUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imageUrl = imageUrl,
        _videoUrl = videoUrl,
        super(firestoreUtilData);

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;

  bool hasVideoUrl() => _videoUrl != null;

  static Media2Struct fromMap(Map<String, dynamic> data) => Media2Struct(
        imageUrl: data['image_url'] as String?,
        videoUrl: data['video_url'] as String?,
      );

  static Media2Struct? maybeFromMap(dynamic data) =>
      data is Map ? Media2Struct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'image_url': _imageUrl,
        'video_url': _videoUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'video_url': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static Media2Struct fromSerializableMap(Map<String, dynamic> data) =>
      Media2Struct(
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['video_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'Media2Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is Media2Struct &&
        imageUrl == other.imageUrl &&
        videoUrl == other.videoUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([imageUrl, videoUrl]);
}

Media2Struct createMedia2Struct({
  String? imageUrl,
  String? videoUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    Media2Struct(
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

Media2Struct? updateMedia2Struct(
  Media2Struct? media2, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    media2
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedia2StructData(
  Map<String, dynamic> firestoreData,
  Media2Struct? media2,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (media2 == null) {
    return;
  }
  if (media2.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && media2.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final media2Data = getMedia2FirestoreData(media2, forFieldValue);
  final nestedData = media2Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = media2.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedia2FirestoreData(
  Media2Struct? media2, [
  bool forFieldValue = false,
]) {
  if (media2 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(media2.toMap());

  // Add any Firestore field values
  media2.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedia2ListFirestoreData(
  List<Media2Struct>? media2s,
) =>
    media2s?.map((e) => getMedia2FirestoreData(e, true)).toList() ?? [];
