// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AichatStruct extends FFFirebaseStruct {
  AichatStruct({
    List<ChatMessagesStruct>? messages,
    String? type,
    DocumentReference? event,
    DocumentReference? product,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _messages = messages,
        _type = type,
        _event = event,
        _product = product,
        super(firestoreUtilData);

  // "messages" field.
  List<ChatMessagesStruct>? _messages;
  List<ChatMessagesStruct> get messages => _messages ?? const [];
  set messages(List<ChatMessagesStruct>? val) => _messages = val;

  void updateMessages(Function(List<ChatMessagesStruct>) updateFn) {
    updateFn(messages ??= []);
  }

  bool hasMessages() => _messages != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  set event(DocumentReference? val) => _event = val;

  bool hasEvent() => _event != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  set product(DocumentReference? val) => _product = val;

  bool hasProduct() => _product != null;

  static AichatStruct fromMap(Map<String, dynamic> data) => AichatStruct(
        messages: getStructList(
          data['messages'],
          ChatMessagesStruct.fromMap,
        ),
        type: data['type'] as String?,
        event: data['event'] as DocumentReference?,
        product: data['product'] as DocumentReference?,
      );

  static AichatStruct? maybeFromMap(dynamic data) =>
      data is Map ? AichatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'messages': _messages?.map((e) => e.toMap()).toList(),
        'type': _type,
        'event': _event,
        'product': _product,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'messages': serializeParam(
          _messages,
          ParamType.DataStruct,
          isList: true,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'event': serializeParam(
          _event,
          ParamType.DocumentReference,
        ),
        'product': serializeParam(
          _product,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static AichatStruct fromSerializableMap(Map<String, dynamic> data) =>
      AichatStruct(
        messages: deserializeStructParam<ChatMessagesStruct>(
          data['messages'],
          ParamType.DataStruct,
          true,
          structBuilder: ChatMessagesStruct.fromSerializableMap,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        event: deserializeParam(
          data['event'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['events'],
        ),
        product: deserializeParam(
          data['product'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
      );

  @override
  String toString() => 'AichatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AichatStruct &&
        listEquality.equals(messages, other.messages) &&
        type == other.type &&
        event == other.event &&
        product == other.product;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([messages, type, event, product]);
}

AichatStruct createAichatStruct({
  String? type,
  DocumentReference? event,
  DocumentReference? product,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AichatStruct(
      type: type,
      event: event,
      product: product,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AichatStruct? updateAichatStruct(
  AichatStruct? aichat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aichat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAichatStructData(
  Map<String, dynamic> firestoreData,
  AichatStruct? aichat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aichat == null) {
    return;
  }
  if (aichat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aichat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aichatData = getAichatFirestoreData(aichat, forFieldValue);
  final nestedData = aichatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aichat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAichatFirestoreData(
  AichatStruct? aichat, [
  bool forFieldValue = false,
]) {
  if (aichat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aichat.toMap());

  // Add any Firestore field values
  aichat.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAichatListFirestoreData(
  List<AichatStruct>? aichats,
) =>
    aichats?.map((e) => getAichatFirestoreData(e, true)).toList() ?? [];
