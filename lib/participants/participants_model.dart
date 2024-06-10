import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list_widget_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'participants_widget.dart' show ParticipantsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParticipantsModel extends FlutterFlowModel<ParticipantsWidget> {
  ///  Local state fields for this page.

  List<ParticipantsStruct> participants = [];
  void addToParticipants(ParticipantsStruct item) => participants.add(item);
  void removeFromParticipants(ParticipantsStruct item) =>
      participants.remove(item);
  void removeAtIndexFromParticipants(int index) => participants.removeAt(index);
  void insertAtIndexInParticipants(int index, ParticipantsStruct item) =>
      participants.insert(index, item);
  void updateParticipantsAtIndex(
          int index, Function(ParticipantsStruct) updateFn) =>
      participants[index] = updateFn(participants[index]);

  List<ParticipantsStruct> appliedToJoin = [];
  void addToAppliedToJoin(ParticipantsStruct item) => appliedToJoin.add(item);
  void removeFromAppliedToJoin(ParticipantsStruct item) =>
      appliedToJoin.remove(item);
  void removeAtIndexFromAppliedToJoin(int index) =>
      appliedToJoin.removeAt(index);
  void insertAtIndexInAppliedToJoin(int index, ParticipantsStruct item) =>
      appliedToJoin.insert(index, item);
  void updateAppliedToJoinAtIndex(
          int index, Function(ParticipantsStruct) updateFn) =>
      appliedToJoin[index] = updateFn(appliedToJoin[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
