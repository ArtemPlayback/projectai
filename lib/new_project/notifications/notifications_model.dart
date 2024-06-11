import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/notification_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import 'dart:async';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this page.

  String? message = '';

  List<NotificationsStruct> notifications3 = [];
  void addToNotifications3(NotificationsStruct item) =>
      notifications3.add(item);
  void removeFromNotifications3(NotificationsStruct item) =>
      notifications3.remove(item);
  void removeAtIndexFromNotifications3(int index) =>
      notifications3.removeAt(index);
  void insertAtIndexInNotifications3(int index, NotificationsStruct item) =>
      notifications3.insert(index, item);
  void updateNotifications3AtIndex(
          int index, Function(NotificationsStruct) updateFn) =>
      notifications3[index] = updateFn(notifications3[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel;

  @override
  void initState(BuildContext context) {
    buttonFixedSizeModel = createModel(context, () => ButtonFixedSizeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    buttonFixedSizeModel.dispose();
  }
}
