import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/delete_team_member_widget.dart';
import '/components/edit_member_widget.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import 'usercard_small_widget.dart' show UsercardSmallWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UsercardSmallModel extends FlutterFlowModel<UsercardSmallWidget> {
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
