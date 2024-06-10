import '../database.dart';

class DocumentsTable extends SupabaseTable<DocumentsRow> {
  @override
  String get tableName => 'documents';

  @override
  DocumentsRow createRow(Map<String, dynamic> data) => DocumentsRow(data);
}

class DocumentsRow extends SupabaseDataRow {
  DocumentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DocumentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  dynamic? get metadata => getField<dynamic>('metadata');
  set metadata(dynamic? value) => setField<dynamic>('metadata', value);

  String? get embedding => getField<String>('embedding');
  set embedding(String? value) => setField<String>('embedding', value);

  String? get firebaseId => getField<String>('firebase_id');
  set firebaseId(String? value) => setField<String>('firebase_id', value);
}
