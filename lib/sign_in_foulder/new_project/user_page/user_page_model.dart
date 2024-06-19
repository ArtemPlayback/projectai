import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/event_card_small_widget.dart';
import '/components/image_slider_widget.dart';
import '/components/information_modal_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/navigationbar_widget.dart';
import '/components/project_small_card_widget.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import '/sign_in_foulder/new_project/create_new_publication/create_new_publication_widget.dart';
import '/sign_in_foulder/new_project/post_card/post_card_widget.dart';
import '/sign_in_foulder/new_project/user_options/user_options_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'user_page_widget.dart' show UserPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserPageModel extends FlutterFlowModel<UserPageWidget> {
  ///  Local state fields for this page.

  String chosen = 'Images';

  List<SubscriptionsStruct> subscribedPeople = [];
  void addToSubscribedPeople(SubscriptionsStruct item) =>
      subscribedPeople.add(item);
  void removeFromSubscribedPeople(SubscriptionsStruct item) =>
      subscribedPeople.remove(item);
  void removeAtIndexFromSubscribedPeople(int index) =>
      subscribedPeople.removeAt(index);
  void insertAtIndexInSubscribedPeople(int index, SubscriptionsStruct item) =>
      subscribedPeople.insert(index, item);
  void updateSubscribedPeopleAtIndex(
          int index, Function(SubscriptionsStruct) updateFn) =>
      subscribedPeople[index] = updateFn(subscribedPeople[index]);

  bool subscribed = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in user_page widget.
  List<ProductsRecord>? productsQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in user_page widget.
  List<EventsRecord>? eventsQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in user_page widget.
  List<ProjectsRecord>? projectsQuery;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel1;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel2;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel3;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel4;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;
  // Model for navigate_back component.
  late NavigateBackModel navigateBackModel;
  // Model for toggle component.
  late ToggleModel toggleModel;

  @override
  void initState(BuildContext context) {
    buttonInfinityModel1 = createModel(context, () => ButtonInfinityModel());
    buttonInfinityModel2 = createModel(context, () => ButtonInfinityModel());
    buttonInfinityModel3 = createModel(context, () => ButtonInfinityModel());
    buttonInfinityModel4 = createModel(context, () => ButtonInfinityModel());
    buttonFixedSizeModel = createModel(context, () => ButtonFixedSizeModel());
    navigationbarModel = createModel(context, () => NavigationbarModel());
    navigateBackModel = createModel(context, () => NavigateBackModel());
    toggleModel = createModel(context, () => ToggleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    buttonInfinityModel1.dispose();
    buttonInfinityModel2.dispose();
    buttonInfinityModel3.dispose();
    buttonInfinityModel4.dispose();
    buttonFixedSizeModel.dispose();
    navigationbarModel.dispose();
    navigateBackModel.dispose();
    toggleModel.dispose();
  }
}
