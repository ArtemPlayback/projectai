import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math' as math;
import 'projects_created_pitch_deck_widget.dart'
    show ProjectsCreatedPitchDeckWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectsCreatedPitchDeckModel
    extends FlutterFlowModel<ProjectsCreatedPitchDeckWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? sdf;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? vfd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
