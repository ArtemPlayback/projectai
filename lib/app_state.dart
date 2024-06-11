import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _onBoarding = prefs.getBool('ff_onBoarding') ?? _onBoarding;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<SolutionsStruct> _solutions = [];
  List<SolutionsStruct> get solutions => _solutions;
  set solutions(List<SolutionsStruct> _value) {
    _solutions = _value;
  }

  void addToSolutions(SolutionsStruct _value) {
    _solutions.add(_value);
  }

  void removeFromSolutions(SolutionsStruct _value) {
    _solutions.remove(_value);
  }

  void removeAtIndexFromSolutions(int _index) {
    _solutions.removeAt(_index);
  }

  void updateSolutionsAtIndex(
    int _index,
    SolutionsStruct Function(SolutionsStruct) updateFn,
  ) {
    _solutions[_index] = updateFn(_solutions[_index]);
  }

  void insertAtIndexInSolutions(int _index, SolutionsStruct _value) {
    _solutions.insert(_index, _value);
  }

  List<CashFlowStruct> _cashFlows = [];
  List<CashFlowStruct> get cashFlows => _cashFlows;
  set cashFlows(List<CashFlowStruct> _value) {
    _cashFlows = _value;
  }

  void addToCashFlows(CashFlowStruct _value) {
    _cashFlows.add(_value);
  }

  void removeFromCashFlows(CashFlowStruct _value) {
    _cashFlows.remove(_value);
  }

  void removeAtIndexFromCashFlows(int _index) {
    _cashFlows.removeAt(_index);
  }

  void updateCashFlowsAtIndex(
    int _index,
    CashFlowStruct Function(CashFlowStruct) updateFn,
  ) {
    _cashFlows[_index] = updateFn(_cashFlows[_index]);
  }

  void insertAtIndexInCashFlows(int _index, CashFlowStruct _value) {
    _cashFlows.insert(_index, _value);
  }

  List<YearsPlanStruct> _yearsPlan = [];
  List<YearsPlanStruct> get yearsPlan => _yearsPlan;
  set yearsPlan(List<YearsPlanStruct> _value) {
    _yearsPlan = _value;
  }

  void addToYearsPlan(YearsPlanStruct _value) {
    _yearsPlan.add(_value);
  }

  void removeFromYearsPlan(YearsPlanStruct _value) {
    _yearsPlan.remove(_value);
  }

  void removeAtIndexFromYearsPlan(int _index) {
    _yearsPlan.removeAt(_index);
  }

  void updateYearsPlanAtIndex(
    int _index,
    YearsPlanStruct Function(YearsPlanStruct) updateFn,
  ) {
    _yearsPlan[_index] = updateFn(_yearsPlan[_index]);
  }

  void insertAtIndexInYearsPlan(int _index, YearsPlanStruct _value) {
    _yearsPlan.insert(_index, _value);
  }

  List<TeamMemberStruct> _teamMembers = [];
  List<TeamMemberStruct> get teamMembers => _teamMembers;
  set teamMembers(List<TeamMemberStruct> _value) {
    _teamMembers = _value;
  }

  void addToTeamMembers(TeamMemberStruct _value) {
    _teamMembers.add(_value);
  }

  void removeFromTeamMembers(TeamMemberStruct _value) {
    _teamMembers.remove(_value);
  }

  void removeAtIndexFromTeamMembers(int _index) {
    _teamMembers.removeAt(_index);
  }

  void updateTeamMembersAtIndex(
    int _index,
    TeamMemberStruct Function(TeamMemberStruct) updateFn,
  ) {
    _teamMembers[_index] = updateFn(_teamMembers[_index]);
  }

  void insertAtIndexInTeamMembers(int _index, TeamMemberStruct _value) {
    _teamMembers.insert(_index, _value);
  }

  List<CompetitorsStruct> _competitors = [];
  List<CompetitorsStruct> get competitors => _competitors;
  set competitors(List<CompetitorsStruct> _value) {
    _competitors = _value;
  }

  void addToCompetitors(CompetitorsStruct _value) {
    _competitors.add(_value);
  }

  void removeFromCompetitors(CompetitorsStruct _value) {
    _competitors.remove(_value);
  }

  void removeAtIndexFromCompetitors(int _index) {
    _competitors.removeAt(_index);
  }

  void updateCompetitorsAtIndex(
    int _index,
    CompetitorsStruct Function(CompetitorsStruct) updateFn,
  ) {
    _competitors[_index] = updateFn(_competitors[_index]);
  }

  void insertAtIndexInCompetitors(int _index, CompetitorsStruct _value) {
    _competitors.insert(_index, _value);
  }

  List<String> _comparisonOptions = [];
  List<String> get comparisonOptions => _comparisonOptions;
  set comparisonOptions(List<String> _value) {
    _comparisonOptions = _value;
  }

  void addToComparisonOptions(String _value) {
    _comparisonOptions.add(_value);
  }

  void removeFromComparisonOptions(String _value) {
    _comparisonOptions.remove(_value);
  }

  void removeAtIndexFromComparisonOptions(int _index) {
    _comparisonOptions.removeAt(_index);
  }

  void updateComparisonOptionsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _comparisonOptions[_index] = updateFn(_comparisonOptions[_index]);
  }

  void insertAtIndexInComparisonOptions(int _index, String _value) {
    _comparisonOptions.insert(_index, _value);
  }

  List<CompetitorOptionsStruct> _myOptions = [];
  List<CompetitorOptionsStruct> get myOptions => _myOptions;
  set myOptions(List<CompetitorOptionsStruct> _value) {
    _myOptions = _value;
  }

  void addToMyOptions(CompetitorOptionsStruct _value) {
    _myOptions.add(_value);
  }

  void removeFromMyOptions(CompetitorOptionsStruct _value) {
    _myOptions.remove(_value);
  }

  void removeAtIndexFromMyOptions(int _index) {
    _myOptions.removeAt(_index);
  }

  void updateMyOptionsAtIndex(
    int _index,
    CompetitorOptionsStruct Function(CompetitorOptionsStruct) updateFn,
  ) {
    _myOptions[_index] = updateFn(_myOptions[_index]);
  }

  void insertAtIndexInMyOptions(int _index, CompetitorOptionsStruct _value) {
    _myOptions.insert(_index, _value);
  }

  List<CompetitorOptionsStruct> _projectOptions = [];
  List<CompetitorOptionsStruct> get projectOptions => _projectOptions;
  set projectOptions(List<CompetitorOptionsStruct> _value) {
    _projectOptions = _value;
  }

  void addToProjectOptions(CompetitorOptionsStruct _value) {
    _projectOptions.add(_value);
  }

  void removeFromProjectOptions(CompetitorOptionsStruct _value) {
    _projectOptions.remove(_value);
  }

  void removeAtIndexFromProjectOptions(int _index) {
    _projectOptions.removeAt(_index);
  }

  void updateProjectOptionsAtIndex(
    int _index,
    CompetitorOptionsStruct Function(CompetitorOptionsStruct) updateFn,
  ) {
    _projectOptions[_index] = updateFn(_projectOptions[_index]);
  }

  void insertAtIndexInProjectOptions(
      int _index, CompetitorOptionsStruct _value) {
    _projectOptions.insert(_index, _value);
  }

  List<CompetitorOptionsStruct> _commonOptions = [];
  List<CompetitorOptionsStruct> get commonOptions => _commonOptions;
  set commonOptions(List<CompetitorOptionsStruct> _value) {
    _commonOptions = _value;
  }

  void addToCommonOptions(CompetitorOptionsStruct _value) {
    _commonOptions.add(_value);
  }

  void removeFromCommonOptions(CompetitorOptionsStruct _value) {
    _commonOptions.remove(_value);
  }

  void removeAtIndexFromCommonOptions(int _index) {
    _commonOptions.removeAt(_index);
  }

  void updateCommonOptionsAtIndex(
    int _index,
    CompetitorOptionsStruct Function(CompetitorOptionsStruct) updateFn,
  ) {
    _commonOptions[_index] = updateFn(_commonOptions[_index]);
  }

  void insertAtIndexInCommonOptions(
      int _index, CompetitorOptionsStruct _value) {
    _commonOptions.insert(_index, _value);
  }

  List<TestCompetitorsStruct> _testCompetitors = [];
  List<TestCompetitorsStruct> get testCompetitors => _testCompetitors;
  set testCompetitors(List<TestCompetitorsStruct> _value) {
    _testCompetitors = _value;
  }

  void addToTestCompetitors(TestCompetitorsStruct _value) {
    _testCompetitors.add(_value);
  }

  void removeFromTestCompetitors(TestCompetitorsStruct _value) {
    _testCompetitors.remove(_value);
  }

  void removeAtIndexFromTestCompetitors(int _index) {
    _testCompetitors.removeAt(_index);
  }

  void updateTestCompetitorsAtIndex(
    int _index,
    TestCompetitorsStruct Function(TestCompetitorsStruct) updateFn,
  ) {
    _testCompetitors[_index] = updateFn(_testCompetitors[_index]);
  }

  void insertAtIndexInTestCompetitors(
      int _index, TestCompetitorsStruct _value) {
    _testCompetitors.insert(_index, _value);
  }

  String _jsonList = '';
  String get jsonList => _jsonList;
  set jsonList(String _value) {
    _jsonList = _value;
  }

  String _test = '';
  String get test => _test;
  set test(String _value) {
    _test = _value;
  }

  String _smartNetworking = '';
  String get smartNetworking => _smartNetworking;
  set smartNetworking(String _value) {
    _smartNetworking = _value;
  }

  bool _onBoarding = false;
  bool get onBoarding => _onBoarding;
  set onBoarding(bool _value) {
    _onBoarding = _value;
    prefs.setBool('ff_onBoarding', _value);
  }

  List<EducationStruct> _education = [];
  List<EducationStruct> get education => _education;
  set education(List<EducationStruct> _value) {
    _education = _value;
  }

  void addToEducation(EducationStruct _value) {
    _education.add(_value);
  }

  void removeFromEducation(EducationStruct _value) {
    _education.remove(_value);
  }

  void removeAtIndexFromEducation(int _index) {
    _education.removeAt(_index);
  }

  void updateEducationAtIndex(
    int _index,
    EducationStruct Function(EducationStruct) updateFn,
  ) {
    _education[_index] = updateFn(_education[_index]);
  }

  void insertAtIndexInEducation(int _index, EducationStruct _value) {
    _education.insert(_index, _value);
  }

  List<ExperienceStruct> _experience = [];
  List<ExperienceStruct> get experience => _experience;
  set experience(List<ExperienceStruct> _value) {
    _experience = _value;
  }

  void addToExperience(ExperienceStruct _value) {
    _experience.add(_value);
  }

  void removeFromExperience(ExperienceStruct _value) {
    _experience.remove(_value);
  }

  void removeAtIndexFromExperience(int _index) {
    _experience.removeAt(_index);
  }

  void updateExperienceAtIndex(
    int _index,
    ExperienceStruct Function(ExperienceStruct) updateFn,
  ) {
    _experience[_index] = updateFn(_experience[_index]);
  }

  void insertAtIndexInExperience(int _index, ExperienceStruct _value) {
    _experience.insert(_index, _value);
  }

  List<QuestionsStruct> _questions = [];
  List<QuestionsStruct> get questions => _questions;
  set questions(List<QuestionsStruct> _value) {
    _questions = _value;
  }

  void addToQuestions(QuestionsStruct _value) {
    _questions.add(_value);
  }

  void removeFromQuestions(QuestionsStruct _value) {
    _questions.remove(_value);
  }

  void removeAtIndexFromQuestions(int _index) {
    _questions.removeAt(_index);
  }

  void updateQuestionsAtIndex(
    int _index,
    QuestionsStruct Function(QuestionsStruct) updateFn,
  ) {
    _questions[_index] = updateFn(_questions[_index]);
  }

  void insertAtIndexInQuestions(int _index, QuestionsStruct _value) {
    _questions.insert(_index, _value);
  }

  List<SectionStruct> _sections = [];
  List<SectionStruct> get sections => _sections;
  set sections(List<SectionStruct> _value) {
    _sections = _value;
  }

  void addToSections(SectionStruct _value) {
    _sections.add(_value);
  }

  void removeFromSections(SectionStruct _value) {
    _sections.remove(_value);
  }

  void removeAtIndexFromSections(int _index) {
    _sections.removeAt(_index);
  }

  void updateSectionsAtIndex(
    int _index,
    SectionStruct Function(SectionStruct) updateFn,
  ) {
    _sections[_index] = updateFn(_sections[_index]);
  }

  void insertAtIndexInSections(int _index, SectionStruct _value) {
    _sections.insert(_index, _value);
  }

  String _hintText = '';
  String get hintText => _hintText;
  set hintText(String _value) {
    _hintText = _value;
  }

  List<Color> _colors = [];
  List<Color> get colors => _colors;
  set colors(List<Color> _value) {
    _colors = _value;
  }

  void addToColors(Color _value) {
    _colors.add(_value);
  }

  void removeFromColors(Color _value) {
    _colors.remove(_value);
  }

  void removeAtIndexFromColors(int _index) {
    _colors.removeAt(_index);
  }

  void updateColorsAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _colors[_index] = updateFn(_colors[_index]);
  }

  void insertAtIndexInColors(int _index, Color _value) {
    _colors.insert(_index, _value);
  }

  List<ProductInfoAIStruct> _productInfo = [];
  List<ProductInfoAIStruct> get productInfo => _productInfo;
  set productInfo(List<ProductInfoAIStruct> _value) {
    _productInfo = _value;
  }

  void addToProductInfo(ProductInfoAIStruct _value) {
    _productInfo.add(_value);
  }

  void removeFromProductInfo(ProductInfoAIStruct _value) {
    _productInfo.remove(_value);
  }

  void removeAtIndexFromProductInfo(int _index) {
    _productInfo.removeAt(_index);
  }

  void updateProductInfoAtIndex(
    int _index,
    ProductInfoAIStruct Function(ProductInfoAIStruct) updateFn,
  ) {
    _productInfo[_index] = updateFn(_productInfo[_index]);
  }

  void insertAtIndexInProductInfo(int _index, ProductInfoAIStruct _value) {
    _productInfo.insert(_index, _value);
  }

  int _test23 = 0;
  int get test23 => _test23;
  set test23(int _value) {
    _test23 = _value;
  }

  String _voiceMessageUrl = '';
  String get voiceMessageUrl => _voiceMessageUrl;
  set voiceMessageUrl(String _value) {
    _voiceMessageUrl = _value;
  }

  final _projectsProfileManager = FutureRequestManager<List<ProjectsRecord>>();
  Future<List<ProjectsRecord>> projectsProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProjectsRecord>> Function() requestFn,
  }) =>
      _projectsProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProjectsProfileCache() => _projectsProfileManager.clear();
  void clearProjectsProfileCacheKey(String? uniqueKey) =>
      _projectsProfileManager.clearRequest(uniqueKey);

  final _eventsProfileManager = FutureRequestManager<List<EventsRecord>>();
  Future<List<EventsRecord>> eventsProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EventsRecord>> Function() requestFn,
  }) =>
      _eventsProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventsProfileCache() => _eventsProfileManager.clear();
  void clearEventsProfileCacheKey(String? uniqueKey) =>
      _eventsProfileManager.clearRequest(uniqueKey);

  final _productsProfileManager = FutureRequestManager<List<ProductsRecord>>();
  Future<List<ProductsRecord>> productsProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProductsRecord>> Function() requestFn,
  }) =>
      _productsProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductsProfileCache() => _productsProfileManager.clear();
  void clearProductsProfileCacheKey(String? uniqueKey) =>
      _productsProfileManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
