import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_product_loading_widget.dart' show CreateProductLoadingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CreateProductLoadingModel
    extends FlutterFlowModel<CreateProductLoadingWidget> {
  ///  Local state fields for this page.

  String? gu;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (create blocks)] action in create_product_loading widget.
  ApiCallResponse? apiResultmga;
  // Stores action output result for [Backend Call - API (upsert vectors neightn)] action in create_product_loading widget.
  ApiCallResponse? upsert;
  // Stores action output result for [Backend Call - Read Document] action in create_product_loading widget.
  ProductsRecord? updated;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
