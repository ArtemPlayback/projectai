import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/expandable_text_new_widget.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'event_card_widget.dart' show EventCardWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventCardModel extends FlutterFlowModel<EventCardWidget> {
  ///  Local state fields for this component.

  List<UsersRecord> users2 = [];
  void addToUsers2(UsersRecord item) => users2.add(item);
  void removeFromUsers2(UsersRecord item) => users2.remove(item);
  void removeAtIndexFromUsers2(int index) => users2.removeAt(index);
  void insertAtIndexInUsers2(int index, UsersRecord item) =>
      users2.insert(index, item);
  void updateUsers2AtIndex(int index, Function(UsersRecord) updateFn) =>
      users2[index] = updateFn(users2[index]);

  bool searched = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - queryDocsAndCheckExistencePeople] action in event_card widget.
  List<UsersRecord>? users;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for toggle component.
  late ToggleModel toggleModel;
  // Model for expandableTextNew component.
  late ExpandableTextNewModel expandableTextNewModel;

  @override
  void initState(BuildContext context) {
    toggleModel = createModel(context, () => ToggleModel());
    expandableTextNewModel =
        createModel(context, () => ExpandableTextNewModel());
  }

  @override
  void dispose() {
    toggleModel.dispose();
    expandableTextNewModel.dispose();
  }
}
