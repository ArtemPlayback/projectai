import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/company_card/company_card_widget.dart';
import '/sign_in_foulder/new_project/event_card/event_card_widget.dart';
import '/sign_in_foulder/new_project/product_card/product_card_widget.dart';
import '/sign_in_foulder/new_project/user_card_new/user_card_new_widget.dart';
import 'dart:math';
import '/flutter_flow/request_manager.dart';

import 'history_item_widget.dart' show HistoryItemWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HistoryItemModel extends FlutterFlowModel<HistoryItemWidget> {
  ///  Local state fields for this page.

  String chosenState = 'All';

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

  SmartSearchStruct? smartSearchHistoryItem;
  void updateSmartSearchHistoryItemStruct(
      Function(SmartSearchStruct) updateFn) {
    updateFn(smartSearchHistoryItem ??= SmartSearchStruct());
  }

  int? index;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel;

  /// Query cache managers for this widget.

  final _eventManager = FutureRequestManager<List<EventsRecord>>();
  Future<List<EventsRecord>> event({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EventsRecord>> Function() requestFn,
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
    buttonFixedSizeModel = createModel(context, () => ButtonFixedSizeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    buttonFixedSizeModel.dispose();

    /// Dispose query cache managers for this widget.

    clearEventCache();

    clearUserCache();
  }
}
