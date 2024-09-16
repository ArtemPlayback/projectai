import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'expandable_text_new_model.dart';
export 'expandable_text_new_model.dart';

class ExpandableTextNewWidget extends StatefulWidget {
  const ExpandableTextNewWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<ExpandableTextNewWidget> createState() =>
      _ExpandableTextNewWidgetState();
}

class _ExpandableTextNewWidgetState extends State<ExpandableTextNewWidget> {
  late ExpandableTextNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpandableTextNewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if ((widget!.text!).length > 140) {
          return Builder(
            builder: (context) {
              if (!_model.isExpanded) {
                return RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: (String text) {
                          return text.length > 140
                              ? text.substring(0, 140)
                              : text;
                        }(widget!.text!),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                              lineHeight: 1.35,
                            ),
                      ),
                      TextSpan(
                        text: ' Show more',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primary,
                          fontWeight: FontWeight.w600,
                        ),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            _model.isExpanded = true;
                            safeSetState(() {});
                          },
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                );
              } else {
                return Text(
                  valueOrDefault<String>(
                    widget!.text,
                    'text',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'LTSuperior',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                        lineHeight: 1.35,
                      ),
                );
              }
            },
          );
        } else {
          return Text(
            valueOrDefault<String>(
              widget!.text,
              'text',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'LTSuperior',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                  lineHeight: 1.35,
                ),
          );
        }
      },
    );
  }
}
