// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedStruct extends FFFirebaseStruct {
  SavedStruct({
    DocumentReference? person,
    DocumentReference? company,
    DocumentReference? product,
    DocumentReference? event,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _person = person,
        _company = company,
        _product = product,
        _event = event,
        super(firestoreUtilData);

  // "person" field.
  DocumentReference? _person;
  DocumentReference? get person => _person;
  set person(DocumentReference? val) => _person = val;
  bool hasPerson() => _person != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  set company(DocumentReference? val) => _company = val;
  bool hasCompany() => _company != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  set product(DocumentReference? val) => _product = val;
  bool hasProduct() => _product != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  set event(DocumentReference? val) => _event = val;
  bool hasEvent() => _event != null;

  static SavedStruct fromMap(Map<String, dynamic> data) => SavedStruct(
        person: data['person'] as DocumentReference?,
        company: data['company'] as DocumentReference?,
        product: data['product'] as DocumentReference?,
        event: data['event'] as DocumentReference?,
      );

  static SavedStruct? maybeFromMap(dynamic data) =>
      data is Map ? SavedStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'person': _person,
        'company': _company,
        'product': _product,
        'event': _event,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'person': serializeParam(
          _person,
          ParamType.DocumentReference,
        ),
        'company': serializeParam(
          _company,
          ParamType.DocumentReference,
        ),
        'product': serializeParam(
          _product,
          ParamType.DocumentReference,
        ),
        'event': serializeParam(
          _event,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SavedStruct fromSerializableMap(Map<String, dynamic> data) =>
      SavedStruct(
        person: deserializeParam(
          data['person'],
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
        product: deserializeParam(
          data['product'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        event: deserializeParam(
          data['event'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['events'],
        ),
      );

  @override
  String toString() => 'SavedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SavedStruct &&
        person == other.person &&
        company == other.company &&
        product == other.product &&
        event == other.event;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([person, company, product, event]);
}

SavedStruct createSavedStruct({
  DocumentReference? person,
  DocumentReference? company,
  DocumentReference? product,
  DocumentReference? event,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SavedStruct(
      person: person,
      company: company,
      product: product,
      event: event,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SavedStruct? updateSavedStruct(
  SavedStruct? saved, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saved
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSavedStructData(
  Map<String, dynamic> firestoreData,
  SavedStruct? saved,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saved == null) {
    return;
  }
  if (saved.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && saved.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final savedData = getSavedFirestoreData(saved, forFieldValue);
  final nestedData = savedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = saved.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSavedFirestoreData(
  SavedStruct? saved, [
  bool forFieldValue = false,
]) {
  if (saved == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saved.toMap());

  // Add any Firestore field values
  saved.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSavedListFirestoreData(
  List<SavedStruct>? saveds,
) =>
    saveds?.map((e) => getSavedFirestoreData(e, true)).toList() ?? [];
