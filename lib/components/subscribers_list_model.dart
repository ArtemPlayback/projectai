import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'subscribers_list_widget.dart' show SubscribersListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SubscribersListModel extends FlutterFlowModel<SubscribersListWidget> {
  ///  Local state fields for this component.

  List<InvitesStruct> invites = [];
  void addToInvites(InvitesStruct item) => invites.add(item);
  void removeFromInvites(InvitesStruct item) => invites.remove(item);
  void removeAtIndexFromInvites(int index) => invites.removeAt(index);
  void insertAtIndexInInvites(int index, InvitesStruct item) =>
      invites.insert(index, item);
  void updateInvitesAtIndex(int index, Function(InvitesStruct) updateFn) =>
      invites[index] = updateFn(invites[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in subscribers_list widget.
  List<UsersRecord>? querried;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
