import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/create_projects/create_project/market_size_chat/market_size_chat_widget.dart';
import '/create_projects/projects_created_pitch_deck/projects_created_pitch_deck_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_business_plan_widget.dart' show CreateBusinessPlanWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreateBusinessPlanModel
    extends FlutterFlowModel<CreateBusinessPlanWidget> {
  ///  Local state fields for this page.

  String? cover;

  String? test = '';

  ProjectsRecord? doc;

  int indexPageView = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? dfgg5;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? read23;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? proj;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ProjectsRecord? read;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ProjectsRecord? vgf;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? read25;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? vgf5;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? gfdg5;

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
  }
}
