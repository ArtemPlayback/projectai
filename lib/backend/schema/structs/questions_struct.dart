// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsStruct extends FFFirebaseStruct {
  QuestionsStruct({
    String? question,
    String? description,
    String? type,
    List<String>? options,
    String? answer,
    List<String>? multipleAnswer,
    bool? isMultiselect,
    List<Color>? colors,
    LatLng? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _description = description,
        _type = type,
        _options = options,
        _answer = answer,
        _multipleAnswer = multipleAnswer,
        _isMultiselect = isMultiselect,
        _colors = colors,
        _location = location,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;
  void updateOptions(Function(List<String>) updateFn) =>
      updateFn(_options ??= []);
  bool hasOptions() => _options != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;
  bool hasAnswer() => _answer != null;

  // "multiple_answer" field.
  List<String>? _multipleAnswer;
  List<String> get multipleAnswer => _multipleAnswer ?? const [];
  set multipleAnswer(List<String>? val) => _multipleAnswer = val;
  void updateMultipleAnswer(Function(List<String>) updateFn) =>
      updateFn(_multipleAnswer ??= []);
  bool hasMultipleAnswer() => _multipleAnswer != null;

  // "isMultiselect" field.
  bool? _isMultiselect;
  bool get isMultiselect => _isMultiselect ?? false;
  set isMultiselect(bool? val) => _isMultiselect = val;
  bool hasIsMultiselect() => _isMultiselect != null;

  // "colors" field.
  List<Color>? _colors;
  List<Color> get colors => _colors ?? const [];
  set colors(List<Color>? val) => _colors = val;
  void updateColors(Function(List<Color>) updateFn) => updateFn(_colors ??= []);
  bool hasColors() => _colors != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;
  bool hasLocation() => _location != null;

  static QuestionsStruct fromMap(Map<String, dynamic> data) => QuestionsStruct(
        question: data['question'] as String?,
        description: data['description'] as String?,
        type: data['type'] as String?,
        options: getDataList(data['options']),
        answer: data['answer'] as String?,
        multipleAnswer: getDataList(data['multiple_answer']),
        isMultiselect: data['isMultiselect'] as bool?,
        colors: getColorsList(data['colors']),
        location: data['location'] as LatLng?,
      );

  static QuestionsStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'description': _description,
        'type': _type,
        'options': _options,
        'answer': _answer,
        'multiple_answer': _multipleAnswer,
        'isMultiselect': _isMultiselect,
        'colors': _colors,
        'location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          true,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
        'multiple_answer': serializeParam(
          _multipleAnswer,
          ParamType.String,
          true,
        ),
        'isMultiselect': serializeParam(
          _isMultiselect,
          ParamType.bool,
        ),
        'colors': serializeParam(
          _colors,
          ParamType.Color,
          true,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static QuestionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionsStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        multipleAnswer: deserializeParam<String>(
          data['multiple_answer'],
          ParamType.String,
          true,
        ),
        isMultiselect: deserializeParam(
          data['isMultiselect'],
          ParamType.bool,
          false,
        ),
        colors: deserializeParam<Color>(
          data['colors'],
          ParamType.Color,
          true,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'QuestionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionsStruct &&
        question == other.question &&
        description == other.description &&
        type == other.type &&
        listEquality.equals(options, other.options) &&
        answer == other.answer &&
        listEquality.equals(multipleAnswer, other.multipleAnswer) &&
        isMultiselect == other.isMultiselect &&
        listEquality.equals(colors, other.colors) &&
        location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([
        question,
        description,
        type,
        options,
        answer,
        multipleAnswer,
        isMultiselect,
        colors,
        location
      ]);
}

QuestionsStruct createQuestionsStruct({
  String? question,
  String? description,
  String? type,
  String? answer,
  bool? isMultiselect,
  LatLng? location,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionsStruct(
      question: question,
      description: description,
      type: type,
      answer: answer,
      isMultiselect: isMultiselect,
      location: location,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionsStruct? updateQuestionsStruct(
  QuestionsStruct? questions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionsStructData(
  Map<String, dynamic> firestoreData,
  QuestionsStruct? questions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questions == null) {
    return;
  }
  if (questions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && questions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionsData = getQuestionsFirestoreData(questions, forFieldValue);
  final nestedData = questionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = questions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionsFirestoreData(
  QuestionsStruct? questions, [
  bool forFieldValue = false,
]) {
  if (questions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questions.toMap());

  // Add any Firestore field values
  questions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionsListFirestoreData(
  List<QuestionsStruct>? questionss,
) =>
    questionss?.map((e) => getQuestionsFirestoreData(e, true)).toList() ?? [];
