import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'qa_chat_widget.dart' show QaChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QaChatModel extends FlutterFlowModel<QaChatWidget> {
  ///  Local state fields for this component.

  String? message;

  EventsRecord? event;

  AichatStruct? aichat;
  void updateAichatStruct(Function(AichatStruct) updateFn) {
    updateFn(aichat ??= AichatStruct());
  }

  List<ChatMessagesStruct> chatmessages = [];
  void addToChatmessages(ChatMessagesStruct item) => chatmessages.add(item);
  void removeFromChatmessages(ChatMessagesStruct item) =>
      chatmessages.remove(item);
  void removeAtIndexFromChatmessages(int index) => chatmessages.removeAt(index);
  void insertAtIndexInChatmessages(int index, ChatMessagesStruct item) =>
      chatmessages.insert(index, item);
  void updateChatmessagesAtIndex(
          int index, Function(ChatMessagesStruct) updateFn) =>
      chatmessages[index] = updateFn(chatmessages[index]);

  List<AichatStruct> aichats = [];
  void addToAichats(AichatStruct item) => aichats.add(item);
  void removeFromAichats(AichatStruct item) => aichats.remove(item);
  void removeAtIndexFromAichats(int index) => aichats.removeAt(index);
  void insertAtIndexInAichats(int index, AichatStruct item) =>
      aichats.insert(index, item);
  void updateAichatsAtIndex(int index, Function(AichatStruct) updateFn) =>
      aichats[index] = updateFn(aichats[index]);

  DocumentReference? docref;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in qa_chat widget.
  AiChatsRecord? eventchat;
  // Stores action output result for [Backend Call - Create Document] action in qa_chat widget.
  AiChatsRecord? aichat2;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (QA Bot)] action in IconButton widget.
  ApiCallResponse? qa;

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
