import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
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

  List<ChatsRecord> chats3 = [];
  void addToChats3(ChatsRecord item) => chats3.add(item);
  void removeFromChats3(ChatsRecord item) => chats3.remove(item);
  void removeAtIndexFromChats3(int index) => chats3.removeAt(index);
  void insertAtIndexInChats3(int index, ChatsRecord item) =>
      chats3.insert(index, item);
  void updateChats3AtIndex(int index, Function(ChatsRecord) updateFn) =>
      chats3[index] = updateFn(chats3[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in chats widget.
  List<ChatsRecord>? chats;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    navigationbarModel.dispose();
  }
}
