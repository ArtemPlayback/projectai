import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/create_projects/projects_created/projects_created_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:ui';
import 'create_project2_widget.dart' show CreateProject2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreateProject2Model extends FlutterFlowModel<CreateProject2Widget> {
  ///  Local state fields for this page.

  bool isOpen = true;

  String? cover;

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  bool isFree = false;

  bool noRestriction = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel1;
  // Stores action output result for [Backend Call - Create Document] action in button_fixed_size widget.
  ProjectsRecord? project;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel2;

  @override
  void initState(BuildContext context) {
    buttonFixedSizeModel1 = createModel(context, () => ButtonFixedSizeModel());
    buttonInfinityModel = createModel(context, () => ButtonInfinityModel());
    buttonFixedSizeModel2 = createModel(context, () => ButtonFixedSizeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    buttonFixedSizeModel1.dispose();
    buttonInfinityModel.dispose();
    buttonFixedSizeModel2.dispose();
  }
}
