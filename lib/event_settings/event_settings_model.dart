import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_event_product_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math' as math;
import 'event_settings_widget.dart' show EventSettingsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventSettingsModel extends FlutterFlowModel<EventSettingsWidget> {
  ///  Local state fields for this page.

  bool isNameChanging = false;

  bool pushes = false;

  String? cover;

  String? image;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
