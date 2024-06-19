// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YearsPlanStruct extends FFFirebaseStruct {
  YearsPlanStruct({
    int? year,
    String? taskTitle,
    bool? done,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _year = year,
        _taskTitle = taskTitle,
        _done = done,
        super(firestoreUtilData);

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;

  void incrementYear(int amount) => year = year + amount;

  bool hasYear() => _year != null;

  // "taskTitle" field.
  String? _taskTitle;
  String get taskTitle => _taskTitle ?? '';
  set taskTitle(String? val) => _taskTitle = val;

  bool hasTaskTitle() => _taskTitle != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  set done(bool? val) => _done = val;

  bool hasDone() => _done != null;

  static YearsPlanStruct fromMap(Map<String, dynamic> data) => YearsPlanStruct(
        year: castToType<int>(data['year']),
        taskTitle: data['taskTitle'] as String?,
        done: data['done'] as bool?,
      );

  static YearsPlanStruct? maybeFromMap(dynamic data) => data is Map
      ? YearsPlanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'year': _year,
        'taskTitle': _taskTitle,
        'done': _done,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
        'taskTitle': serializeParam(
          _taskTitle,
          ParamType.String,
        ),
        'done': serializeParam(
          _done,
          ParamType.bool,
        ),
      }.withoutNulls;

  static YearsPlanStruct fromSerializableMap(Map<String, dynamic> data) =>
      YearsPlanStruct(
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
        taskTitle: deserializeParam(
          data['taskTitle'],
          ParamType.String,
          false,
        ),
        done: deserializeParam(
          data['done'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'YearsPlanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is YearsPlanStruct &&
        year == other.year &&
        taskTitle == other.taskTitle &&
        done == other.done;
  }

  @override
  int get hashCode => const ListEquality().hash([year, taskTitle, done]);
}

YearsPlanStruct createYearsPlanStruct({
  int? year,
  String? taskTitle,
  bool? done,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    YearsPlanStruct(
      year: year,
      taskTitle: taskTitle,
      done: done,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

YearsPlanStruct? updateYearsPlanStruct(
  YearsPlanStruct? yearsPlan, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    yearsPlan
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addYearsPlanStructData(
  Map<String, dynamic> firestoreData,
  YearsPlanStruct? yearsPlan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (yearsPlan == null) {
    return;
  }
  if (yearsPlan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && yearsPlan.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final yearsPlanData = getYearsPlanFirestoreData(yearsPlan, forFieldValue);
  final nestedData = yearsPlanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = yearsPlan.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getYearsPlanFirestoreData(
  YearsPlanStruct? yearsPlan, [
  bool forFieldValue = false,
]) {
  if (yearsPlan == null) {
    return {};
  }
  final firestoreData = mapToFirestore(yearsPlan.toMap());

  // Add any Firestore field values
  yearsPlan.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getYearsPlanListFirestoreData(
  List<YearsPlanStruct>? yearsPlans,
) =>
    yearsPlans?.map((e) => getYearsPlanFirestoreData(e, true)).toList() ?? [];
