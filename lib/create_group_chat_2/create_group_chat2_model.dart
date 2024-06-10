import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:ui';
import 'create_group_chat2_widget.dart' show CreateGroupChat2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGroupChat2Model extends FlutterFlowModel<CreateGroupChat2Widget> {
  ///  Local state fields for this page.

  List<DocumentReference> usersList = [];
  void addToUsersList(DocumentReference item) => usersList.add(item);
  void removeFromUsersList(DocumentReference item) => usersList.remove(item);
  void removeAtIndexFromUsersList(int index) => usersList.removeAt(index);
  void insertAtIndexInUsersList(int index, DocumentReference item) =>
      usersList.insert(index, item);
  void updateUsersListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersList[index] = updateFn(usersList[index]);

  String image =
      'https://cdn.raceroster.com/assets/images/team-placeholder.png';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel;
  // Stores action output result for [Backend Call - Create Document] action in button_infinity widget.
  ChatsRecord? groupchat;

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
