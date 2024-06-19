import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/product_block_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_information_widget.dart' show ProductInformationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductInformationModel
    extends FlutterFlowModel<ProductInformationWidget> {
  ///  Local state fields for this page.

  List<Color> colors3 = [];
  void addToColors3(Color item) => colors3.add(item);
  void removeFromColors3(Color item) => colors3.remove(item);
  void removeAtIndexFromColors3(int index) => colors3.removeAt(index);
  void insertAtIndexInColors3(int index, Color item) =>
      colors3.insert(index, item);
  void updateColors3AtIndex(int index, Function(Color) updateFn) =>
      colors3[index] = updateFn(colors3[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  Color? colorPicked;
  // Models for product_block dynamic component.
  late FlutterFlowDynamicModels<ProductBlockModel> productBlockModels;
  // Stores action output result for [Backend Call - API (upsert vectors neightn)] action in Button widget.
  ApiCallResponse? upsert;

  @override
  void initState(BuildContext context) {
    productBlockModels = FlutterFlowDynamicModels(() => ProductBlockModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    productBlockModels.dispose();
  }
}
