import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_card_small_widget.dart' show ProductCardSmallWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCardSmallModel extends FlutterFlowModel<ProductCardSmallWidget> {
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
