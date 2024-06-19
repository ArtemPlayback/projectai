import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'create_group_chat_widget.dart' show CreateGroupChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CreateGroupChatModel extends FlutterFlowModel<CreateGroupChatWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> usersList2 = [];
  void addToUsersList2(DocumentReference item) => usersList2.add(item);
  void removeFromUsersList2(DocumentReference item) => usersList2.remove(item);
  void removeAtIndexFromUsersList2(int index) => usersList2.removeAt(index);
  void insertAtIndexInUsersList2(int index, DocumentReference item) =>
      usersList2.insert(index, item);
  void updateUsersList2AtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersList2[index] = updateFn(usersList2[index]);

  bool set = false;

  List<UsersRecord> query = [];
  void addToQuery(UsersRecord item) => query.add(item);
  void removeFromQuery(UsersRecord item) => query.remove(item);
  void removeAtIndexFromQuery(int index) => query.removeAt(index);
  void insertAtIndexInQuery(int index, UsersRecord item) =>
      query.insert(index, item);
  void updateQueryAtIndex(int index, Function(UsersRecord) updateFn) =>
      query[index] = updateFn(query[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - queryUsers] action in create_group_chat widget.
  List<DocumentReference>? usersAction;
  // Stores action output result for [Firestore Query - Query a collection] action in create_group_chat widget.
  List<UsersRecord>? querried;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel;

  @override
  void initState(BuildContext context) {
    buttonInfinityModel = createModel(context, () => ButtonInfinityModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    buttonInfinityModel.dispose();
  }
}
