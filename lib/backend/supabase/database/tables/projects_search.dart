import '../database.dart';

class ProjectsSearchTable extends SupabaseTable<ProjectsSearchRow> {
  @override
  String get tableName => 'projects_search';

  @override
  ProjectsSearchRow createRow(Map<String, dynamic> data) =>
      ProjectsSearchRow(data);
}

class ProjectsSearchRow extends SupabaseDataRow {
  ProjectsSearchRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProjectsSearchTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  dynamic? get metadata => getField<dynamic>('metadata');
  set metadata(dynamic? value) => setField<dynamic>('metadata', value);

  String? get embedding => getField<String>('embedding');
  set embedding(String? value) => setField<String>('embedding', value);

  String? get firestoreId => getField<String>('firestore_id');
  set firestoreId(String? value) => setField<String>('firestore_id', value);
}
