import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'groupchat_user_options_model.dart';
export 'groupchat_user_options_model.dart';

class GroupchatUserOptionsWidget extends StatefulWidget {
  const GroupchatUserOptionsWidget({
    super.key,
    required this.chat,
    required this.user,
  });

  final ChatsRecord? chat;
  final UsersRecord? user;

  @override
  State<GroupchatUserOptionsWidget> createState() =>
      _GroupchatUserOptionsWidgetState();
}

class _GroupchatUserOptionsWidgetState
    extends State<GroupchatUserOptionsWidget> {
  late GroupchatUserOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupchatUserOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: Container(
        width: double.infinity,
        height: 110.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      unawaited(
                        () async {
                          await widget!.chat!.reference
                              .update(createChatsRecordData(
                            groupChatOwner: widget!.user?.reference,
                          ));
                        }(),
                      );
                      _model.readChat = await ChatsRecord.getDocumentOnce(
                          widget!.chat!.reference);

                      context.pushNamed(
                        'group_chat_settings',
                        queryParameters: {
                          'chat': serializeParam(
                            _model.readChat,
                            ParamType.Document,
                          ),
                          'isFrom': serializeParam(
                            'userOptions',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'chat': _model.readChat,
                        },
                      );

                      safeSetState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.admin_panel_settings,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 4.0, 0.0, 0.0),
                          child: Text(
                            'Make an owner',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      unawaited(
                        () async {
                          await widget!.chat!.reference.update({
                            ...mapToFirestore(
                              {
                                'users': FieldValue.arrayRemove(
                                    [widget!.user?.reference]),
                              },
                            ),
                          });
                        }(),
                      );
                      _model.readChat2 = await ChatsRecord.getDocumentOnce(
                          widget!.chat!.reference);

                      context.pushNamed(
                        'group_chat_settings',
                        queryParameters: {
                          'chat': serializeParam(
                            _model.readChat2,
                            ParamType.Document,
                          ),
                          'isFrom': serializeParam(
                            'userOptions',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'chat': _model.readChat2,
                        },
                      );

                      safeSetState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).error,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: FaIcon(
                              FontAwesomeIcons.minus,
                              color: FlutterFlowTheme.of(context).error,
                              size: 15.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 0.0, 1.0),
                          child: Text(
                            'Delete from group',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
