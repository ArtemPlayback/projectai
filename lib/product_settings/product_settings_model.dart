import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_event_product_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'product_settings_widget.dart' show ProductSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductSettingsModel extends FlutterFlowModel<ProductSettingsWidget> {
  ///  Local state fields for this page.

  bool isNameChanging = false;

  bool pushes = false;

  String? cover;

  String? image;

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
