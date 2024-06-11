// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PitchdeckStruct extends FFFirebaseStruct {
  PitchdeckStruct({
    String? color,
    String? shortDescription,
    String? firstImageType,
    List<String>? firstImages,
    String? firstImage,
    String? potentialMarket,
    String? operatingIndustry,
    int? neededInvestment,
    String? problemImage,
    String? problemDefinintion,
    List<SolutionsStruct>? solutions,
    String? businessModelChart,
    String? businessModelName,
    String? businessModelDescription,
    List<CashFlowStruct>? cashFlows,
    String? financeChart,
    String? financialGrowth,
    String? marketName,
    String? marketDescription,
    String? marketChartDescription,
    String? marketChart,
    List<CompetitorsStruct>? competitors,
    List<YearsPlanStruct>? fiveYearsPlan,
    String? email,
    String? linkToPrototype,
    String? phoneNumber,
    String? messageToInvestor,
    List<String>? statusAndPlans,
    String? statusDescription,
    String? investorShare,
    int? fiveYearProfit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _color = color,
        _shortDescription = shortDescription,
        _firstImageType = firstImageType,
        _firstImages = firstImages,
        _firstImage = firstImage,
        _potentialMarket = potentialMarket,
        _operatingIndustry = operatingIndustry,
        _neededInvestment = neededInvestment,
        _problemImage = problemImage,
        _problemDefinintion = problemDefinintion,
        _solutions = solutions,
        _businessModelChart = businessModelChart,
        _businessModelName = businessModelName,
        _businessModelDescription = businessModelDescription,
        _cashFlows = cashFlows,
        _financeChart = financeChart,
        _financialGrowth = financialGrowth,
        _marketName = marketName,
        _marketDescription = marketDescription,
        _marketChartDescription = marketChartDescription,
        _marketChart = marketChart,
        _competitors = competitors,
        _fiveYearsPlan = fiveYearsPlan,
        _email = email,
        _linkToPrototype = linkToPrototype,
        _phoneNumber = phoneNumber,
        _messageToInvestor = messageToInvestor,
        _statusAndPlans = statusAndPlans,
        _statusDescription = statusDescription,
        _investorShare = investorShare,
        _fiveYearProfit = fiveYearProfit,
        super(firestoreUtilData);

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;
  bool hasColor() => _color != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  set shortDescription(String? val) => _shortDescription = val;
  bool hasShortDescription() => _shortDescription != null;

  // "firstImageType" field.
  String? _firstImageType;
  String get firstImageType => _firstImageType ?? '';
  set firstImageType(String? val) => _firstImageType = val;
  bool hasFirstImageType() => _firstImageType != null;

  // "firstImages" field.
  List<String>? _firstImages;
  List<String> get firstImages => _firstImages ?? const [];
  set firstImages(List<String>? val) => _firstImages = val;
  void updateFirstImages(Function(List<String>) updateFn) =>
      updateFn(_firstImages ??= []);
  bool hasFirstImages() => _firstImages != null;

  // "firstImage" field.
  String? _firstImage;
  String get firstImage => _firstImage ?? '';
  set firstImage(String? val) => _firstImage = val;
  bool hasFirstImage() => _firstImage != null;

  // "potentialMarket" field.
  String? _potentialMarket;
  String get potentialMarket => _potentialMarket ?? '';
  set potentialMarket(String? val) => _potentialMarket = val;
  bool hasPotentialMarket() => _potentialMarket != null;

  // "operatingIndustry" field.
  String? _operatingIndustry;
  String get operatingIndustry => _operatingIndustry ?? '';
  set operatingIndustry(String? val) => _operatingIndustry = val;
  bool hasOperatingIndustry() => _operatingIndustry != null;

  // "neededInvestment" field.
  int? _neededInvestment;
  int get neededInvestment => _neededInvestment ?? 0;
  set neededInvestment(int? val) => _neededInvestment = val;
  void incrementNeededInvestment(int amount) =>
      _neededInvestment = neededInvestment + amount;
  bool hasNeededInvestment() => _neededInvestment != null;

  // "problemImage" field.
  String? _problemImage;
  String get problemImage => _problemImage ?? '';
  set problemImage(String? val) => _problemImage = val;
  bool hasProblemImage() => _problemImage != null;

  // "problemDefinintion" field.
  String? _problemDefinintion;
  String get problemDefinintion => _problemDefinintion ?? '';
  set problemDefinintion(String? val) => _problemDefinintion = val;
  bool hasProblemDefinintion() => _problemDefinintion != null;

  // "solutions" field.
  List<SolutionsStruct>? _solutions;
  List<SolutionsStruct> get solutions => _solutions ?? const [];
  set solutions(List<SolutionsStruct>? val) => _solutions = val;
  void updateSolutions(Function(List<SolutionsStruct>) updateFn) =>
      updateFn(_solutions ??= []);
  bool hasSolutions() => _solutions != null;

  // "businessModelChart" field.
  String? _businessModelChart;
  String get businessModelChart => _businessModelChart ?? '';
  set businessModelChart(String? val) => _businessModelChart = val;
  bool hasBusinessModelChart() => _businessModelChart != null;

  // "businessModelName" field.
  String? _businessModelName;
  String get businessModelName => _businessModelName ?? '';
  set businessModelName(String? val) => _businessModelName = val;
  bool hasBusinessModelName() => _businessModelName != null;

  // "businessModelDescription" field.
  String? _businessModelDescription;
  String get businessModelDescription => _businessModelDescription ?? '';
  set businessModelDescription(String? val) => _businessModelDescription = val;
  bool hasBusinessModelDescription() => _businessModelDescription != null;

  // "cashFlows" field.
  List<CashFlowStruct>? _cashFlows;
  List<CashFlowStruct> get cashFlows => _cashFlows ?? const [];
  set cashFlows(List<CashFlowStruct>? val) => _cashFlows = val;
  void updateCashFlows(Function(List<CashFlowStruct>) updateFn) =>
      updateFn(_cashFlows ??= []);
  bool hasCashFlows() => _cashFlows != null;

  // "financeChart" field.
  String? _financeChart;
  String get financeChart => _financeChart ?? '';
  set financeChart(String? val) => _financeChart = val;
  bool hasFinanceChart() => _financeChart != null;

  // "financialGrowth" field.
  String? _financialGrowth;
  String get financialGrowth => _financialGrowth ?? '';
  set financialGrowth(String? val) => _financialGrowth = val;
  bool hasFinancialGrowth() => _financialGrowth != null;

  // "marketName" field.
  String? _marketName;
  String get marketName => _marketName ?? '';
  set marketName(String? val) => _marketName = val;
  bool hasMarketName() => _marketName != null;

  // "marketDescription" field.
  String? _marketDescription;
  String get marketDescription => _marketDescription ?? '';
  set marketDescription(String? val) => _marketDescription = val;
  bool hasMarketDescription() => _marketDescription != null;

  // "marketChartDescription" field.
  String? _marketChartDescription;
  String get marketChartDescription => _marketChartDescription ?? '';
  set marketChartDescription(String? val) => _marketChartDescription = val;
  bool hasMarketChartDescription() => _marketChartDescription != null;

  // "marketChart" field.
  String? _marketChart;
  String get marketChart => _marketChart ?? '';
  set marketChart(String? val) => _marketChart = val;
  bool hasMarketChart() => _marketChart != null;

  // "competitors" field.
  List<CompetitorsStruct>? _competitors;
  List<CompetitorsStruct> get competitors => _competitors ?? const [];
  set competitors(List<CompetitorsStruct>? val) => _competitors = val;
  void updateCompetitors(Function(List<CompetitorsStruct>) updateFn) =>
      updateFn(_competitors ??= []);
  bool hasCompetitors() => _competitors != null;

  // "fiveYearsPlan" field.
  List<YearsPlanStruct>? _fiveYearsPlan;
  List<YearsPlanStruct> get fiveYearsPlan => _fiveYearsPlan ?? const [];
  set fiveYearsPlan(List<YearsPlanStruct>? val) => _fiveYearsPlan = val;
  void updateFiveYearsPlan(Function(List<YearsPlanStruct>) updateFn) =>
      updateFn(_fiveYearsPlan ??= []);
  bool hasFiveYearsPlan() => _fiveYearsPlan != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "linkToPrototype" field.
  String? _linkToPrototype;
  String get linkToPrototype => _linkToPrototype ?? '';
  set linkToPrototype(String? val) => _linkToPrototype = val;
  bool hasLinkToPrototype() => _linkToPrototype != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "messageToInvestor" field.
  String? _messageToInvestor;
  String get messageToInvestor => _messageToInvestor ?? '';
  set messageToInvestor(String? val) => _messageToInvestor = val;
  bool hasMessageToInvestor() => _messageToInvestor != null;

  // "statusAndPlans" field.
  List<String>? _statusAndPlans;
  List<String> get statusAndPlans => _statusAndPlans ?? const [];
  set statusAndPlans(List<String>? val) => _statusAndPlans = val;
  void updateStatusAndPlans(Function(List<String>) updateFn) =>
      updateFn(_statusAndPlans ??= []);
  bool hasStatusAndPlans() => _statusAndPlans != null;

  // "statusDescription" field.
  String? _statusDescription;
  String get statusDescription => _statusDescription ?? '';
  set statusDescription(String? val) => _statusDescription = val;
  bool hasStatusDescription() => _statusDescription != null;

  // "InvestorShare" field.
  String? _investorShare;
  String get investorShare => _investorShare ?? '';
  set investorShare(String? val) => _investorShare = val;
  bool hasInvestorShare() => _investorShare != null;

  // "fiveYearProfit" field.
  int? _fiveYearProfit;
  int get fiveYearProfit => _fiveYearProfit ?? 0;
  set fiveYearProfit(int? val) => _fiveYearProfit = val;
  void incrementFiveYearProfit(int amount) =>
      _fiveYearProfit = fiveYearProfit + amount;
  bool hasFiveYearProfit() => _fiveYearProfit != null;

  static PitchdeckStruct fromMap(Map<String, dynamic> data) => PitchdeckStruct(
        color: data['color'] as String?,
        shortDescription: data['shortDescription'] as String?,
        firstImageType: data['firstImageType'] as String?,
        firstImages: getDataList(data['firstImages']),
        firstImage: data['firstImage'] as String?,
        potentialMarket: data['potentialMarket'] as String?,
        operatingIndustry: data['operatingIndustry'] as String?,
        neededInvestment: castToType<int>(data['neededInvestment']),
        problemImage: data['problemImage'] as String?,
        problemDefinintion: data['problemDefinintion'] as String?,
        solutions: getStructList(
          data['solutions'],
          SolutionsStruct.fromMap,
        ),
        businessModelChart: data['businessModelChart'] as String?,
        businessModelName: data['businessModelName'] as String?,
        businessModelDescription: data['businessModelDescription'] as String?,
        cashFlows: getStructList(
          data['cashFlows'],
          CashFlowStruct.fromMap,
        ),
        financeChart: data['financeChart'] as String?,
        financialGrowth: data['financialGrowth'] as String?,
        marketName: data['marketName'] as String?,
        marketDescription: data['marketDescription'] as String?,
        marketChartDescription: data['marketChartDescription'] as String?,
        marketChart: data['marketChart'] as String?,
        competitors: getStructList(
          data['competitors'],
          CompetitorsStruct.fromMap,
        ),
        fiveYearsPlan: getStructList(
          data['fiveYearsPlan'],
          YearsPlanStruct.fromMap,
        ),
        email: data['email'] as String?,
        linkToPrototype: data['linkToPrototype'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        messageToInvestor: data['messageToInvestor'] as String?,
        statusAndPlans: getDataList(data['statusAndPlans']),
        statusDescription: data['statusDescription'] as String?,
        investorShare: data['InvestorShare'] as String?,
        fiveYearProfit: castToType<int>(data['fiveYearProfit']),
      );

  static PitchdeckStruct? maybeFromMap(dynamic data) => data is Map
      ? PitchdeckStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'color': _color,
        'shortDescription': _shortDescription,
        'firstImageType': _firstImageType,
        'firstImages': _firstImages,
        'firstImage': _firstImage,
        'potentialMarket': _potentialMarket,
        'operatingIndustry': _operatingIndustry,
        'neededInvestment': _neededInvestment,
        'problemImage': _problemImage,
        'problemDefinintion': _problemDefinintion,
        'solutions': _solutions?.map((e) => e.toMap()).toList(),
        'businessModelChart': _businessModelChart,
        'businessModelName': _businessModelName,
        'businessModelDescription': _businessModelDescription,
        'cashFlows': _cashFlows?.map((e) => e.toMap()).toList(),
        'financeChart': _financeChart,
        'financialGrowth': _financialGrowth,
        'marketName': _marketName,
        'marketDescription': _marketDescription,
        'marketChartDescription': _marketChartDescription,
        'marketChart': _marketChart,
        'competitors': _competitors?.map((e) => e.toMap()).toList(),
        'fiveYearsPlan': _fiveYearsPlan?.map((e) => e.toMap()).toList(),
        'email': _email,
        'linkToPrototype': _linkToPrototype,
        'phoneNumber': _phoneNumber,
        'messageToInvestor': _messageToInvestor,
        'statusAndPlans': _statusAndPlans,
        'statusDescription': _statusDescription,
        'InvestorShare': _investorShare,
        'fiveYearProfit': _fiveYearProfit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'shortDescription': serializeParam(
          _shortDescription,
          ParamType.String,
        ),
        'firstImageType': serializeParam(
          _firstImageType,
          ParamType.String,
        ),
        'firstImages': serializeParam(
          _firstImages,
          ParamType.String,
          true,
        ),
        'firstImage': serializeParam(
          _firstImage,
          ParamType.String,
        ),
        'potentialMarket': serializeParam(
          _potentialMarket,
          ParamType.String,
        ),
        'operatingIndustry': serializeParam(
          _operatingIndustry,
          ParamType.String,
        ),
        'neededInvestment': serializeParam(
          _neededInvestment,
          ParamType.int,
        ),
        'problemImage': serializeParam(
          _problemImage,
          ParamType.String,
        ),
        'problemDefinintion': serializeParam(
          _problemDefinintion,
          ParamType.String,
        ),
        'solutions': serializeParam(
          _solutions,
          ParamType.DataStruct,
          true,
        ),
        'businessModelChart': serializeParam(
          _businessModelChart,
          ParamType.String,
        ),
        'businessModelName': serializeParam(
          _businessModelName,
          ParamType.String,
        ),
        'businessModelDescription': serializeParam(
          _businessModelDescription,
          ParamType.String,
        ),
        'cashFlows': serializeParam(
          _cashFlows,
          ParamType.DataStruct,
          true,
        ),
        'financeChart': serializeParam(
          _financeChart,
          ParamType.String,
        ),
        'financialGrowth': serializeParam(
          _financialGrowth,
          ParamType.String,
        ),
        'marketName': serializeParam(
          _marketName,
          ParamType.String,
        ),
        'marketDescription': serializeParam(
          _marketDescription,
          ParamType.String,
        ),
        'marketChartDescription': serializeParam(
          _marketChartDescription,
          ParamType.String,
        ),
        'marketChart': serializeParam(
          _marketChart,
          ParamType.String,
        ),
        'competitors': serializeParam(
          _competitors,
          ParamType.DataStruct,
          true,
        ),
        'fiveYearsPlan': serializeParam(
          _fiveYearsPlan,
          ParamType.DataStruct,
          true,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'linkToPrototype': serializeParam(
          _linkToPrototype,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'messageToInvestor': serializeParam(
          _messageToInvestor,
          ParamType.String,
        ),
        'statusAndPlans': serializeParam(
          _statusAndPlans,
          ParamType.String,
          true,
        ),
        'statusDescription': serializeParam(
          _statusDescription,
          ParamType.String,
        ),
        'InvestorShare': serializeParam(
          _investorShare,
          ParamType.String,
        ),
        'fiveYearProfit': serializeParam(
          _fiveYearProfit,
          ParamType.int,
        ),
      }.withoutNulls;

  static PitchdeckStruct fromSerializableMap(Map<String, dynamic> data) =>
      PitchdeckStruct(
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        shortDescription: deserializeParam(
          data['shortDescription'],
          ParamType.String,
          false,
        ),
        firstImageType: deserializeParam(
          data['firstImageType'],
          ParamType.String,
          false,
        ),
        firstImages: deserializeParam<String>(
          data['firstImages'],
          ParamType.String,
          true,
        ),
        firstImage: deserializeParam(
          data['firstImage'],
          ParamType.String,
          false,
        ),
        potentialMarket: deserializeParam(
          data['potentialMarket'],
          ParamType.String,
          false,
        ),
        operatingIndustry: deserializeParam(
          data['operatingIndustry'],
          ParamType.String,
          false,
        ),
        neededInvestment: deserializeParam(
          data['neededInvestment'],
          ParamType.int,
          false,
        ),
        problemImage: deserializeParam(
          data['problemImage'],
          ParamType.String,
          false,
        ),
        problemDefinintion: deserializeParam(
          data['problemDefinintion'],
          ParamType.String,
          false,
        ),
        solutions: deserializeStructParam<SolutionsStruct>(
          data['solutions'],
          ParamType.DataStruct,
          true,
          structBuilder: SolutionsStruct.fromSerializableMap,
        ),
        businessModelChart: deserializeParam(
          data['businessModelChart'],
          ParamType.String,
          false,
        ),
        businessModelName: deserializeParam(
          data['businessModelName'],
          ParamType.String,
          false,
        ),
        businessModelDescription: deserializeParam(
          data['businessModelDescription'],
          ParamType.String,
          false,
        ),
        cashFlows: deserializeStructParam<CashFlowStruct>(
          data['cashFlows'],
          ParamType.DataStruct,
          true,
          structBuilder: CashFlowStruct.fromSerializableMap,
        ),
        financeChart: deserializeParam(
          data['financeChart'],
          ParamType.String,
          false,
        ),
        financialGrowth: deserializeParam(
          data['financialGrowth'],
          ParamType.String,
          false,
        ),
        marketName: deserializeParam(
          data['marketName'],
          ParamType.String,
          false,
        ),
        marketDescription: deserializeParam(
          data['marketDescription'],
          ParamType.String,
          false,
        ),
        marketChartDescription: deserializeParam(
          data['marketChartDescription'],
          ParamType.String,
          false,
        ),
        marketChart: deserializeParam(
          data['marketChart'],
          ParamType.String,
          false,
        ),
        competitors: deserializeStructParam<CompetitorsStruct>(
          data['competitors'],
          ParamType.DataStruct,
          true,
          structBuilder: CompetitorsStruct.fromSerializableMap,
        ),
        fiveYearsPlan: deserializeStructParam<YearsPlanStruct>(
          data['fiveYearsPlan'],
          ParamType.DataStruct,
          true,
          structBuilder: YearsPlanStruct.fromSerializableMap,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        linkToPrototype: deserializeParam(
          data['linkToPrototype'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        messageToInvestor: deserializeParam(
          data['messageToInvestor'],
          ParamType.String,
          false,
        ),
        statusAndPlans: deserializeParam<String>(
          data['statusAndPlans'],
          ParamType.String,
          true,
        ),
        statusDescription: deserializeParam(
          data['statusDescription'],
          ParamType.String,
          false,
        ),
        investorShare: deserializeParam(
          data['InvestorShare'],
          ParamType.String,
          false,
        ),
        fiveYearProfit: deserializeParam(
          data['fiveYearProfit'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PitchdeckStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PitchdeckStruct &&
        color == other.color &&
        shortDescription == other.shortDescription &&
        firstImageType == other.firstImageType &&
        listEquality.equals(firstImages, other.firstImages) &&
        firstImage == other.firstImage &&
        potentialMarket == other.potentialMarket &&
        operatingIndustry == other.operatingIndustry &&
        neededInvestment == other.neededInvestment &&
        problemImage == other.problemImage &&
        problemDefinintion == other.problemDefinintion &&
        listEquality.equals(solutions, other.solutions) &&
        businessModelChart == other.businessModelChart &&
        businessModelName == other.businessModelName &&
        businessModelDescription == other.businessModelDescription &&
        listEquality.equals(cashFlows, other.cashFlows) &&
        financeChart == other.financeChart &&
        financialGrowth == other.financialGrowth &&
        marketName == other.marketName &&
        marketDescription == other.marketDescription &&
        marketChartDescription == other.marketChartDescription &&
        marketChart == other.marketChart &&
        listEquality.equals(competitors, other.competitors) &&
        listEquality.equals(fiveYearsPlan, other.fiveYearsPlan) &&
        email == other.email &&
        linkToPrototype == other.linkToPrototype &&
        phoneNumber == other.phoneNumber &&
        messageToInvestor == other.messageToInvestor &&
        listEquality.equals(statusAndPlans, other.statusAndPlans) &&
        statusDescription == other.statusDescription &&
        investorShare == other.investorShare &&
        fiveYearProfit == other.fiveYearProfit;
  }

  @override
  int get hashCode => const ListEquality().hash([
        color,
        shortDescription,
        firstImageType,
        firstImages,
        firstImage,
        potentialMarket,
        operatingIndustry,
        neededInvestment,
        problemImage,
        problemDefinintion,
        solutions,
        businessModelChart,
        businessModelName,
        businessModelDescription,
        cashFlows,
        financeChart,
        financialGrowth,
        marketName,
        marketDescription,
        marketChartDescription,
        marketChart,
        competitors,
        fiveYearsPlan,
        email,
        linkToPrototype,
        phoneNumber,
        messageToInvestor,
        statusAndPlans,
        statusDescription,
        investorShare,
        fiveYearProfit
      ]);
}

PitchdeckStruct createPitchdeckStruct({
  String? color,
  String? shortDescription,
  String? firstImageType,
  String? firstImage,
  String? potentialMarket,
  String? operatingIndustry,
  int? neededInvestment,
  String? problemImage,
  String? problemDefinintion,
  String? businessModelChart,
  String? businessModelName,
  String? businessModelDescription,
  String? financeChart,
  String? financialGrowth,
  String? marketName,
  String? marketDescription,
  String? marketChartDescription,
  String? marketChart,
  String? email,
  String? linkToPrototype,
  String? phoneNumber,
  String? messageToInvestor,
  String? statusDescription,
  String? investorShare,
  int? fiveYearProfit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PitchdeckStruct(
      color: color,
      shortDescription: shortDescription,
      firstImageType: firstImageType,
      firstImage: firstImage,
      potentialMarket: potentialMarket,
      operatingIndustry: operatingIndustry,
      neededInvestment: neededInvestment,
      problemImage: problemImage,
      problemDefinintion: problemDefinintion,
      businessModelChart: businessModelChart,
      businessModelName: businessModelName,
      businessModelDescription: businessModelDescription,
      financeChart: financeChart,
      financialGrowth: financialGrowth,
      marketName: marketName,
      marketDescription: marketDescription,
      marketChartDescription: marketChartDescription,
      marketChart: marketChart,
      email: email,
      linkToPrototype: linkToPrototype,
      phoneNumber: phoneNumber,
      messageToInvestor: messageToInvestor,
      statusDescription: statusDescription,
      investorShare: investorShare,
      fiveYearProfit: fiveYearProfit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PitchdeckStruct? updatePitchdeckStruct(
  PitchdeckStruct? pitchdeck, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pitchdeck
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPitchdeckStructData(
  Map<String, dynamic> firestoreData,
  PitchdeckStruct? pitchdeck,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pitchdeck == null) {
    return;
  }
  if (pitchdeck.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pitchdeck.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pitchdeckData = getPitchdeckFirestoreData(pitchdeck, forFieldValue);
  final nestedData = pitchdeckData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pitchdeck.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPitchdeckFirestoreData(
  PitchdeckStruct? pitchdeck, [
  bool forFieldValue = false,
]) {
  if (pitchdeck == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pitchdeck.toMap());

  // Add any Firestore field values
  pitchdeck.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPitchdeckListFirestoreData(
  List<PitchdeckStruct>? pitchdecks,
) =>
    pitchdecks?.map((e) => getPitchdeckFirestoreData(e, true)).toList() ?? [];
