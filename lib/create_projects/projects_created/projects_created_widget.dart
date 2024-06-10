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
import 'projects_created_model.dart';
export 'projects_created_model.dart';

class ProjectsCreatedWidget extends StatefulWidget {
  const ProjectsCreatedWidget({
    super.key,
    required this.project,
  });

  final ProjectsRecord? project;

  @override
  State<ProjectsCreatedWidget> createState() => _ProjectsCreatedWidgetState();
}

class _ProjectsCreatedWidgetState extends State<ProjectsCreatedWidget> {
  late ProjectsCreatedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectsCreatedModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 30.0),
      child: Container(
        width: double.infinity,
        height: 350.0,
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
                    'assets/images/DALL_E_2023-11-06_14.23.46_-_Design_a_minimalist_yet_slightly_festive_icon_for_a_startup_and_investment_application__ensuring_it_s_clear_and_recognizable_at_150x150_pixels._Mainta-removebg-preview.png',
                    width: 150.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  'Project\'s created',
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
                  'It\'s time to complete it and fill in more information',
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
                      'createProjectImages',
                      queryParameters: {
                        'project': serializeParam(
                          _model.sdf,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'project': _model.sdf,
                      },
                    );

                    setState(() {});
                  },
                  text: 'Continue setup',
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
            ],
          ),
        ),
      ),
    );
  }
}
