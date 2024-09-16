import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigate_back_model.dart';
export 'navigate_back_model.dart';

class NavigateBackWidget extends StatefulWidget {
  const NavigateBackWidget({
    super.key,
    required this.isFrom,
  });

  final String? isFrom;

  @override
  State<NavigateBackWidget> createState() => _NavigateBackWidgetState();
}

class _NavigateBackWidgetState extends State<NavigateBackWidget> {
  late NavigateBackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigateBackModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: FlutterFlowIconButton(
          borderColor: FlutterFlowTheme.of(context).textAndStroke,
          borderRadius: 10.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          fillColor: Color(0xA8FFFFFF),
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 23.0,
          ),
          onPressed: () async {
            if (widget!.isFrom == 'smartsearch') {
              context.safePop();
            } else if (widget!.isFrom == 'profile') {
              context.safePop();
            } else if (widget!.isFrom == 'createCompany') {
              context.pushNamed('profile');
            } else if (widget!.isFrom == 'company settings') {
              context.pushNamed(
                'profile',
                queryParameters: {
                  'chosen': serializeParam(
                    'Companies',
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            } else {
              context.safePop();
            }
          },
        ),
      ),
    );
  }
}
