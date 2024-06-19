import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/event_card_small_widget.dart';
import '/components/navigationbar_widget.dart';
import '/components/product_card_small_widget.dart';
import '/components/project_small_card_widget.dart';
import '/components/usercard_small_widget.dart';
import '/components/wishlist_events_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/event_card/event_card_widget.dart';
import 'wishlist_widget.dart' show WishlistWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishlistModel extends FlutterFlowModel<WishlistWidget> {
  ///  Local state fields for this page.

  String chosenState = 'Saved';

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
  // Stores action output result for [Firestore Query - Query a collection] action in wishlist widget.
  List<EventsRecord>? events;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel1;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel2;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;

  @override
  void initState(BuildContext context) {
    buttonFixedSizeModel1 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel2 = createModel(context, () => ButtonFixedSizeModel());
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    buttonFixedSizeModel1.dispose();
    buttonFixedSizeModel2.dispose();
    navigationbarModel.dispose();
  }
}
