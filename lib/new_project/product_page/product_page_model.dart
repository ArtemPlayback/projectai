import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/expandable_text_widget.dart';
import '/components/image_slider_widget.dart';
import '/components/map_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'product_page_widget.dart' show ProductPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductPageModel extends FlutterFlowModel<ProductPageWidget> {
  ///  Local state fields for this page.

  bool isOwnerUser = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in product_page widget.
  UsersRecord? ownerUser;
  // Stores action output result for [Backend Call - Read Document] action in product_page widget.
  ProjectsRecord? ownerCompany;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for expandableText component.
  late ExpandableTextModel expandableTextModel;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel1;
  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel2;

  @override
  void initState(BuildContext context) {
    expandableTextModel = createModel(context, () => ExpandableTextModel());
    buttonFixedSizeModel1 = createModel(context, () => ButtonFixedSizeModel());
    buttonFixedSizeModel2 = createModel(context, () => ButtonFixedSizeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableTextModel.dispose();
    buttonFixedSizeModel1.dispose();
    buttonFixedSizeModel2.dispose();
  }
}
