import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_chat_widget.dart';
import '/components/empty_chats_widget.dart';
import '/components/navigationbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'chats_widget.dart' show ChatsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatsModel extends FlutterFlowModel<ChatsWidget> {
  ///  Local state fields for this page.

  String chosen = 'Personal';

  int? sdf;

  List<ChatsRecord> chats3 = [];
  void addToChats3(ChatsRecord item) => chats3.add(item);
  void removeFromChats3(ChatsRecord item) => chats3.remove(item);
  void removeAtIndexFromChats3(int index) => chats3.removeAt(index);
  void insertAtIndexInChats3(int index, ChatsRecord item) =>
      chats3.insert(index, item);
  void updateChats3AtIndex(int index, Function(ChatsRecord) updateFn) =>
      chats3[index] = updateFn(chats3[index]);

  List<ProjectsRecord> projects = [];
  void addToProjects(ProjectsRecord item) => projects.add(item);
  void removeFromProjects(ProjectsRecord item) => projects.remove(item);
  void removeAtIndexFromProjects(int index) => projects.removeAt(index);
  void insertAtIndexInProjects(int index, ProjectsRecord item) =>
      projects.insert(index, item);
  void updateProjectsAtIndex(int index, Function(ProjectsRecord) updateFn) =>
      projects[index] = updateFn(projects[index]);

  bool queryCache = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in chats widget.
  List<ChatsRecord>? chats;
  // Stores action output result for [Custom Action - queryProjects] action in chats widget.
  List<ProjectsRecord>? projectsQueried;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;

  @override
  void initState(BuildContext context) {
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    navigationbarModel.dispose();
  }
}
