import '../database.dart';

class EventsTable extends SupabaseTable<EventsRow> {
  @override
  String get tableName => 'events';

  @override
  EventsRow createRow(Map<String, dynamic> data) => EventsRow(data);
}

class EventsRow extends SupabaseDataRow {
  EventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  int? get cost => getField<int>('cost');
  set cost(int? value) => setField<int>('cost', value);

  List<String> get photos => getListField<String>('photos');
  set photos(List<String>? value) => setListField<String>('photos', value);

  List<String> get tags => getListField<String>('tags');
  set tags(List<String>? value) => setListField<String>('tags', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get userReference => getField<String>('user_reference');
  set userReference(String? value) => setField<String>('user_reference', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  bool? get isLiked => getField<bool>('isLiked');
  set isLiked(bool? value) => setField<bool>('isLiked', value);

  String? get owner => getField<String>('owner');
  set owner(String? value) => setField<String>('owner', value);
}
