import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/history_item_options_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'history_item_widget.dart' show HistoryItemWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryItemModel extends FlutterFlowModel<HistoryItemWidget> {
  ///  Local state fields for this component.

  bool isEditing = false;

  String? text;

  SmartsearchSessionStruct? currentSession;
  void updateCurrentSessionStruct(Function(SmartsearchSessionStruct) updateFn) {
    updateFn(currentSession ??= SmartsearchSessionStruct());
  }

  List<SmartsearchSessionStruct> sessions = [];
  void addToSessions(SmartsearchSessionStruct item) => sessions.add(item);
  void removeFromSessions(SmartsearchSessionStruct item) =>
      sessions.remove(item);
  void removeAtIndexFromSessions(int index) => sessions.removeAt(index);
  void insertAtIndexInSessions(int index, SmartsearchSessionStruct item) =>
      sessions.insert(index, item);
  void updateSessionsAtIndex(
          int index, Function(SmartsearchSessionStruct) updateFn) =>
      sessions[index] = updateFn(sessions[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
