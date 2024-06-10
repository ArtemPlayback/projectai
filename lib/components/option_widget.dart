import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'option_model.dart';
export 'option_model.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget({
    super.key,
    required this.text,
    required this.index,
  });

  final String? text;
  final int? index;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  late OptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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

            FFAppState().updateProjectOptionsAtIndex(
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
            widget.text!,
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
