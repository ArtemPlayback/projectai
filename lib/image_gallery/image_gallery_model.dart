import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/image_slider_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'image_gallery_widget.dart' show ImageGalleryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImageGalleryModel extends FlutterFlowModel<ImageGalleryWidget> {
  ///  Local state fields for this page.

  List<String> images4 = [];
  void addToImages4(String item) => images4.add(item);
  void removeFromImages4(String item) => images4.remove(item);
  void removeAtIndexFromImages4(int index) => images4.removeAt(index);
  void insertAtIndexInImages4(int index, String item) =>
      images4.insert(index, item);
  void updateImages4AtIndex(int index, Function(String) updateFn) =>
      images4[index] = updateFn(images4[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ProjectsRecord? fgg;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
