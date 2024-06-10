import '../database.dart';

class SmartSearchRecommendationsTable
    extends SupabaseTable<SmartSearchRecommendationsRow> {
  @override
  String get tableName => 'smart search recommendations';

  @override
  SmartSearchRecommendationsRow createRow(Map<String, dynamic> data) =>
      SmartSearchRecommendationsRow(data);
}

class SmartSearchRecommendationsRow extends SupabaseDataRow {
  SmartSearchRecommendationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SmartSearchRecommendationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get smartsearchResult => getField<String>('smartsearch_result');
  set smartsearchResult(String? value) =>
      setField<String>('smartsearch_result', value);
}
