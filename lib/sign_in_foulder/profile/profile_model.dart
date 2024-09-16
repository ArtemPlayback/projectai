import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/company_small_card_widget.dart';
import '/components/event_card_small_widget.dart';
import '/components/image_slider_widget.dart';
import '/components/information_modal_widget.dart';
import '/components/list_events_or_products_widget.dart';
import '/components/navigationbar_widget.dart';
import '/components/subscribers_mini_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import '/sign_in_foulder/new_project/create_new_publication/create_new_publication_widget.dart';
import '/sign_in_foulder/new_project/post_card/post_card_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_widget.dart' show ProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  String chosen = 'Images';

  List<String> images3 = [];
  void addToImages3(String item) => images3.add(item);
  void removeFromImages3(String item) => images3.remove(item);
  void removeAtIndexFromImages3(int index) => images3.removeAt(index);
  void insertAtIndexInImages3(int index, String item) =>
      images3.insert(index, item);
  void updateImages3AtIndex(int index, Function(String) updateFn) =>
      images3[index] = updateFn(images3[index]);

  bool showSubs = false;

  ///  State fields for stateful widgets in this page.

  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel1;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? userSubs;
  // Model for subscribersMini component.
  late SubscribersMiniModel subscribersMiniModel;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel1;
  // Stores action output result for [Backend Call - Read Document] action in button_fixed_size widget.
  UsersRecord? user;
  // Stores action output result for [Backend Call - Read Document] action in Image widget.
  UsersRecord? user3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Image widget.
  List<String>? images4;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel2;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel3;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel4;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel5;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel6;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;

  @override
  void initState(BuildContext context) {
    buttonInfinityModel1 = createModel(context, () => ButtonInfinityModel());
    buttonInfinityModel2 = createModel(context, () => ButtonInfinityModel());
    subscribersMiniModel = createModel(context, () => SubscribersMiniModel());
    buttonFixedSizeModel1 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel2 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel3 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel4 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel5 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel6 = createModel(context, () => ButtonFixedSizeModel());
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    buttonInfinityModel1.dispose();
    buttonInfinityModel2.dispose();
    subscribersMiniModel.dispose();
    buttonFixedSizeModel1.dispose();
    buttonFixedSizeModel2.dispose();
    buttonFixedSizeModel3.dispose();
    buttonFixedSizeModel4.dispose();
    buttonFixedSizeModel5.dispose();
    buttonFixedSizeModel6.dispose();
    navigationbarModel.dispose();
  }
}
