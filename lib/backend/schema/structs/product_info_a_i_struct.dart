// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductInfoAIStruct extends FFFirebaseStruct {
  ProductInfoAIStruct({
    String? title,
    String? type,
    String? text,
    LatLng? location,
    List<String>? options,
    List<String>? list,
    String? address,
    List<Color>? colors,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _type = type,
        _text = text,
        _location = location,
        _options = options,
        _list = list,
        _address = address,
        _colors = colors,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;
  bool hasLocation() => _location != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;
  void updateOptions(Function(List<String>) updateFn) =>
      updateFn(_options ??= []);
  bool hasOptions() => _options != null;

  // "list" field.
  List<String>? _list;
  List<String> get list => _list ?? const [];
  set list(List<String>? val) => _list = val;
  void updateList(Function(List<String>) updateFn) => updateFn(_list ??= []);
  bool hasList() => _list != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "colors" field.
  List<Color>? _colors;
  List<Color> get colors => _colors ?? const [];
  set colors(List<Color>? val) => _colors = val;
  void updateColors(Function(List<Color>) updateFn) => updateFn(_colors ??= []);
  bool hasColors() => _colors != null;

  static ProductInfoAIStruct fromMap(Map<String, dynamic> data) =>
      ProductInfoAIStruct(
        title: data['title'] as String?,
        type: data['type'] as String?,
        text: data['text'] as String?,
        location: data['location'] as LatLng?,
        options: getDataList(data['options']),
        list: getDataList(data['list']),
        address: data['address'] as String?,
        colors: getColorsList(data['colors']),
      );

  static ProductInfoAIStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductInfoAIStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'type': _type,
        'text': _text,
        'location': _location,
        'options': _options,
        'list': _list,
        'address': _address,
        'colors': _colors,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          true,
        ),
        'list': serializeParam(
          _list,
          ParamType.String,
          true,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'colors': serializeParam(
          _colors,
          ParamType.Color,
          true,
        ),
      }.withoutNulls;

  static ProductInfoAIStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductInfoAIStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        list: deserializeParam<String>(
          data['list'],
          ParamType.String,
          true,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        colors: deserializeParam<Color>(
          data['colors'],
          ParamType.Color,
          true,
        ),
      );

  @override
  String toString() => 'ProductInfoAIStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductInfoAIStruct &&
        title == other.title &&
        type == other.type &&
        text == other.text &&
        location == other.location &&
        listEquality.equals(options, other.options) &&
        listEquality.equals(list, other.list) &&
        address == other.address &&
        listEquality.equals(colors, other.colors);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, type, text, location, options, list, address, colors]);
}

ProductInfoAIStruct createProductInfoAIStruct({
  String? title,
  String? type,
  String? text,
  LatLng? location,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductInfoAIStruct(
      title: title,
      type: type,
      text: text,
      location: location,
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductInfoAIStruct? updateProductInfoAIStruct(
  ProductInfoAIStruct? productInfoAI, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productInfoAI
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductInfoAIStructData(
  Map<String, dynamic> firestoreData,
  ProductInfoAIStruct? productInfoAI,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productInfoAI == null) {
    return;
  }
  if (productInfoAI.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productInfoAI.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productInfoAIData =
      getProductInfoAIFirestoreData(productInfoAI, forFieldValue);
  final nestedData =
      productInfoAIData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productInfoAI.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductInfoAIFirestoreData(
  ProductInfoAIStruct? productInfoAI, [
  bool forFieldValue = false,
]) {
  if (productInfoAI == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productInfoAI.toMap());

  // Add any Firestore field values
  productInfoAI.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductInfoAIListFirestoreData(
  List<ProductInfoAIStruct>? productInfoAIs,
) =>
    productInfoAIs
        ?.map((e) => getProductInfoAIFirestoreData(e, true))
        .toList() ??
    [];
