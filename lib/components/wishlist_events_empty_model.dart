import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import 'wishlist_events_empty_widget.dart' show WishlistEventsEmptyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishlistEventsEmptyModel
    extends FlutterFlowModel<WishlistEventsEmptyWidget> {
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
