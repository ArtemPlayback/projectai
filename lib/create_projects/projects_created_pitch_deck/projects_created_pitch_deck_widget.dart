import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'projects_created_pitch_deck_model.dart';
export 'projects_created_pitch_deck_model.dart';

class ProjectsCreatedPitchDeckWidget extends StatefulWidget {
  const ProjectsCreatedPitchDeckWidget({
    super.key,
    required this.project,
  });

  final ProjectsRecord? project;

  @override
  State<ProjectsCreatedPitchDeckWidget> createState() =>
      _ProjectsCreatedPitchDeckWidgetState();
}

class _ProjectsCreatedPitchDeckWidgetState
    extends State<ProjectsCreatedPitchDeckWidget> {
  late ProjectsCreatedPitchDeckModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectsCreatedPitchDeckModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 25.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Transform.rotate(
                angle: 0.0 * (math.pi / 180),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/DALL_E_2023-11-08_15.00.37_-_Design_a_minimalist_yet_striking_icon_on_a_white_background__embodying_the_concept_of_a_pitch_deck._The_icon_should_feature_a_projector_screen_with_a_-removebg-preview.png',
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  'Business plan\'s created',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  'Let\'s create pitch deck - presentation for investors',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: Color(0xAA141414),
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.sdf = await ProjectsRecord.getDocumentOnce(
                        widget.project!.reference);

                    context.pushNamed(
                      'createPitchDeck',
                      queryParameters: {
                        'project': serializeParam(
                          _model.sdf,
                          ParamType.Document,
                        ),
                        'update': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'project': _model.sdf,
                      },
                    );

                    setState(() {});
                  },
                  text: 'Create pitch deck',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Manrope',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.vfd = await ProjectsRecord.getDocumentOnce(
                        widget.project!.reference);

                    setState(() {});
                  },
                  text: 'Go to project',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x013DA5DE),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
