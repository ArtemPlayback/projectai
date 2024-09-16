import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/history_item_widget.dart';
import '/components/navigationbar_widget.dart';
import '/components/short_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/sign_in_foulder/new_project/company_card/company_card_widget.dart';
import '/sign_in_foulder/new_project/event_card/event_card_widget.dart';
import '/sign_in_foulder/new_project/product_card/product_card_widget.dart';
import '/sign_in_foulder/new_project/user_card_new/user_card_new_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'smart_search_all2_widget.dart' show SmartSearchAll2Widget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SmartSearchAll2Model extends FlutterFlowModel<SmartSearchAll2Widget> {
  ///  Local state fields for this page.

  bool showGIF = false;

  String? partialJson;

  List<dynamic> messages = [];
  void addToMessages(dynamic item) => messages.add(item);
  void removeFromMessages(dynamic item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, dynamic item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(dynamic) updateFn) =>
      messages[index] = updateFn(messages[index]);

  SmartsearchSessionStruct? smartsearchSession;
  void updateSmartsearchSessionStruct(
      Function(SmartsearchSessionStruct) updateFn) {
    updateFn(smartsearchSession ??= SmartsearchSessionStruct());
  }

  String? message;

  String? lastQuery;

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  List<SmartsearchSessionStruct> smartSearchSessions = [];
  void addToSmartSearchSessions(SmartsearchSessionStruct item) =>
      smartSearchSessions.add(item);
  void removeFromSmartSearchSessions(SmartsearchSessionStruct item) =>
      smartSearchSessions.remove(item);
  void removeAtIndexFromSmartSearchSessions(int index) =>
      smartSearchSessions.removeAt(index);
  void insertAtIndexInSmartSearchSessions(
          int index, SmartsearchSessionStruct item) =>
      smartSearchSessions.insert(index, item);
  void updateSmartSearchSessionsAtIndex(
          int index, Function(SmartsearchSessionStruct) updateFn) =>
      smartSearchSessions[index] = updateFn(smartSearchSessions[index]);

  String test = '1';

  List<String> emptyImages = [];
  void addToEmptyImages(String item) => emptyImages.add(item);
  void removeFromEmptyImages(String item) => emptyImages.remove(item);
  void removeAtIndexFromEmptyImages(int index) => emptyImages.removeAt(index);
  void insertAtIndexInEmptyImages(int index, String item) =>
      emptyImages.insert(index, item);
  void updateEmptyImagesAtIndex(int index, Function(String) updateFn) =>
      emptyImages[index] = updateFn(emptyImages[index]);

  List<String> suggestions = [
    'Search for early-stage startups in the AI industry',
    'Search for investors specializing in early-stage tech ventures',
    'Recommend networking events for venture capitalists',
    'Find experts in app development for small businesses',
    'Find real estate agents specializing in relocation services'
  ];
  void addToSuggestions(String item) => suggestions.add(item);
  void removeFromSuggestions(String item) => suggestions.remove(item);
  void removeAtIndexFromSuggestions(int index) => suggestions.removeAt(index);
  void insertAtIndexInSuggestions(int index, String item) =>
      suggestions.insert(index, item);
  void updateSuggestionsAtIndex(int index, Function(String) updateFn) =>
      suggestions[index] = updateFn(suggestions[index]);

  String? retrieveVectorsPageState;

  bool sessionIsFinished = true;

  bool voiceIsOn = false;

  List<PlanItemStruct> planItems = [];
  void addToPlanItems(PlanItemStruct item) => planItems.add(item);
  void removeFromPlanItems(PlanItemStruct item) => planItems.remove(item);
  void removeAtIndexFromPlanItems(int index) => planItems.removeAt(index);
  void insertAtIndexInPlanItems(int index, PlanItemStruct item) =>
      planItems.insert(index, item);
  void updatePlanItemsAtIndex(int index, Function(PlanItemStruct) updateFn) =>
      planItems[index] = updateFn(planItems[index]);

  String? planPartialJson;

  List<dynamic> planMessages = [];
  void addToPlanMessages(dynamic item) => planMessages.add(item);
  void removeFromPlanMessages(dynamic item) => planMessages.remove(item);
  void removeAtIndexFromPlanMessages(int index) => planMessages.removeAt(index);
  void insertAtIndexInPlanMessages(int index, dynamic item) =>
      planMessages.insert(index, item);
  void updatePlanMessagesAtIndex(int index, Function(dynamic) updateFn) =>
      planMessages[index] = updateFn(planMessages[index]);

  List<dynamic> planItemJson = [];
  void addToPlanItemJson(dynamic item) => planItemJson.add(item);
  void removeFromPlanItemJson(dynamic item) => planItemJson.remove(item);
  void removeAtIndexFromPlanItemJson(int index) => planItemJson.removeAt(index);
  void insertAtIndexInPlanItemJson(int index, dynamic item) =>
      planItemJson.insert(index, item);
  void updatePlanItemJsonAtIndex(int index, Function(dynamic) updateFn) =>
      planItemJson[index] = updateFn(planItemJson[index]);

  int counter = 0;

  String? infoForSearch;

  bool drawer = false;

  bool toScroll = false;

  bool clickedOnTextfield = false;

  bool searchSearches = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ColumnForListView widget.
  ScrollController? columnForListView;
  // State field(s) for ListViewSmartSearch widget.
  ScrollController? listViewSmartSearch;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (OpenAI gpt big)] action in IconButton widget.
  ApiCallResponse? plan;
  // Stores action output result for [Backend Call - API (OpenAI gpt big)] action in IconButton widget.
  ApiCallResponse? alternativeCopyCopy2;
  // Stores action output result for [Backend Call - API (single smart search)] action in IconButton widget.
  ApiCallResponse? retrieveVectors1Copy;
  // Stores action output result for [Backend Call - API (single smart search)] action in IconButton widget.
  ApiCallResponse? retrieveVectors2Copy;
  // Stores action output result for [Backend Call - API (single smart search)] action in IconButton widget.
  ApiCallResponse? retrieveVectors3Copy;
  // Stores action output result for [Backend Call - API (single smart search)] action in IconButton widget.
  ApiCallResponse? retrieveVectors4Copy;
  // Stores action output result for [Backend Call - API (single smart search)] action in IconButton widget.
  ApiCallResponse? retrieveVectors5Copy;
  // Stores action output result for [Backend Call - API (create name for users query)] action in IconButton widget.
  ApiCallResponse? name;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    columnForListView = ScrollController();
    listViewSmartSearch = ScrollController();
    listViewController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    columnForListView?.dispose();
    listViewSmartSearch?.dispose();
    listViewController?.dispose();
    rowController1?.dispose();
    rowController2?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    navigationbarModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
