import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'image_slider_widget.dart' show ImageSliderWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ImageSliderModel extends FlutterFlowModel<ImageSliderWidget> {
  ///  Local state fields for this component.

  List<String> imagesPage = [];
  void addToImagesPage(String item) => imagesPage.add(item);
  void removeFromImagesPage(String item) => imagesPage.remove(item);
  void removeAtIndexFromImagesPage(int index) => imagesPage.removeAt(index);
  void insertAtIndexInImagesPage(int index, String item) =>
      imagesPage.insert(index, item);
  void updateImagesPageAtIndex(int index, Function(String) updateFn) =>
      imagesPage[index] = updateFn(imagesPage[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
