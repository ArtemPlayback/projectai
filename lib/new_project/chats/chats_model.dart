import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_chats_widget.dart';
import '/components/navigationbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'chats_widget.dart' show ChatsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatsModel extends FlutterFlowModel<ChatsWidget> {
  ///  Local state fields for this page.

  String chosen = 'Personal';

  int? sdf;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in chats widget.
  List<ChatsRecord>? chats;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;

  @override
  void initState(BuildContext context) {
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navigationbarModel.dispose();
  }
}
