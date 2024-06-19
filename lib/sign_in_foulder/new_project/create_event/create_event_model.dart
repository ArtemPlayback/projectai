import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'create_event_widget.dart' show CreateEventWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreateEventModel extends FlutterFlowModel<CreateEventWidget> {
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

  String? customID;

  List<String> imageFake = [
    'https://as1.ftcdn.net/v2/jpg/05/85/45/22/1000_F_585452272_Ci6U9qLUPiqiLF15Zk5e4x8a0slzhHgV.jpg'
  ];
  void addToImageFake(String item) => imageFake.add(item);
  void removeFromImageFake(String item) => imageFake.remove(item);
  void removeAtIndexFromImageFake(int index) => imageFake.removeAt(index);
  void insertAtIndexInImageFake(int index, String item) =>
      imageFake.insert(index, item);
  void updateImageFakeAtIndex(int index, Function(String) updateFn) =>
      imageFake[index] = updateFn(imageFake[index]);

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
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  DateTime? datePicked1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  DateTime? datePicked2;
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? reorder;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel1;
  // Stores action output result for [Backend Call - Read Document] action in button_fixed_size widget.
  EventsRecord? event2;
  // Stores action output result for [Backend Call - Create Document] action in button_fixed_size widget.
  EventsRecord? event;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel2;
  // Stores action output result for [Backend Call - Create Document] action in button_fixed_size widget.
  EventsRecord? eventCopy;

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

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    buttonFixedSizeModel1.dispose();
    buttonInfinityModel.dispose();
    buttonFixedSizeModel2.dispose();
  }
}
