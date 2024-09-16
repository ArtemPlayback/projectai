import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'subscribers_mini_widget.dart' show SubscribersMiniWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscribersMiniModel extends FlutterFlowModel<SubscribersMiniWidget> {
  ///  Local state fields for this component.

  List<String> usersExists2 = [];
  void addToUsersExists2(String item) => usersExists2.add(item);
  void removeFromUsersExists2(String item) => usersExists2.remove(item);
  void removeAtIndexFromUsersExists2(int index) => usersExists2.removeAt(index);
  void insertAtIndexInUsersExists2(int index, String item) =>
      usersExists2.insert(index, item);
  void updateUsersExists2AtIndex(int index, Function(String) updateFn) =>
      usersExists2[index] = updateFn(usersExists2[index]);

  bool show = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkUsersExists] action in subscribersMini widget.
  List<String>? usersExist;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
