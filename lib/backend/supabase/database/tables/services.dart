import '../database.dart';

class ServicesTable extends SupabaseTable<ServicesRow> {
  @override
  String get tableName => 'Services';

  @override
  ServicesRow createRow(Map<String, dynamic> data) => ServicesRow(data);
}

class ServicesRow extends SupabaseDataRow {
  ServicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServicesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get cost => getField<int>('cost');
  set cost(int? value) => setField<int>('cost', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get photos => getListField<String>('photos');
  set photos(List<String>? value) => setListField<String>('photos', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get test => getField<String>('test');
  set test(String? value) => setField<String>('test', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get userReference => getField<String>('user_reference');
  set userReference(String? value) => setField<String>('user_reference', value);

  int? get roomNumber => getField<int>('roomNumber');
  set roomNumber(int? value) => setField<int>('roomNumber', value);

  int? get area => getField<int>('area');
  set area(int? value) => setField<int>('area', value);

  String? get houseType => getField<String>('HouseType');
  set houseType(String? value) => setField<String>('HouseType', value);

  String? get livingType => getField<String>('LivingType');
  set livingType(String? value) => setField<String>('LivingType', value);

  String? get wiFi => getField<String>('wi-fi');
  set wiFi(String? value) => setField<String>('wi-fi', value);

  String? get kitchen => getField<String>('kitchen');
  set kitchen(String? value) => setField<String>('kitchen', value);

  String? get aironditioning => getField<String>('airСonditioning');
  set aironditioning(String? value) =>
      setField<String>('airСonditioning', value);

  String? get washingMachine => getField<String>('washingMachine');
  set washingMachine(String? value) =>
      setField<String>('washingMachine', value);

  String? get iron => getField<String>('iron');
  set iron(String? value) => setField<String>('iron', value);

  String? get dryer => getField<String>('dryer');
  set dryer(String? value) => setField<String>('dryer', value);

  String? get tv => getField<String>('TV');
  set tv(String? value) => setField<String>('TV', value);

  String? get parking => getField<String>('parking');
  set parking(String? value) => setField<String>('parking', value);

  String? get playground => getField<String>('playground');
  set playground(String? value) => setField<String>('playground', value);

  String? get serviceType => getField<String>('serviceType');
  set serviceType(String? value) => setField<String>('serviceType', value);

  List<String> get language => getListField<String>('language');
  set language(List<String>? value) => setListField<String>('language', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  String? get placeType => getField<String>('PlaceType');
  set placeType(String? value) => setField<String>('PlaceType', value);

  String? get shower => getField<String>('shower');
  set shower(String? value) => setField<String>('shower', value);

  String? get billiards => getField<String>('billiards');
  set billiards(String? value) => setField<String>('billiards', value);

  String? get trainers => getField<String>('trainers');
  set trainers(String? value) => setField<String>('trainers', value);

  String? get sauna => getField<String>('sauna');
  set sauna(String? value) => setField<String>('sauna', value);

  String? get yoga => getField<String>('yoga');
  set yoga(String? value) => setField<String>('yoga', value);

  List<String> get carsType => getListField<String>('carsType');
  set carsType(List<String>? value) => setListField<String>('carsType', value);

  List<String> get carBrand => getListField<String>('carBrand');
  set carBrand(List<String>? value) => setListField<String>('carBrand', value);

  String? get driver => getField<String>('driver');
  set driver(String? value) => setField<String>('driver', value);

  String? get gymPool => getField<String>('gymPool');
  set gymPool(String? value) => setField<String>('gymPool', value);

  String? get housePool => getField<String>('housePool');
  set housePool(String? value) => setField<String>('housePool', value);

  String? get beachType => getField<String>('BeachType');
  set beachType(String? value) => setField<String>('BeachType', value);

  String? get nudistic => getField<String>('nudistic');
  set nudistic(String? value) => setField<String>('nudistic', value);

  String? get wildBeach => getField<String>('wildBeach');
  set wildBeach(String? value) => setField<String>('wildBeach', value);

  String? get fishes => getField<String>('fishes');
  set fishes(String? value) => setField<String>('fishes', value);

  String? get artificialWaters => getField<String>('artificialWaters');
  set artificialWaters(String? value) =>
      setField<String>('artificialWaters', value);

  String? get bar => getField<String>('bar');
  set bar(String? value) => setField<String>('bar', value);

  String? get aquapark => getField<String>('aquapark');
  set aquapark(String? value) => setField<String>('aquapark', value);

  String? get surfing => getField<String>('surfing');
  set surfing(String? value) => setField<String>('surfing', value);

  String? get sportGround => getField<String>('sportGround');
  set sportGround(String? value) => setField<String>('sportGround', value);

  String? get childrenSector => getField<String>('childrenSector');
  set childrenSector(String? value) =>
      setField<String>('childrenSector', value);

  String? get grill => getField<String>('grill');
  set grill(String? value) => setField<String>('grill', value);

  String? get rescuers => getField<String>('rescuers');
  set rescuers(String? value) => setField<String>('rescuers', value);

  String? get serviceZone => getField<String>('serviceZone');
  set serviceZone(String? value) => setField<String>('serviceZone', value);

  String? get campingType => getField<String>('campingType');
  set campingType(String? value) => setField<String>('campingType', value);

  String? get nightTrip => getField<String>('nightTrip');
  set nightTrip(String? value) => setField<String>('nightTrip', value);

  List<String> get excursionType => getListField<String>('excursionType');
  set excursionType(List<String>? value) =>
      setListField<String>('excursionType', value);

  List<String> get extra => getListField<String>('extra');
  set extra(List<String>? value) => setListField<String>('extra', value);

  int? get photoPeopleCount => getField<int>('photoPeopleCount');
  set photoPeopleCount(int? value) => setField<int>('photoPeopleCount', value);

  List<String> get karaokeSongLangiuage =>
      getListField<String>('karaokeSongLangiuage');
  set karaokeSongLangiuage(List<String>? value) =>
      setListField<String>('karaokeSongLangiuage', value);

  String? get schoolType => getField<String>('schoolType');
  set schoolType(String? value) => setField<String>('schoolType', value);

  List<String> get universityType => getListField<String>('universityType');
  set universityType(List<String>? value) =>
      setListField<String>('universityType', value);

  List<String> get criteries => getListField<String>('criteries');
  set criteries(List<String>? value) =>
      setListField<String>('criteries', value);

  List<int> get kindergardenAge => getListField<int>('kindergardenAge');
  set kindergardenAge(List<int>? value) =>
      setListField<int>('kindergardenAge', value);

  String? get courseType => getField<String>('courseType');
  set courseType(String? value) => setField<String>('courseType', value);

  List<String> get age => getListField<String>('age');
  set age(List<String>? value) => setListField<String>('age', value);

  List<String> get cousin => getListField<String>('cousin');
  set cousin(List<String>? value) => setListField<String>('cousin', value);

  String? get finance => getField<String>('finance');
  set finance(String? value) => setField<String>('finance', value);

  int? get duration => getField<int>('duration');
  set duration(int? value) => setField<int>('duration', value);

  String? get workTimeStart => getField<String>('workTimeStart');
  set workTimeStart(String? value) => setField<String>('workTimeStart', value);

  String? get workTimeEnd => getField<String>('workTimeEnd');
  set workTimeEnd(String? value) => setField<String>('workTimeEnd', value);

  List<String> get sportGames => getListField<String>('sportGames');
  set sportGames(List<String>? value) =>
      setListField<String>('sportGames', value);

  bool? get isFull => getField<bool>('isFull');
  set isFull(bool? value) => setField<bool>('isFull', value);

  String? get owner => getField<String>('owner');
  set owner(String? value) => setField<String>('owner', value);
}
