import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'business_model_card_model.dart';
export 'business_model_card_model.dart';

class BusinessModelCardWidget extends StatefulWidget {
  const BusinessModelCardWidget({
    super.key,
    this.parameter1,
    required this.cashflowName,
    required this.cashflowdescription,
  });

  final int? parameter1;
  final String? cashflowName;
  final String? cashflowdescription;

  @override
  State<BusinessModelCardWidget> createState() =>
      _BusinessModelCardWidgetState();
}

class _BusinessModelCardWidgetState extends State<BusinessModelCardWidget> {
  late BusinessModelCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessModelCardModel());

    _model.textController1 ??= TextEditingController(text: widget.cashflowName);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.cashflowdescription);
    _model.textFieldFocusNode2 ??= FocusNode();

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(22.0, 32.0, 22.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    'Cashflow ${((widget.parameter1!) + 1).toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    FFIcons.kbasket,
                    color: FlutterFlowTheme.of(context).textAndStroke,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    FFAppState().removeAtIndexFromCashFlows(widget.parameter1!);
                    FFAppState().update(() {});
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.textController1,
                focusNode: _model.textFieldFocusNode1,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController1',
                  Duration(milliseconds: 200),
                  () async {
                    FFAppState().updateCashFlowsAtIndex(
                      widget.parameter1!,
                      (e) => e..title = _model.textController1.text,
                    );
                    FFAppState().update(() {});
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Cashflow name',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Montserrat',
                        color: Color(0x5C000000),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
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
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF2F2F2F),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
                validator: _model.textController1Validator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.textController2,
                focusNode: _model.textFieldFocusNode2,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController2',
                  Duration(milliseconds: 200),
                  () async {
                    FFAppState().updateCashFlowsAtIndex(
                      widget.parameter1!,
                      (e) => e..description = _model.textController2.text,
                    );
                    FFAppState().update(() {});
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Cashflow description',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Montserrat',
                        color: Color(0x5C000000),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
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
                minLines: 5,
                validator: _model.textController2Validator.asValidator(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
