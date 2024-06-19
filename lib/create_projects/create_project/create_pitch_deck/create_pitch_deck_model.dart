import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/business_model_card_widget.dart';
import '/components/comparison_option_widget.dart';
import '/components/competitor_name_widget.dart';
import '/components/competitor_test_widget.dart';
import '/components/concurent_option_widget.dart';
import '/components/option_widget.dart';
import '/components/solution_card_widget.dart';
import '/components/task_widget.dart';
import '/components/team_member_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_pitch_deck_widget.dart' show CreatePitchDeckWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreatePitchDeckModel extends FlutterFlowModel<CreatePitchDeckWidget> {
  ///  Local state fields for this page.

  String? chosenColor = '';

  String firstImagesType = 'mobile screens';

  List<String> firstImagesLinks = [];
  void addToFirstImagesLinks(String item) => firstImagesLinks.add(item);
  void removeFromFirstImagesLinks(String item) => firstImagesLinks.remove(item);
  void removeAtIndexFromFirstImagesLinks(int index) =>
      firstImagesLinks.removeAt(index);
  void insertAtIndexInFirstImagesLinks(int index, String item) =>
      firstImagesLinks.insert(index, item);
  void updateFirstImagesLinksAtIndex(int index, Function(String) updateFn) =>
      firstImagesLinks[index] = updateFn(firstImagesLinks[index]);

  List<SolutionsStruct> solutions = [];
  void addToSolutions(SolutionsStruct item) => solutions.add(item);
  void removeFromSolutions(SolutionsStruct item) => solutions.remove(item);
  void removeAtIndexFromSolutions(int index) => solutions.removeAt(index);
  void insertAtIndexInSolutions(int index, SolutionsStruct item) =>
      solutions.insert(index, item);
  void updateSolutionsAtIndex(int index, Function(SolutionsStruct) updateFn) =>
      solutions[index] = updateFn(solutions[index]);

  String? firstImageLink;

  String? problemImage;

  String? financeChart;

  String? marketChart;

  List<String> currentStatusImages = [];
  void addToCurrentStatusImages(String item) => currentStatusImages.add(item);
  void removeFromCurrentStatusImages(String item) =>
      currentStatusImages.remove(item);
  void removeAtIndexFromCurrentStatusImages(int index) =>
      currentStatusImages.removeAt(index);
  void insertAtIndexInCurrentStatusImages(int index, String item) =>
      currentStatusImages.insert(index, item);
  void updateCurrentStatusImagesAtIndex(int index, Function(String) updateFn) =>
      currentStatusImages[index] = updateFn(currentStatusImages[index]);

  String? businessModelChart;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  final textFieldMask5 = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl6 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  bool isDataUploading7 = false;
  FFUploadedFile uploadedLocalFile7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl7 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode13;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  bool isDataUploading8 = false;
  FFUploadedFile uploadedLocalFile8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl8 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode14;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode15;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode16;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode17;
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode18;
  TextEditingController? textController18;
  String? Function(BuildContext, String?)? textController18Validator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? project;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? ref12;
  // Stores action output result for [Backend Call - API (short description)] action in Button widget.
  ApiCallResponse? shortDescr;
  // Stores action output result for [Backend Call - API (operating industry)] action in Button widget.
  ApiCallResponse? operatingIndustry;
  // Stores action output result for [Backend Call - API (Potential market size)] action in Button widget.
  ApiCallResponse? marketize;
  // Stores action output result for [Backend Call - API (problem definition)] action in Button widget.
  ApiCallResponse? apiResulta1j;
  // Stores action output result for [Backend Call - API (business model name)] action in Button widget.
  ApiCallResponse? businessModelName;
  // Stores action output result for [Backend Call - API (business model description)] action in Button widget.
  ApiCallResponse? businessModeDescription;
  // Stores action output result for [Backend Call - API (market name)] action in Button widget.
  ApiCallResponse? marketName;
  // Stores action output result for [Backend Call - API (market description)] action in Button widget.
  ApiCallResponse? marketDescription;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();

    textFieldFocusNode10?.dispose();
    textController10?.dispose();

    textFieldFocusNode11?.dispose();
    textController11?.dispose();

    textFieldFocusNode12?.dispose();
    textController12?.dispose();

    textFieldFocusNode13?.dispose();
    textController13?.dispose();

    textFieldFocusNode14?.dispose();
    textController14?.dispose();

    textFieldFocusNode15?.dispose();
    textController15?.dispose();

    textFieldFocusNode16?.dispose();
    textController16?.dispose();

    textFieldFocusNode17?.dispose();
    textController17?.dispose();

    textFieldFocusNode18?.dispose();
    textController18?.dispose();
  }
}
