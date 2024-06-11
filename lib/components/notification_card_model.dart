import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'notification_card_widget.dart' show NotificationCardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationCardModel extends FlutterFlowModel<NotificationCardWidget> {
  ///  Local state fields for this component.

  TeamMemberStatus? componentStatus = TeamMemberStatus.isWaiting;

  List<NotificationsStruct> notifications = [];
  void addToNotifications(NotificationsStruct item) => notifications.add(item);
  void removeFromNotifications(NotificationsStruct item) =>
      notifications.remove(item);
  void removeAtIndexFromNotifications(int index) =>
      notifications.removeAt(index);
  void insertAtIndexInNotifications(int index, NotificationsStruct item) =>
      notifications.insert(index, item);
  void updateNotificationsAtIndex(
          int index, Function(NotificationsStruct) updateFn) =>
      notifications[index] = updateFn(notifications[index]);

  List<InvitesStruct> invites = [];
  void addToInvites(InvitesStruct item) => invites.add(item);
  void removeFromInvites(InvitesStruct item) => invites.remove(item);
  void removeAtIndexFromInvites(int index) => invites.removeAt(index);
  void insertAtIndexInInvites(int index, InvitesStruct item) =>
      invites.insert(index, item);
  void updateInvitesAtIndex(int index, Function(InvitesStruct) updateFn) =>
      invites[index] = updateFn(invites[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
