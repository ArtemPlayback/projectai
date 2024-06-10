import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/usercard_small_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'information_modal_company_widget.dart'
    show InformationModalCompanyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InformationModalCompanyModel
    extends FlutterFlowModel<InformationModalCompanyWidget> {
  ///  Local state fields for this component.

  int? subsCompanies;

  int? subsPeople;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
