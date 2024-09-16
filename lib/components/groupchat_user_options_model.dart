import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'groupchat_user_options_widget.dart' show GroupchatUserOptionsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroupchatUserOptionsModel
    extends FlutterFlowModel<GroupchatUserOptionsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  ChatsRecord? readChat;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  ChatsRecord? readChat2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
