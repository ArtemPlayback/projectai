// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedStruct extends FFFirebaseStruct {
  SavedStruct({
    DocumentReference? people,
    DocumentReference? company,
    DocumentReference? events,
    DocumentReference? products,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _people = people,
        _company = company,
        _events = events,
        _products = products,
        super(firestoreUtilData);

  // "people" field.
  DocumentReference? _people;
  DocumentReference? get people => _people;
  set people(DocumentReference? val) => _people = val;

  bool hasPeople() => _people != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  set company(DocumentReference? val) => _company = val;

  bool hasCompany() => _company != null;

  // "events" field.
  DocumentReference? _events;
  DocumentReference? get events => _events;
  set events(DocumentReference? val) => _events = val;

  bool hasEvents() => _events != null;

  // "products" field.
  DocumentReference? _products;
  DocumentReference? get products => _products;
  set products(DocumentReference? val) => _products = val;

  bool hasProducts() => _products != null;

  static SavedStruct fromMap(Map<String, dynamic> data) => SavedStruct(
        people: data['people'] as DocumentReference?,
        company: data['company'] as DocumentReference?,
        events: data['events'] as DocumentReference?,
        products: data['products'] as DocumentReference?,
      );

  static SavedStruct? maybeFromMap(dynamic data) =>
      data is Map ? SavedStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'people': _people,
        'company': _company,
        'events': _events,
        'products': _products,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'people': serializeParam(
          _people,
          ParamType.DocumentReference,
        ),
        'company': serializeParam(
          _company,
          ParamType.DocumentReference,
        ),
        'events': serializeParam(
          _events,
          ParamType.DocumentReference,
        ),
        'products': serializeParam(
          _products,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SavedStruct fromSerializableMap(Map<String, dynamic> data) =>
      SavedStruct(
        people: deserializeParam(
          data['people'],
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
        events: deserializeParam(
          data['events'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['events'],
        ),
        products: deserializeParam(
          data['products'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
      );

  @override
  String toString() => 'SavedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SavedStruct &&
        people == other.people &&
        company == other.company &&
        events == other.events &&
        products == other.products;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([people, company, events, products]);
}

SavedStruct createSavedStruct({
  DocumentReference? people,
  DocumentReference? company,
  DocumentReference? events,
  DocumentReference? products,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SavedStruct(
      people: people,
      company: company,
      events: events,
      products: products,
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
