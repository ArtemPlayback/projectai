import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phoneNumber => getField<String>('phoneNumber');
  set phoneNumber(String? value) => setField<String>('phoneNumber', value);

  List<String> get photos => getListField<String>('photos');
  set photos(List<String>? value) => setListField<String>('photos', value);

  String? get job => getField<String>('job');
  set job(String? value) => setField<String>('job', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  List<String> get tags => getListField<String>('tags');
  set tags(List<String>? value) => setListField<String>('tags', value);

  String? get about => getField<String>('about');
  set about(String? value) => setField<String>('about', value);

  int? get houseRents => getField<int>('houseRents');
  set houseRents(int? value) => setField<int>('houseRents', value);

  int? get reviews => getField<int>('reviews');
  set reviews(int? value) => setField<int>('reviews', value);

  String? get primeTime => getField<String>('primeTime');
  set primeTime(String? value) => setField<String>('primeTime', value);

  bool? get isFull => getField<bool>('isFull');
  set isFull(bool? value) => setField<bool>('isFull', value);

  List<String> get languages => getListField<String>('languages');
  set languages(List<String>? value) =>
      setListField<String>('languages', value);

  String? get firestoreId => getField<String>('firestore_id');
  set firestoreId(String? value) => setField<String>('firestore_id', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);
}
