import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'expandable_text_model.dart';
export 'expandable_text_model.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({
    super.key,
    required this.parameter1,
  });

  final String? parameter1;

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late ExpandableTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpandableTextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Builder(
          builder: (context) {
            if (_model.open && ((widget.parameter1!).length > 140)) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Stack(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.parameter1,
                                  'q',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              TextSpan(
                                text: '  < Less',
                                style: GoogleFonts.getFont(
                                  'Manrope',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                                mouseCursor: SystemMouseCursors.click,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    if (_model.open) {
                                      _model.open = false;
                                      setState(() {});
                                    } else {
                                      _model.open = true;
                                      setState(() {});
                                    }
                                  },
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (!_model.open && !((widget.parameter1!).length > 140)) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: (String text) {
                            return text.length <= 140
                                ? text
                                : text.substring(0, 140);
                          }(widget.parameter1!),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                          mouseCursor: SystemMouseCursors.click,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (_model.open) {
                                _model.open = false;
                                setState(() {});
                              } else {
                                _model.open = true;
                                setState(() {});
                              }
                            },
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              );
            } else if (!_model.open && ((widget.parameter1!).length > 140)) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: (String text) {
                            return text.length <= 140
                                ? text
                                : text.substring(0, 140);
                          }(widget.parameter1!),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        TextSpan(
                          text: _model.open ? ' < Less' : ' More> ',
                          style: GoogleFonts.getFont(
                            'Manrope',
                            color: FlutterFlowTheme.of(context).primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.parameter1!,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        TextSpan(
                          text: ' < Less',
                          style: GoogleFonts.getFont(
                            'Manrope',
                            color: FlutterFlowTheme.of(context).primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          mouseCursor: SystemMouseCursors.click,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (_model.open) {
                                _model.open = false;
                                setState(() {});
                              } else {
                                _model.open = true;
                                setState(() {});
                              }
                            },
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
