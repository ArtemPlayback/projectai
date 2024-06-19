import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:ui';
import 'edit_member_widget.dart' show EditMemberWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditMemberModel extends FlutterFlowModel<EditMemberWidget> {
  ///  Local state fields for this component.

  List<TeamMemberStruct> team = [];
  void addToTeam(TeamMemberStruct item) => team.add(item);
  void removeFromTeam(TeamMemberStruct item) => team.remove(item);
  void removeAtIndexFromTeam(int index) => team.removeAt(index);
  void insertAtIndexInTeam(int index, TeamMemberStruct item) =>
      team.insert(index, item);
  void updateTeamAtIndex(int index, Function(TeamMemberStruct) updateFn) =>
      team[index] = updateFn(team[index]);

  TeamMemberStruct? member;
  void updateMemberStruct(Function(TeamMemberStruct) updateFn) {
    updateFn(member ??= TeamMemberStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel;

  @override
  void initState(BuildContext context) {
    buttonInfinityModel = createModel(context, () => ButtonInfinityModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    buttonInfinityModel.dispose();
  }
}
