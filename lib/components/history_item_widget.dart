import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/history_item_options_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'history_item_model.dart';
export 'history_item_model.dart';

class HistoryItemWidget extends StatefulWidget {
  const HistoryItemWidget({
    super.key,
    this.title,
    this.currentItemId,
    this.sessionid,
    this.currentItem,
    required this.actionEdit,
    required this.actionOnTap,
    bool? showOptions,
  }) : this.showOptions = showOptions ?? false;

  final String? title;
  final String? currentItemId;
  final String? sessionid;
  final SmartsearchSessionStruct? currentItem;
  final Future Function()? actionEdit;
  final Future Function()? actionOnTap;
  final bool showOptions;

  @override
  State<HistoryItemWidget> createState() => _HistoryItemWidgetState();
}

class _HistoryItemWidgetState extends State<HistoryItemWidget> {
  late HistoryItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.text = widget!.title;
      _model.currentSession = widget!.currentItem;
      _model.sessions =
          (currentUserDocument?.smartSearchHistory?.toList() ?? [])
              .toList()
              .cast<SmartsearchSessionStruct>();
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController(text: widget!.title);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.actionOnTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget!.currentItemId == widget!.sessionid
              ? Color(0xFFF0F0F0)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Builder(
          builder: (context) {
            if (!_model.isEditing) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        widget!.title!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    if (widget!.showOptions)
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showAlignedDialog(
                                barrierColor: Color(0x80000000),
                                context: context,
                                isGlobal: false,
                                avoidOverflow: false,
                                targetAnchor: AlignmentDirectional(-1.0, 1.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: HistoryItemOptionsWidget(
                                      editAction: () async {
                                        _model.isEditing = true;
                                        safeSetState(() {});
                                      },
                                      deleteAction: () async {
                                        _model.removeAtIndexFromSessions(
                                            functions.jsonIndexFromListJson(
                                                widget!.currentItem!.id,
                                                _model.sessions
                                                    .map((e) => e.toMap())
                                                    .toList()));
                                        safeSetState(() {});
                                        unawaited(
                                          () async {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'smartSearchHistory':
                                                      getSmartsearchSessionListFirestoreData(
                                                    _model.sessions,
                                                  ),
                                                },
                                              ),
                                            });
                                          }(),
                                        );
                                        _model.isEditing = false;
                                        safeSetState(() {});
                                        FFAppState().currentSearchSession =
                                            SmartsearchSessionStruct();
                                        safeSetState(() {});

                                        context.pushNamed('smart_search_all_2');
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Opacity(
                                opacity: 0.7,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 0.0),
                                  child: Icon(
                                    Icons.keyboard_control,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
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
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                        child: Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.updateCurrentSessionStruct(
                            (e) => e..title = _model.textController.text,
                          );
                          _model.updateSessionsAtIndex(
                            functions.jsonIndexFromListJson(
                                widget!.currentItem!.id,
                                _model.sessions.map((e) => e.toMap()).toList()),
                            (_) => _model.currentSession!,
                          );
                          safeSetState(() {});
                          unawaited(
                            () async {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'smartSearchHistory':
                                        getSmartsearchSessionListFirestoreData(
                                      _model.sessions,
                                    ),
                                  },
                                ),
                              });
                            }(),
                          );
                          _model.isEditing = false;
                          safeSetState(() {});
                          await widget.actionEdit?.call();
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Opacity(
                            opacity: 0.7,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 6.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.checkCircle,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
