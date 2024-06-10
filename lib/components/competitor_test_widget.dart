import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'competitor_test_model.dart';
export 'competitor_test_model.dart';

class CompetitorTestWidget extends StatefulWidget {
  const CompetitorTestWidget({
    super.key,
    this.parameter1,
    required this.title,
    required this.advantage,
    required this.disadvantage,
  });

  final int? parameter1;
  final String? title;
  final String? advantage;
  final String? disadvantage;

  @override
  State<CompetitorTestWidget> createState() => _CompetitorTestWidgetState();
}

class _CompetitorTestWidgetState extends State<CompetitorTestWidget> {
  late CompetitorTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompetitorTestModel());

    _model.textController1 ??= TextEditingController(text: widget.title);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: widget.advantage);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: widget.disadvantage);
    _model.textFieldFocusNode3 ??= FocusNode();

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Competitor ${((widget.parameter1!) + 1).toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      FFIcons.kbasket,
                      color: FlutterFlowTheme.of(context).textAndStroke,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      FFAppState()
                          .removeAtIndexFromTestCompetitors(widget.parameter1!);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(21.0, 30.0, 21.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController1',
                      Duration(milliseconds: 100),
                      () async {
                        FFAppState().updateTestCompetitorsAtIndex(
                          widget.parameter1!,
                          (_) => TestCompetitorsStruct(
                            title: _model.textController1.text,
                            advantages: _model.textController2.text,
                            disadvantages: _model.textController3.text,
                          ),
                        );
                        FFAppState().update(() {});
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Competitor\'s name',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Montserrat',
                                color: Color(0x5C000000),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'LTSuperior',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x1A000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF2F2F2F),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                    maxLines: null,
                    minLines: 1,
                    validator:
                        _model.textController1Validator.asValidator(context),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 0.0, 0.0),
            child: Text(
              'Comparison',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(21.0, 21.0, 21.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController2',
                      Duration(milliseconds: 100),
                      () async {
                        FFAppState().updateTestCompetitorsAtIndex(
                          widget.parameter1!,
                          (_) => TestCompetitorsStruct(
                            title: _model.textController1.text,
                            advantages: _model.textController2.text,
                            disadvantages: _model.textController3.text,
                          ),
                        );
                        FFAppState().update(() {});
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Their advantages',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Montserrat',
                                color: Color(0x5C000000),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'LTSuperior',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x1A000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF2F2F2F),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                    maxLines: null,
                    minLines: 1,
                    validator:
                        _model.textController2Validator.asValidator(context),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(21.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _model.textController3,
                    focusNode: _model.textFieldFocusNode3,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController3',
                      Duration(milliseconds: 100),
                      () async {
                        FFAppState().updateTestCompetitorsAtIndex(
                          widget.parameter1!,
                          (_) => TestCompetitorsStruct(
                            title: _model.textController1.text,
                            advantages: _model.textController2.text,
                            disadvantages: _model.textController3.text,
                          ),
                        );
                        FFAppState().update(() {});
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Their disadvantages',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Montserrat',
                                color: Color(0x5C000000),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'LTSuperior',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x1A000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF2F2F2F),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                    maxLines: null,
                    minLines: 1,
                    validator:
                        _model.textController3Validator.asValidator(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
