import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'event_participants_widget.dart' show EventParticipantsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventParticipantsModel extends FlutterFlowModel<EventParticipantsWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
