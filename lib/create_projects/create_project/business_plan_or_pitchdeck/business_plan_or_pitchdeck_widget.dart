import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'business_plan_or_pitchdeck_model.dart';
export 'business_plan_or_pitchdeck_model.dart';

class BusinessPlanOrPitchdeckWidget extends StatefulWidget {
  const BusinessPlanOrPitchdeckWidget({
    super.key,
    required this.project,
  });

  final ProjectsRecord? project;

  @override
  State<BusinessPlanOrPitchdeckWidget> createState() =>
      _BusinessPlanOrPitchdeckWidgetState();
}

class _BusinessPlanOrPitchdeckWidgetState
    extends State<BusinessPlanOrPitchdeckWidget> {
  late BusinessPlanOrPitchdeckModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessPlanOrPitchdeckModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: Color(0xE6FFFFFF),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  'Where would you like to proceed with the project?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'createBusinessPlan',
                      queryParameters: {
                        'project': serializeParam(
                          widget.project,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'project': widget.project,
                      },
                    );
                  },
                  text: 'BUSINESS PLAN',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 45.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x003DA5DE),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'LTSuperior',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'createPitchDeck',
                      queryParameters: {
                        'project': serializeParam(
                          widget.project,
                          ParamType.Document,
                        ),
                        'update': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'project': widget.project,
                      },
                    );
                  },
                  text: 'PITCH DECK',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 45.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'LTSuperior',
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
