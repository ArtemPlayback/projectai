// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends FFFirebaseStruct {
  ChatStruct({
    String? who,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _who = who,
        _text = text,
        super(firestoreUtilData);

  // "who" field.
  String? _who;
  String get who => _who ?? '';
  set who(String? val) => _who = val;

  bool hasWho() => _who != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        who: data['who'] as String?,
        text: data['text'] as String?,
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'who': _who,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'who': serializeParam(
          _who,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        who: deserializeParam(
          data['who'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatStruct && who == other.who && text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([who, text]);
}

ChatStruct createChatStruct({
  String? who,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatStruct(
      who: who,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatStruct? updateChatStruct(
  ChatStruct? chat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatStructData(
  Map<String, dynamic> firestoreData,
  ChatStruct? chat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chat == null) {
    return;
  }
  if (chat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && chat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatData = getChatFirestoreData(chat, forFieldValue);
  final nestedData = chatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatFirestoreData(
  ChatStruct? chat, [
  bool forFieldValue = false,
]) {
  if (chat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chat.toMap());

  // Add any Firestore field values
  chat.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatListFirestoreData(
  List<ChatStruct>? chats,
) =>
    chats?.map((e) => getChatFirestoreData(e, true)).toList() ?? [];
