import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_company_widget.dart';
import '/components/list_events_or_products_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:async';
import 'dart:ui';
import 'company_settings_widget.dart' show CompanySettingsWidget;
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanySettingsModel extends FlutterFlowModel<CompanySettingsWidget> {
  ///  Local state fields for this page.

  bool isNameChanging = false;

  bool pushes = false;

  String? cover;

  String? image;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  @override
  void initState(BuildContext context) {
    buttonInfinityModel = createModel(context, () => ButtonInfinityModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    buttonInfinityModel.dispose();
  }
}
