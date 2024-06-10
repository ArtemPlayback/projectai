import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'competitor_name_model.dart';
export 'competitor_name_model.dart';

class CompetitorNameWidget extends StatefulWidget {
  const CompetitorNameWidget({
    super.key,
    this.parameter1,
    required this.index,
  });

  final String? parameter1;
  final int? index;

  @override
  State<CompetitorNameWidget> createState() => _CompetitorNameWidgetState();
}

class _CompetitorNameWidgetState extends State<CompetitorNameWidget> {
  late CompetitorNameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompetitorNameModel());

    _model.textController ??= TextEditingController(text: widget.parameter1);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(21.0, 21.0, 15.0, 21.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 100),
                  () async {
                    await actions.updateCompetitors(
                      FFAppState().competitors.toList(),
                      FFAppState().comparisonOptions.toList(),
                      widget.index,
                      null,
                      null,
                      false,
                    );
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: widget.index?.toString(),
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
                minLines: 1,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
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
                  FFAppState().removeAtIndexFromCompetitors(widget.index!);
                  FFAppState().update(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
