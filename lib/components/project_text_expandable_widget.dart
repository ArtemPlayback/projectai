import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_text_expandable_model.dart';
export 'project_text_expandable_model.dart';

class ProjectTextExpandableWidget extends StatefulWidget {
  const ProjectTextExpandableWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<ProjectTextExpandableWidget> createState() =>
      _ProjectTextExpandableWidgetState();
}

class _ProjectTextExpandableWidgetState
    extends State<ProjectTextExpandableWidget> {
  late ProjectTextExpandableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectTextExpandableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (!_model.open && ((widget.text!).length > 250)) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Text(
                    widget.text!,
                    maxLines: 5,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 76.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0x00FFFFFF), Colors.white],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 84.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.open = true;
                          setState(() {});
                        },
                        child: Container(
                          height: 20.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Color(0x00FFFFFF)],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(1.0, 0.0),
                              end: AlignmentDirectional(-1.0, 0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                185.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'more',
                              maxLines: 5,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Text(
                    widget.text!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
