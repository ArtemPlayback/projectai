import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math' as math;
import 'projects_created_widget.dart' show ProjectsCreatedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectsCreatedModel extends FlutterFlowModel<ProjectsCreatedWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? sdf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
