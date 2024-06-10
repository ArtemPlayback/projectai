import '/components/component_search_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'textfield_comp_widget.dart' show TextfieldCompWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextfieldCompModel extends FlutterFlowModel<TextfieldCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for componentSearch component.
  late ComponentSearchModel componentSearchModel;

  @override
  void initState(BuildContext context) {
    componentSearchModel = createModel(context, () => ComponentSearchModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    componentSearchModel.dispose();
  }
}
