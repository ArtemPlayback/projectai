import '../database.dart';

class UserActivityTable extends SupabaseTable<UserActivityRow> {
  @override
  String get tableName => 'user_activity';

  @override
  UserActivityRow createRow(Map<String, dynamic> data) => UserActivityRow(data);
}

class UserActivityRow extends SupabaseDataRow {
  UserActivityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserActivityTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  List<String> get queries => getListField<String>('queries');
  set queries(List<String>? value) => setListField<String>('queries', value);

  String? get infoAboutUser => getField<String>('info about user');
  set infoAboutUser(String? value) =>
      setField<String>('info about user', value);
}
