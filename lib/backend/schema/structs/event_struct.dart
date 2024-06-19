// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventStruct extends FFFirebaseStruct {
  EventStruct({
    bool? isOpen,
    String? title,
    String? description,
    List<String>? images,
    bool? isOnline,
    LatLng? location,
    String? locationTitle,
    String? additionalInfoLocation,
    DateTime? startDate,
    DateTime? startTime,
    int? price,
    bool? isFree,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isOpen = isOpen,
        _title = title,
        _description = description,
        _images = images,
        _isOnline = isOnline,
        _location = location,
        _locationTitle = locationTitle,
        _additionalInfoLocation = additionalInfoLocation,
        _startDate = startDate,
        _startTime = startTime,
        _price = price,
        _isFree = isFree,
        super(firestoreUtilData);

  // "isOpen" field.
  bool? _isOpen;
  bool get isOpen => _isOpen ?? false;
  set isOpen(bool? val) => _isOpen = val;

  bool hasIsOpen() => _isOpen != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(images ??= []);
  }

  bool hasImages() => _images != null;

  // "isOnline" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  set isOnline(bool? val) => _isOnline = val;

  bool hasIsOnline() => _isOnline != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  // "location_title" field.
  String? _locationTitle;
  String get locationTitle => _locationTitle ?? '';
  set locationTitle(String? val) => _locationTitle = val;

  bool hasLocationTitle() => _locationTitle != null;

  // "additional_info_location" field.
  String? _additionalInfoLocation;
  String get additionalInfoLocation => _additionalInfoLocation ?? '';
  set additionalInfoLocation(String? val) => _additionalInfoLocation = val;

  bool hasAdditionalInfoLocation() => _additionalInfoLocation != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "isFree" field.
  bool? _isFree;
  bool get isFree => _isFree ?? false;
  set isFree(bool? val) => _isFree = val;

  bool hasIsFree() => _isFree != null;

  static EventStruct fromMap(Map<String, dynamic> data) => EventStruct(
        isOpen: data['isOpen'] as bool?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        images: getDataList(data['images']),
        isOnline: data['isOnline'] as bool?,
        location: data['location'] as LatLng?,
        locationTitle: data['location_title'] as String?,
        additionalInfoLocation: data['additional_info_location'] as String?,
        startDate: data['start_date'] as DateTime?,
        startTime: data['start_time'] as DateTime?,
        price: castToType<int>(data['price']),
        isFree: data['isFree'] as bool?,
      );

  static EventStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'isOpen': _isOpen,
        'title': _title,
        'description': _description,
        'images': _images,
        'isOnline': _isOnline,
        'location': _location,
        'location_title': _locationTitle,
        'additional_info_location': _additionalInfoLocation,
        'start_date': _startDate,
        'start_time': _startTime,
        'price': _price,
        'isFree': _isFree,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isOpen': serializeParam(
          _isOpen,
          ParamType.bool,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'isOnline': serializeParam(
          _isOnline,
          ParamType.bool,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'location_title': serializeParam(
          _locationTitle,
          ParamType.String,
        ),
        'additional_info_location': serializeParam(
          _additionalInfoLocation,
          ParamType.String,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'isFree': serializeParam(
          _isFree,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EventStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventStruct(
        isOpen: deserializeParam(
          data['isOpen'],
          ParamType.bool,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        isOnline: deserializeParam(
          data['isOnline'],
          ParamType.bool,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        locationTitle: deserializeParam(
          data['location_title'],
          ParamType.String,
          false,
        ),
        additionalInfoLocation: deserializeParam(
          data['additional_info_location'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.DateTime,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        isFree: deserializeParam(
          data['isFree'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EventStruct &&
        isOpen == other.isOpen &&
        title == other.title &&
        description == other.description &&
        listEquality.equals(images, other.images) &&
        isOnline == other.isOnline &&
        location == other.location &&
        locationTitle == other.locationTitle &&
        additionalInfoLocation == other.additionalInfoLocation &&
        startDate == other.startDate &&
        startTime == other.startTime &&
        price == other.price &&
        isFree == other.isFree;
  }

  @override
  int get hashCode => const ListEquality().hash([
        isOpen,
        title,
        description,
        images,
        isOnline,
        location,
        locationTitle,
        additionalInfoLocation,
        startDate,
        startTime,
        price,
        isFree
      ]);
}

EventStruct createEventStruct({
  bool? isOpen,
  String? title,
  String? description,
  bool? isOnline,
  LatLng? location,
  String? locationTitle,
  String? additionalInfoLocation,
  DateTime? startDate,
  DateTime? startTime,
  int? price,
  bool? isFree,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventStruct(
      isOpen: isOpen,
      title: title,
      description: description,
      isOnline: isOnline,
      location: location,
      locationTitle: locationTitle,
      additionalInfoLocation: additionalInfoLocation,
      startDate: startDate,
      startTime: startTime,
      price: price,
      isFree: isFree,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventStruct? updateEventStruct(
  EventStruct? event, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    event
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventStructData(
  Map<String, dynamic> firestoreData,
  EventStruct? event,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (event == null) {
    return;
  }
  if (event.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && event.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventData = getEventFirestoreData(event, forFieldValue);
  final nestedData = eventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = event.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventFirestoreData(
  EventStruct? event, [
  bool forFieldValue = false,
]) {
  if (event == null) {
    return {};
  }
  final firestoreData = mapToFirestore(event.toMap());

  // Add any Firestore field values
  event.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventListFirestoreData(
  List<EventStruct>? events,
) =>
    events?.map((e) => getEventFirestoreData(e, true)).toList() ?? [];
