import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/list_events_or_products_widget.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'company_card_widget.dart' show CompanyCardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanyCardModel extends FlutterFlowModel<CompanyCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for toggle component.
  late ToggleModel toggleModel;

  @override
  void initState(BuildContext context) {
    toggleModel = createModel(context, () => ToggleModel());
  }

  @override
  void dispose() {
    toggleModel.dispose();
  }
}
