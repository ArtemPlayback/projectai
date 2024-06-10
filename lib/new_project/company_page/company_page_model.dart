import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/event_card_small_widget.dart';
import '/components/image_slider_widget.dart';
import '/components/information_modal_company_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/navigationbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import '/new_project/create_new_publication/create_new_publication_widget.dart';
import '/new_project/post_card/post_card_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'company_page_widget.dart' show CompanyPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanyPageModel extends FlutterFlowModel<CompanyPageWidget> {
  ///  Local state fields for this page.

  String chosen = 'Images';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in company_page widget.
  List<ProductsRecord>? productsQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in company_page widget.
  List<EventsRecord>? eventsQuery;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel1;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel2;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel1;
  // Stores action output result for [Backend Call - Read Document] action in Image widget.
  UsersRecord? user3;
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
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;
  // Model for navigate_back component.
  late NavigateBackModel navigateBackModel;

  @override
  void initState(BuildContext context) {
    buttonInfinityModel1 = createModel(context, () => ButtonInfinityModel());
    buttonInfinityModel2 = createModel(context, () => ButtonInfinityModel());
    buttonFixedSizeModel1 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel2 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel3 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel4 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel5 = createModel(context, () => ButtonFixedSizeModel());
    navigationbarModel = createModel(context, () => NavigationbarModel());
    navigateBackModel = createModel(context, () => NavigateBackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    buttonInfinityModel1.dispose();
    buttonInfinityModel2.dispose();
    buttonFixedSizeModel1.dispose();
    buttonFixedSizeModel2.dispose();
    buttonFixedSizeModel3.dispose();
    buttonFixedSizeModel4.dispose();
    buttonFixedSizeModel5.dispose();
    navigationbarModel.dispose();
    navigateBackModel.dispose();
  }
}
