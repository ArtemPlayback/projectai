import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import 'team_widget.dart' show TeamWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamModel extends FlutterFlowModel<TeamWidget> {
  ///  Local state fields for this component.

  UsersRecord? chosenUser;

  int? teamIndex;

  List<TeamMemberStruct> team2 = [];
  void addToTeam2(TeamMemberStruct item) => team2.add(item);
  void removeFromTeam2(TeamMemberStruct item) => team2.remove(item);
  void removeAtIndexFromTeam2(int index) => team2.removeAt(index);
  void insertAtIndexInTeam2(int index, TeamMemberStruct item) =>
      team2.insert(index, item);
  void updateTeam2AtIndex(int index, Function(TeamMemberStruct) updateFn) =>
      team2[index] = updateFn(team2[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ProjectsRecord? read;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ProjectsRecord? readCopy;

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
