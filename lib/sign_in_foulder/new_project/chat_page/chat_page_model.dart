import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/image_slider_widget.dart';
import '/components/message_options_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  Local state fields for this page.

  String? message = '';

  int? counterNotReadMessages;

  List<ChatMessagesStruct> dataType = [];
  void addToDataType(ChatMessagesStruct item) => dataType.add(item);
  void removeFromDataType(ChatMessagesStruct item) => dataType.remove(item);
  void removeAtIndexFromDataType(int index) => dataType.removeAt(index);
  void insertAtIndexInDataType(int index, ChatMessagesStruct item) =>
      dataType.insert(index, item);
  void updateDataTypeAtIndex(
          int index, Function(ChatMessagesStruct) updateFn) =>
      dataType[index] = updateFn(dataType[index]);

  bool showList = false;

  DocumentReference? docrefToUse;

  int? whatway = 34;

  ChatsRecord? chatDocument;

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  bool sent = true;

  String test = 'nothing';

  bool isRecording = false;

  Color color = Color(1279998447);

  bool drawer = false;

  bool add = false;

  bool showMic = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in chat_page widget.
  ChatsRecord? querried;
  // Stores action output result for [Backend Call - Create Document] action in chat_page widget.
  ChatsRecord? newDoc2;
  // Stores action output result for [Custom Action - queryCollectionForChats] action in chat_page widget.
  DocumentReference? querriedDoc;
  // Stores action output result for [Backend Call - Read Document] action in chat_page widget.
  ChatsRecord? doc;
  // Stores action output result for [Backend Call - Create Document] action in chat_page widget.
  ChatsRecord? newDoc;
  // Stores action output result for [Backend Call - Read Document] action in chat_page widget.
  ChatsRecord? query;
  // State field(s) for chat_column widget.
  ScrollController? chatColumn;
  // State field(s) for Row widget.
  ScrollController? rowController;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (smart search messages)] action in IconButton widget.
  ApiCallResponse? aiapi;

  @override
  void initState(BuildContext context) {
    chatColumn = ScrollController();
    rowController = ScrollController();
    columnController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    chatColumn?.dispose();
    rowController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    columnController?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
