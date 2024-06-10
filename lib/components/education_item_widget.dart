import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'education_item_model.dart';
export 'education_item_model.dart';

class EducationItemWidget extends StatefulWidget {
  const EducationItemWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<EducationItemWidget> createState() => _EducationItemWidgetState();
}

class _EducationItemWidgetState extends State<EducationItemWidget> {
  late EducationItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EducationItemModel());

    _model.textController1 ??= TextEditingController(
        text: FFAppState().experience[widget.parameter1!].title);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: FFAppState().experience[widget.parameter1!].details);
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
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 17.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Experience ${widget.parameter1?.toString()}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'LTSuperior',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().removeAtIndexFromEducation(widget.parameter1!);
                  setState(() {});
                },
                child: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 17.0,
                ),
              ),
            ],
          ),
        ),
        TextFormField(
          controller: _model.textController1,
          focusNode: _model.textFieldFocusNode1,
          onFieldSubmitted: (_) async {
            FFAppState().updateExperienceAtIndex(
              widget.parameter1!,
              (e) => e..title = _model.textController1.text,
            );
            setState(() {});
          },
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Title',
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
                color: Color(0x82A3A3B3),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            contentPadding:
                EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Manrope',
                color: Color(0xFF2F2F2F),
                fontSize: 15.0,
                letterSpacing: 0.0,
              ),
          maxLines: null,
          validator: _model.textController1Validator.asValidator(context),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: TextFormField(
            controller: _model.textController2,
            focusNode: _model.textFieldFocusNode2,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController2',
              Duration(milliseconds: 2),
              () async {
                FFAppState().updateExperienceAtIndex(
                  widget.parameter1!,
                  (e) => e..details = _model.textController2.text,
                );
                setState(() {});
              },
            ),
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Details',
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
                  color: Color(0x82A3A3B3),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF2F2F2F),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
            maxLines: null,
            validator: _model.textController2Validator.asValidator(context),
          ),
        ),
      ],
    );
  }
}
