import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/form_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_product_copy_widget.dart' show CreateProductCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreateProductCopyModel extends FlutterFlowModel<CreateProductCopyWidget> {
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

  List<FFUploadedFile> files = [];
  void addToFiles(FFUploadedFile item) => files.add(item);
  void removeFromFiles(FFUploadedFile item) => files.remove(item);
  void removeAtIndexFromFiles(int index) => files.removeAt(index);
  void insertAtIndexInFiles(int index, FFUploadedFile item) =>
      files.insert(index, item);
  void updateFilesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      files[index] = updateFn(files[index]);

  String? response;

  List<dynamic> questions = [];
  void addToQuestions(dynamic item) => questions.add(item);
  void removeFromQuestions(dynamic item) => questions.remove(item);
  void removeAtIndexFromQuestions(int index) => questions.removeAt(index);
  void insertAtIndexInQuestions(int index, dynamic item) =>
      questions.insert(index, item);
  void updateQuestionsAtIndex(int index, Function(dynamic) updateFn) =>
      questions[index] = updateFn(questions[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? reorder;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // Stores action output result for [Custom Action - openAIImages] action in Button widget.
  dynamic? openai;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel1;
  // Stores action output result for [Backend Call - API (create questions)] action in button_fixed_size widget.
  ApiCallResponse? apiResultm5h;
  // Stores action output result for [Backend Call - Create Document] action in button_fixed_size widget.
  ProductsRecord? createdProduct;
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

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    buttonFixedSizeModel1.dispose();
    buttonInfinityModel.dispose();
    buttonFixedSizeModel2.dispose();
  }
}
