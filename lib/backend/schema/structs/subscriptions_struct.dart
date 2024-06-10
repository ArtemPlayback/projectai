// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsStruct extends FFFirebaseStruct {
  SubscriptionsStruct({
    String? type,
    DocumentReference? user,
    DocumentReference? company,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _user = user,
        _company = company,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  set company(DocumentReference? val) => _company = val;
  bool hasCompany() => _company != null;

  static SubscriptionsStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionsStruct(
        type: data['type'] as String?,
        user: data['user'] as DocumentReference?,
        company: data['company'] as DocumentReference?,
      );

  static SubscriptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'user': _user,
        'company': _company,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'company': serializeParam(
          _company,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SubscriptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubscriptionsStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        company: deserializeParam(
          data['company'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['projects'],
        ),
      );

  @override
  String toString() => 'SubscriptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionsStruct &&
        type == other.type &&
        user == other.user &&
        company == other.company;
  }

  @override
  int get hashCode => const ListEquality().hash([type, user, company]);
}

SubscriptionsStruct createSubscriptionsStruct({
  String? type,
  DocumentReference? user,
  DocumentReference? company,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubscriptionsStruct(
      type: type,
      user: user,
      company: company,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubscriptionsStruct? updateSubscriptionsStruct(
  SubscriptionsStruct? subscriptions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subscriptions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubscriptionsStructData(
  Map<String, dynamic> firestoreData,
  SubscriptionsStruct? subscriptions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subscriptions == null) {
    return;
  }
  if (subscriptions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subscriptions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subscriptionsData =
      getSubscriptionsFirestoreData(subscriptions, forFieldValue);
  final nestedData =
      subscriptionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subscriptions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubscriptionsFirestoreData(
  SubscriptionsStruct? subscriptions, [
  bool forFieldValue = false,
]) {
  if (subscriptions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subscriptions.toMap());

  // Add any Firestore field values
  subscriptions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubscriptionsListFirestoreData(
  List<SubscriptionsStruct>? subscriptionss,
) =>
    subscriptionss
        ?.map((e) => getSubscriptionsFirestoreData(e, true))
        .toList() ??
    [];
