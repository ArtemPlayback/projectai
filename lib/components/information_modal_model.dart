import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import 'information_modal_widget.dart' show InformationModalWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InformationModalModel extends FlutterFlowModel<InformationModalWidget> {
  ///  Local state fields for this component.

  int? subsCompanies;

  int? subsPeople;

  ///  State fields for stateful widgets in this component.

  // Model for button_fixed_size component.
  late ButtonFixedSizeModel buttonFixedSizeModel;

  @override
  void initState(BuildContext context) {
    buttonFixedSizeModel = createModel(context, () => ButtonFixedSizeModel());
  }

  @override
  void dispose() {
    buttonFixedSizeModel.dispose();
  }
}
