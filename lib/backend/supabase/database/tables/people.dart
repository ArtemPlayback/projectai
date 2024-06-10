import '../database.dart';

class PeopleTable extends SupabaseTable<PeopleRow> {
  @override
  String get tableName => 'people';

  @override
  PeopleRow createRow(Map<String, dynamic> data) => PeopleRow(data);
}

class PeopleRow extends SupabaseDataRow {
  PeopleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PeopleTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  dynamic? get metadata => getField<dynamic>('metadata');
  set metadata(dynamic? value) => setField<dynamic>('metadata', value);

  String? get embedding => getField<String>('embedding');
  set embedding(String? value) => setField<String>('embedding', value);

  String? get idX => getField<String>('id_x');
  set idX(String? value) => setField<String>('id_x', value);
}
