import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/navigationbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/company_card/company_card_widget.dart';
import '/new_project/event_card/event_card_widget.dart';
import '/new_project/product_card/product_card_widget.dart';
import '/new_project/user_card_new/user_card_new_widget.dart';
import 'dart:async';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'smart_search_all2_widget.dart' show SmartSearchAll2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SmartSearchAll2Model extends FlutterFlowModel<SmartSearchAll2Widget> {
  ///  Local state fields for this page.

  String chosenState = 'News';

  List<SearchItemStruct> searchResults = [];
  void addToSearchResults(SearchItemStruct item) => searchResults.add(item);
  void removeFromSearchResults(SearchItemStruct item) =>
      searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);
  void insertAtIndexInSearchResults(int index, SearchItemStruct item) =>
      searchResults.insert(index, item);
  void updateSearchResultsAtIndex(
          int index, Function(SearchItemStruct) updateFn) =>
      searchResults[index] = updateFn(searchResults[index]);

  bool showGIF = false;

  String? str = '';

  String state = 'all';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (smart search neightn)] action in smart_search_all_2 widget.
  ApiCallResponse? smartsearch2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (smart search )] action in TextField widget.
  ApiCallResponse? searchSubmit;
  // Stores action output result for [Backend Call - API (smart search neightn)] action in IconButton widget.
  ApiCallResponse? smartsearch;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;

  /// Query cache managers for this widget.

  final _eventManager = StreamRequestManager<List<EventsRecord>>();
  Stream<List<EventsRecord>> event({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventsRecord>> Function() requestFn,
  }) =>
      _eventManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventCache() => _eventManager.clear();
  void clearEventCacheKey(String? uniqueKey) =>
      _eventManager.clearRequest(uniqueKey);

  final _userManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> user({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _userManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserCache() => _userManager.clear();
  void clearUserCacheKey(String? uniqueKey) =>
      _userManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navigationbarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearEventCache();

    clearUserCache();
  }
}
