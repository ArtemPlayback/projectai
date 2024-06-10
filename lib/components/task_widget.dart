import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_model.dart';
export 'task_model.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    this.parameter1,
    required this.year,
    required this.text,
    required this.done,
  });

  final int? parameter1;
  final int? year;
  final String? text;
  final bool? done;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late TaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.done = widget.done!;
      setState(() {});
    });

    _model.textController ??= TextEditingController(text: widget.text);
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                Duration(milliseconds: 200),
                () async {
                  FFAppState().updateYearsPlanAtIndex(
                    widget.parameter1!,
                    (e) => e..taskTitle = _model.textController.text,
                  );
                  FFAppState().update(() {});
                },
              ),
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelText: ' Task title',
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
              maxLines: null,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 15.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (_model.done) {
                  _model.done = false;
                  _model.updatePage(() {});
                } else {
                  _model.done = true;
                  _model.updatePage(() {});
                }

                FFAppState().updateYearsPlanAtIndex(
                  widget.parameter1!,
                  (e) => e..done = _model.done,
                );
                FFAppState().update(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
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
                      visible: _model.done,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Done',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2.0,
            indent: 22.0,
            endIndent: 22.0,
            color: Color(0xFFF4F4F4),
          ),
        ],
      ),
    );
  }
}
