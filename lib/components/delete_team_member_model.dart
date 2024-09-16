import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'delete_team_member_widget.dart' show DeleteTeamMemberWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteTeamMemberModel extends FlutterFlowModel<DeleteTeamMemberWidget> {
  ///  Local state fields for this component.

  List<TeamMemberStruct> teamMembers = [];
  void addToTeamMembers(TeamMemberStruct item) => teamMembers.add(item);
  void removeFromTeamMembers(TeamMemberStruct item) => teamMembers.remove(item);
  void removeAtIndexFromTeamMembers(int index) => teamMembers.removeAt(index);
  void insertAtIndexInTeamMembers(int index, TeamMemberStruct item) =>
      teamMembers.insert(index, item);
  void updateTeamMembersAtIndex(
          int index, Function(TeamMemberStruct) updateFn) =>
      teamMembers[index] = updateFn(teamMembers[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
