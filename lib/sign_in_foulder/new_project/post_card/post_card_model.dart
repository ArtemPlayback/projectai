import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/expandable_text_new_widget.dart';
import '/components/image_slider_widget.dart';
import '/components/post_options_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_card_widget.dart' show PostCardWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostCardModel extends FlutterFlowModel<PostCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for expandableTextNew component.
  late ExpandableTextNewModel expandableTextNewModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {
    expandableTextNewModel =
        createModel(context, () => ExpandableTextNewModel());
  }

  @override
  void dispose() {
    expandableTextNewModel.dispose();
  }
}
