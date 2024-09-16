import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'delete_account_widget.dart' show DeleteAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteAccountModel extends FlutterFlowModel<DeleteAccountWidget> {
  ///  Local state fields for this component.

  int chatCounter = 0;

  int eventsCounter = 0;

  int productsCounter = 0;

  int? companyCounter;

  String test = 'sdf';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatsRecord>? chats;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<EventsRecord>? events;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductsRecord>? products;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProjectsRecord>? companies;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
