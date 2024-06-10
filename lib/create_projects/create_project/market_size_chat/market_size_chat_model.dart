import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'market_size_chat_widget.dart' show MarketSizeChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MarketSizeChatModel extends FlutterFlowModel<MarketSizeChatWidget> {
  ///  Local state fields for this component.

  List<ChatStruct> chat = [];
  void addToChat(ChatStruct item) => chat.add(item);
  void removeFromChat(ChatStruct item) => chat.remove(item);
  void removeAtIndexFromChat(int index) => chat.removeAt(index);
  void insertAtIndexInChat(int index, ChatStruct item) =>
      chat.insert(index, item);
  void updateChatAtIndex(int index, Function(ChatStruct) updateFn) =>
      chat[index] = updateFn(chat[index]);

  String? message = '';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (market size)] action in marketSizeChat widget.
  ApiCallResponse? marketSizeOld;
  // Stores action output result for [Backend Call - API (monetization)] action in marketSizeChat widget.
  ApiCallResponse? monetizationOld;
  // Stores action output result for [Backend Call - API (marketing plan)] action in marketSizeChat widget.
  ApiCallResponse? marketingPlanOld;
  // Stores action output result for [Backend Call - API (financial plan)] action in marketSizeChat widget.
  ApiCallResponse? financialplanold;
  // Stores action output result for [Backend Call - API (production plan)] action in marketSizeChat widget.
  ApiCallResponse? productionplanold;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (market size)] action in IconButton widget.
  ApiCallResponse? marketSizeOld35;
  // Stores action output result for [Backend Call - API (market size)] action in IconButton widget.
  ApiCallResponse? marketSizOld56;
  // Stores action output result for [Backend Call - API (market size)] action in IconButton widget.
  ApiCallResponse? marketSiszeOld68;
  // Stores action output result for [Backend Call - API (monetization)] action in IconButton widget.
  ApiCallResponse? monetizationChat;
  // Stores action output result for [Backend Call - API (monetization)] action in IconButton widget.
  ApiCallResponse? monetizationChat4;
  // Stores action output result for [Backend Call - API (monetization)] action in IconButton widget.
  ApiCallResponse? monetizationChat5;
  // Stores action output result for [Backend Call - API (marketing plan)] action in IconButton widget.
  ApiCallResponse? marketingplan4;
  // Stores action output result for [Backend Call - API (marketing plan)] action in IconButton widget.
  ApiCallResponse? marketingplan5;
  // Stores action output result for [Backend Call - API (marketing plan)] action in IconButton widget.
  ApiCallResponse? marketingplan6;
  // Stores action output result for [Backend Call - API (financial plan)] action in IconButton widget.
  ApiCallResponse? financialplan3;
  // Stores action output result for [Backend Call - API (financial plan)] action in IconButton widget.
  ApiCallResponse? financialplan4;
  // Stores action output result for [Backend Call - API (financial plan)] action in IconButton widget.
  ApiCallResponse? financialplan5;
  // Stores action output result for [Backend Call - API (production plan)] action in IconButton widget.
  ApiCallResponse? productionPlan3;
  // Stores action output result for [Backend Call - API (production plan)] action in IconButton widget.
  ApiCallResponse? productionPlan4;
  // Stores action output result for [Backend Call - API (production plan)] action in IconButton widget.
  ApiCallResponse? productionPlan5;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? marketSize;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? marketSize2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? marketSize3;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? marketSize4;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectsRecord? marketSize5;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
