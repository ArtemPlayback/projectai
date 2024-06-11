// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesStruct extends FFFirebaseStruct {
  ChatMessagesStruct({
    String? text,
    DocumentReference? from,
    DateTime? when,
    bool? isRead,
    String? id,
    String? type,
    List<String>? images,
    String? audio,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _from = from,
        _when = when,
        _isRead = isRead,
        _id = id,
        _type = type,
        _images = images,
        _audio = audio,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "from" field.
  DocumentReference? _from;
  DocumentReference? get from => _from;
  set from(DocumentReference? val) => _from = val;
  bool hasFrom() => _from != null;

  // "when" field.
  DateTime? _when;
  DateTime? get when => _when;
  set when(DateTime? val) => _when = val;
  bool hasWhen() => _when != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  set isRead(bool? val) => _isRead = val;
  bool hasIsRead() => _isRead != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;
  void updateImages(Function(List<String>) updateFn) =>
      updateFn(_images ??= []);
  bool hasImages() => _images != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  set audio(String? val) => _audio = val;
  bool hasAudio() => _audio != null;

  static ChatMessagesStruct fromMap(Map<String, dynamic> data) =>
      ChatMessagesStruct(
        text: data['text'] as String?,
        from: data['from'] as DocumentReference?,
        when: data['when'] as DateTime?,
        isRead: data['isRead'] as bool?,
        id: data['id'] as String?,
        type: data['type'] as String?,
        images: getDataList(data['images']),
        audio: data['audio'] as String?,
      );

  static ChatMessagesStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessagesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'from': _from,
        'when': _when,
        'isRead': _isRead,
        'id': _id,
        'type': _type,
        'images': _images,
        'audio': _audio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'from': serializeParam(
          _from,
          ParamType.DocumentReference,
        ),
        'when': serializeParam(
          _when,
          ParamType.DateTime,
        ),
        'isRead': serializeParam(
          _isRead,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          true,
        ),
        'audio': serializeParam(
          _audio,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatMessagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessagesStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        from: deserializeParam(
          data['from'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        when: deserializeParam(
          data['when'],
          ParamType.DateTime,
          false,
        ),
        isRead: deserializeParam(
          data['isRead'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        audio: deserializeParam(
          data['audio'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatMessagesStruct &&
        text == other.text &&
        from == other.from &&
        when == other.when &&
        isRead == other.isRead &&
        id == other.id &&
        type == other.type &&
        listEquality.equals(images, other.images) &&
        audio == other.audio;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([text, from, when, isRead, id, type, images, audio]);
}

ChatMessagesStruct createChatMessagesStruct({
  String? text,
  DocumentReference? from,
  DateTime? when,
  bool? isRead,
  String? id,
  String? type,
  String? audio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMessagesStruct(
      text: text,
      from: from,
      when: when,
      isRead: isRead,
      id: id,
      type: type,
      audio: audio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMessagesStruct? updateChatMessagesStruct(
  ChatMessagesStruct? chatMessages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMessages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMessagesStructData(
  Map<String, dynamic> firestoreData,
  ChatMessagesStruct? chatMessages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMessages == null) {
    return;
  }
  if (chatMessages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMessages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMessagesData =
      getChatMessagesFirestoreData(chatMessages, forFieldValue);
  final nestedData =
      chatMessagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatMessages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMessagesFirestoreData(
  ChatMessagesStruct? chatMessages, [
  bool forFieldValue = false,
]) {
  if (chatMessages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMessages.toMap());

  // Add any Firestore field values
  chatMessages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMessagesListFirestoreData(
  List<ChatMessagesStruct>? chatMessagess,
) =>
    chatMessagess?.map((e) => getChatMessagesFirestoreData(e, true)).toList() ??
    [];
