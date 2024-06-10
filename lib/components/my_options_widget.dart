import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_options_model.dart';
export 'my_options_model.dart';

class MyOptionsWidget extends StatefulWidget {
  const MyOptionsWidget({
    super.key,
    required this.optionText,
    required this.index,
  });

  final String? optionText;
  final int? index;

  @override
  State<MyOptionsWidget> createState() => _MyOptionsWidgetState();
}

class _MyOptionsWidgetState extends State<MyOptionsWidget> {
  late MyOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyOptionsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().addToMyOptions(CompetitorOptionsStruct(
        option: widget.optionText,
        presence: _model.boolean,
      ));
      FFAppState().update(() {});
    });

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (_model.boolean) {
              _model.boolean = false;
              setState(() {});
            } else {
              _model.boolean = true;
              setState(() {});
            }

            FFAppState().updateMyOptionsAtIndex(
              widget.index!,
              (e) => e..presence = _model.boolean,
            );
            FFAppState().update(() {});
          },
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
            ),
            child: Visibility(
              visible: _model.boolean,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FaIcon(
                  FontAwesomeIcons.check,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 15.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
          child: Text(
            widget.optionText!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
