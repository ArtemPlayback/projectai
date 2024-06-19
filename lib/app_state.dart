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
  set solutions(List<SolutionsStruct> value) {
    _solutions = value;
  }

  void addToSolutions(SolutionsStruct value) {
    solutions.add(value);
  }

  void removeFromSolutions(SolutionsStruct value) {
    solutions.remove(value);
  }

  void removeAtIndexFromSolutions(int index) {
    solutions.removeAt(index);
  }

  void updateSolutionsAtIndex(
    int index,
    SolutionsStruct Function(SolutionsStruct) updateFn,
  ) {
    solutions[index] = updateFn(_solutions[index]);
  }

  void insertAtIndexInSolutions(int index, SolutionsStruct value) {
    solutions.insert(index, value);
  }

  List<CashFlowStruct> _cashFlows = [];
  List<CashFlowStruct> get cashFlows => _cashFlows;
  set cashFlows(List<CashFlowStruct> value) {
    _cashFlows = value;
  }

  void addToCashFlows(CashFlowStruct value) {
    cashFlows.add(value);
  }

  void removeFromCashFlows(CashFlowStruct value) {
    cashFlows.remove(value);
  }

  void removeAtIndexFromCashFlows(int index) {
    cashFlows.removeAt(index);
  }

  void updateCashFlowsAtIndex(
    int index,
    CashFlowStruct Function(CashFlowStruct) updateFn,
  ) {
    cashFlows[index] = updateFn(_cashFlows[index]);
  }

  void insertAtIndexInCashFlows(int index, CashFlowStruct value) {
    cashFlows.insert(index, value);
  }

  List<YearsPlanStruct> _yearsPlan = [];
  List<YearsPlanStruct> get yearsPlan => _yearsPlan;
  set yearsPlan(List<YearsPlanStruct> value) {
    _yearsPlan = value;
  }

  void addToYearsPlan(YearsPlanStruct value) {
    yearsPlan.add(value);
  }

  void removeFromYearsPlan(YearsPlanStruct value) {
    yearsPlan.remove(value);
  }

  void removeAtIndexFromYearsPlan(int index) {
    yearsPlan.removeAt(index);
  }

  void updateYearsPlanAtIndex(
    int index,
    YearsPlanStruct Function(YearsPlanStruct) updateFn,
  ) {
    yearsPlan[index] = updateFn(_yearsPlan[index]);
  }

  void insertAtIndexInYearsPlan(int index, YearsPlanStruct value) {
    yearsPlan.insert(index, value);
  }

  List<TeamMemberStruct> _teamMembers = [];
  List<TeamMemberStruct> get teamMembers => _teamMembers;
  set teamMembers(List<TeamMemberStruct> value) {
    _teamMembers = value;
  }

  void addToTeamMembers(TeamMemberStruct value) {
    teamMembers.add(value);
  }

  void removeFromTeamMembers(TeamMemberStruct value) {
    teamMembers.remove(value);
  }

  void removeAtIndexFromTeamMembers(int index) {
    teamMembers.removeAt(index);
  }

  void updateTeamMembersAtIndex(
    int index,
    TeamMemberStruct Function(TeamMemberStruct) updateFn,
  ) {
    teamMembers[index] = updateFn(_teamMembers[index]);
  }

  void insertAtIndexInTeamMembers(int index, TeamMemberStruct value) {
    teamMembers.insert(index, value);
  }

  List<CompetitorsStruct> _competitors = [];
  List<CompetitorsStruct> get competitors => _competitors;
  set competitors(List<CompetitorsStruct> value) {
    _competitors = value;
  }

  void addToCompetitors(CompetitorsStruct value) {
    competitors.add(value);
  }

  void removeFromCompetitors(CompetitorsStruct value) {
    competitors.remove(value);
  }

  void removeAtIndexFromCompetitors(int index) {
    competitors.removeAt(index);
  }

  void updateCompetitorsAtIndex(
    int index,
    CompetitorsStruct Function(CompetitorsStruct) updateFn,
  ) {
    competitors[index] = updateFn(_competitors[index]);
  }

  void insertAtIndexInCompetitors(int index, CompetitorsStruct value) {
    competitors.insert(index, value);
  }

  List<String> _comparisonOptions = [];
  List<String> get comparisonOptions => _comparisonOptions;
  set comparisonOptions(List<String> value) {
    _comparisonOptions = value;
  }

  void addToComparisonOptions(String value) {
    comparisonOptions.add(value);
  }

  void removeFromComparisonOptions(String value) {
    comparisonOptions.remove(value);
  }

  void removeAtIndexFromComparisonOptions(int index) {
    comparisonOptions.removeAt(index);
  }

  void updateComparisonOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    comparisonOptions[index] = updateFn(_comparisonOptions[index]);
  }

  void insertAtIndexInComparisonOptions(int index, String value) {
    comparisonOptions.insert(index, value);
  }

  List<CompetitorOptionsStruct> _myOptions = [];
  List<CompetitorOptionsStruct> get myOptions => _myOptions;
  set myOptions(List<CompetitorOptionsStruct> value) {
    _myOptions = value;
  }

  void addToMyOptions(CompetitorOptionsStruct value) {
    myOptions.add(value);
  }

  void removeFromMyOptions(CompetitorOptionsStruct value) {
    myOptions.remove(value);
  }

  void removeAtIndexFromMyOptions(int index) {
    myOptions.removeAt(index);
  }

  void updateMyOptionsAtIndex(
    int index,
    CompetitorOptionsStruct Function(CompetitorOptionsStruct) updateFn,
  ) {
    myOptions[index] = updateFn(_myOptions[index]);
  }

  void insertAtIndexInMyOptions(int index, CompetitorOptionsStruct value) {
    myOptions.insert(index, value);
  }

  List<CompetitorOptionsStruct> _projectOptions = [];
  List<CompetitorOptionsStruct> get projectOptions => _projectOptions;
  set projectOptions(List<CompetitorOptionsStruct> value) {
    _projectOptions = value;
  }

  void addToProjectOptions(CompetitorOptionsStruct value) {
    projectOptions.add(value);
  }

  void removeFromProjectOptions(CompetitorOptionsStruct value) {
    projectOptions.remove(value);
  }

  void removeAtIndexFromProjectOptions(int index) {
    projectOptions.removeAt(index);
  }

  void updateProjectOptionsAtIndex(
    int index,
    CompetitorOptionsStruct Function(CompetitorOptionsStruct) updateFn,
  ) {
    projectOptions[index] = updateFn(_projectOptions[index]);
  }

  void insertAtIndexInProjectOptions(int index, CompetitorOptionsStruct value) {
    projectOptions.insert(index, value);
  }

  List<CompetitorOptionsStruct> _commonOptions = [];
  List<CompetitorOptionsStruct> get commonOptions => _commonOptions;
  set commonOptions(List<CompetitorOptionsStruct> value) {
    _commonOptions = value;
  }

  void addToCommonOptions(CompetitorOptionsStruct value) {
    commonOptions.add(value);
  }

  void removeFromCommonOptions(CompetitorOptionsStruct value) {
    commonOptions.remove(value);
  }

  void removeAtIndexFromCommonOptions(int index) {
    commonOptions.removeAt(index);
  }

  void updateCommonOptionsAtIndex(
    int index,
    CompetitorOptionsStruct Function(CompetitorOptionsStruct) updateFn,
  ) {
    commonOptions[index] = updateFn(_commonOptions[index]);
  }

  void insertAtIndexInCommonOptions(int index, CompetitorOptionsStruct value) {
    commonOptions.insert(index, value);
  }

  List<TestCompetitorsStruct> _testCompetitors = [];
  List<TestCompetitorsStruct> get testCompetitors => _testCompetitors;
  set testCompetitors(List<TestCompetitorsStruct> value) {
    _testCompetitors = value;
  }

  void addToTestCompetitors(TestCompetitorsStruct value) {
    testCompetitors.add(value);
  }

  void removeFromTestCompetitors(TestCompetitorsStruct value) {
    testCompetitors.remove(value);
  }

  void removeAtIndexFromTestCompetitors(int index) {
    testCompetitors.removeAt(index);
  }

  void updateTestCompetitorsAtIndex(
    int index,
    TestCompetitorsStruct Function(TestCompetitorsStruct) updateFn,
  ) {
    testCompetitors[index] = updateFn(_testCompetitors[index]);
  }

  void insertAtIndexInTestCompetitors(int index, TestCompetitorsStruct value) {
    testCompetitors.insert(index, value);
  }

  String _jsonList = '';
  String get jsonList => _jsonList;
  set jsonList(String value) {
    _jsonList = value;
  }

  String _test = '';
  String get test => _test;
  set test(String value) {
    _test = value;
  }

  String _smartNetworking = '';
  String get smartNetworking => _smartNetworking;
  set smartNetworking(String value) {
    _smartNetworking = value;
  }

  bool _onBoarding = false;
  bool get onBoarding => _onBoarding;
  set onBoarding(bool value) {
    _onBoarding = value;
    prefs.setBool('ff_onBoarding', value);
  }

  List<EducationStruct> _education = [];
  List<EducationStruct> get education => _education;
  set education(List<EducationStruct> value) {
    _education = value;
  }

  void addToEducation(EducationStruct value) {
    education.add(value);
  }

  void removeFromEducation(EducationStruct value) {
    education.remove(value);
  }

  void removeAtIndexFromEducation(int index) {
    education.removeAt(index);
  }

  void updateEducationAtIndex(
    int index,
    EducationStruct Function(EducationStruct) updateFn,
  ) {
    education[index] = updateFn(_education[index]);
  }

  void insertAtIndexInEducation(int index, EducationStruct value) {
    education.insert(index, value);
  }

  List<ExperienceStruct> _experience = [];
  List<ExperienceStruct> get experience => _experience;
  set experience(List<ExperienceStruct> value) {
    _experience = value;
  }

  void addToExperience(ExperienceStruct value) {
    experience.add(value);
  }

  void removeFromExperience(ExperienceStruct value) {
    experience.remove(value);
  }

  void removeAtIndexFromExperience(int index) {
    experience.removeAt(index);
  }

  void updateExperienceAtIndex(
    int index,
    ExperienceStruct Function(ExperienceStruct) updateFn,
  ) {
    experience[index] = updateFn(_experience[index]);
  }

  void insertAtIndexInExperience(int index, ExperienceStruct value) {
    experience.insert(index, value);
  }

  List<QuestionsStruct> _questions = [];
  List<QuestionsStruct> get questions => _questions;
  set questions(List<QuestionsStruct> value) {
    _questions = value;
  }

  void addToQuestions(QuestionsStruct value) {
    questions.add(value);
  }

  void removeFromQuestions(QuestionsStruct value) {
    questions.remove(value);
  }

  void removeAtIndexFromQuestions(int index) {
    questions.removeAt(index);
  }

  void updateQuestionsAtIndex(
    int index,
    QuestionsStruct Function(QuestionsStruct) updateFn,
  ) {
    questions[index] = updateFn(_questions[index]);
  }

  void insertAtIndexInQuestions(int index, QuestionsStruct value) {
    questions.insert(index, value);
  }

  List<SectionStruct> _sections = [];
  List<SectionStruct> get sections => _sections;
  set sections(List<SectionStruct> value) {
    _sections = value;
  }

  void addToSections(SectionStruct value) {
    sections.add(value);
  }

  void removeFromSections(SectionStruct value) {
    sections.remove(value);
  }

  void removeAtIndexFromSections(int index) {
    sections.removeAt(index);
  }

  void updateSectionsAtIndex(
    int index,
    SectionStruct Function(SectionStruct) updateFn,
  ) {
    sections[index] = updateFn(_sections[index]);
  }

  void insertAtIndexInSections(int index, SectionStruct value) {
    sections.insert(index, value);
  }

  String _hintText = '';
  String get hintText => _hintText;
  set hintText(String value) {
    _hintText = value;
  }

  List<Color> _colors = [];
  List<Color> get colors => _colors;
  set colors(List<Color> value) {
    _colors = value;
  }

  void addToColors(Color value) {
    colors.add(value);
  }

  void removeFromColors(Color value) {
    colors.remove(value);
  }

  void removeAtIndexFromColors(int index) {
    colors.removeAt(index);
  }

  void updateColorsAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    colors[index] = updateFn(_colors[index]);
  }

  void insertAtIndexInColors(int index, Color value) {
    colors.insert(index, value);
  }

  List<ProductInfoAIStruct> _productInfo = [];
  List<ProductInfoAIStruct> get productInfo => _productInfo;
  set productInfo(List<ProductInfoAIStruct> value) {
    _productInfo = value;
  }

  void addToProductInfo(ProductInfoAIStruct value) {
    productInfo.add(value);
  }

  void removeFromProductInfo(ProductInfoAIStruct value) {
    productInfo.remove(value);
  }

  void removeAtIndexFromProductInfo(int index) {
    productInfo.removeAt(index);
  }

  void updateProductInfoAtIndex(
    int index,
    ProductInfoAIStruct Function(ProductInfoAIStruct) updateFn,
  ) {
    productInfo[index] = updateFn(_productInfo[index]);
  }

  void insertAtIndexInProductInfo(int index, ProductInfoAIStruct value) {
    productInfo.insert(index, value);
  }

  int _test23 = 0;
  int get test23 => _test23;
  set test23(int value) {
    _test23 = value;
  }

  String _voiceMessageUrl = '';
  String get voiceMessageUrl => _voiceMessageUrl;
  set voiceMessageUrl(String value) {
    _voiceMessageUrl = value;
  }

  String _currentMessageID = '';
  String get currentMessageID => _currentMessageID;
  set currentMessageID(String value) {
    _currentMessageID = value;
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
