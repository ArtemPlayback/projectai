import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "owner_person" field.
  DocumentReference? _ownerPerson;
  DocumentReference? get ownerPerson => _ownerPerson;
  bool hasOwnerPerson() => _ownerPerson != null;

  // "owner_company" field.
  DocumentReference? _ownerCompany;
  DocumentReference? get ownerCompany => _ownerCompany;
  bool hasOwnerCompany() => _ownerCompany != null;

  // "product_info" field.
  List<ProductInfoAIStruct>? _productInfo;
  List<ProductInfoAIStruct> get productInfo => _productInfo ?? const [];
  bool hasProductInfo() => _productInfo != null;

  // "custom_id" field.
  String? _customId;
  String get customId => _customId ?? '';
  bool hasCustomId() => _customId != null;

  // "test" field.
  String? _test;
  String get test => _test ?? '';
  bool hasTest() => _test != null;

  // "Colors" field.
  List<Color>? _colors;
  List<Color> get colors => _colors ?? const [];
  bool hasColors() => _colors != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _images = getDataList(snapshotData['images']);
    _ownerPerson = snapshotData['owner_person'] as DocumentReference?;
    _ownerCompany = snapshotData['owner_company'] as DocumentReference?;
    _productInfo = getStructList(
      snapshotData['product_info'],
      ProductInfoAIStruct.fromMap,
    );
    _customId = snapshotData['custom_id'] as String?;
    _test = snapshotData['test'] as String?;
    _colors = getColorsList(snapshotData['Colors']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? title,
  String? description,
  int? price,
  DocumentReference? ownerPerson,
  DocumentReference? ownerCompany,
  String? customId,
  String? test,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'owner_person': ownerPerson,
      'owner_company': ownerCompany,
      'custom_id': customId,
      'test': test,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.ownerPerson == e2?.ownerPerson &&
        e1?.ownerCompany == e2?.ownerCompany &&
        listEquality.equals(e1?.productInfo, e2?.productInfo) &&
        e1?.customId == e2?.customId &&
        e1?.test == e2?.test &&
        listEquality.equals(e1?.colors, e2?.colors);
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.price,
        e?.images,
        e?.ownerPerson,
        e?.ownerCompany,
        e?.productInfo,
        e?.customId,
        e?.test,
        e?.colors
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
