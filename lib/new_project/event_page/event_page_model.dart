import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/image_slider_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import 'dart:async';
import 'dart:ui';
import 'event_page_widget.dart' show EventPageWidget;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class EventPageModel extends FlutterFlowModel<EventPageWidget> {
  ///  Local state fields for this page.

  String? whose;

  bool userParticipating = false;

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

  bool userApplied = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in event_page widget.
  UsersRecord? owner;
  // Stores action output result for [Backend Call - Read Document] action in event_page widget.
  ProjectsRecord? company;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel1;
  // Model for navigate_back component.
  late NavigateBackModel navigateBackModel;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel2;

  @override
  void initState(BuildContext context) {
    buttonFixedSizeModel1 = createModel(context, () => ButtonFixedSizeModel());
    navigateBackModel = createModel(context, () => NavigateBackModel());
    buttonFixedSizeModel2 = createModel(context, () => ButtonFixedSizeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    buttonFixedSizeModel1.dispose();
    navigateBackModel.dispose();
    buttonFixedSizeModel2.dispose();
  }
}
