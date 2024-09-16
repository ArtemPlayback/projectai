import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/emptysearch_widget.dart';
import '/components/search_item_preview_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/company_card/company_card_widget.dart';
import '/sign_in_foulder/new_project/event_card/event_card_widget.dart';
import '/sign_in_foulder/new_project/product_card/product_card_widget.dart';
import '/sign_in_foulder/new_project/user_card_new/user_card_new_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'smart_search_all3_widget.dart' show SmartSearchAll3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SmartSearchAll3Model extends FlutterFlowModel<SmartSearchAll3Widget> {
  ///  Local state fields for this page.

  SmartsearchSessionStruct? smartSearchSession;
  void updateSmartSearchSessionStruct(
      Function(SmartsearchSessionStruct) updateFn) {
    updateFn(smartSearchSession ??= SmartsearchSessionStruct());
  }

  String? lastQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
