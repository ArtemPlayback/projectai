import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_chat_model.dart';
export 'delete_chat_model.dart';

class DeleteChatWidget extends StatefulWidget {
  const DeleteChatWidget({
    super.key,
    required this.chat,
  });

  final ChatsRecord? chat;

  @override
  State<DeleteChatWidget> createState() => _DeleteChatWidgetState();
}

class _DeleteChatWidgetState extends State<DeleteChatWidget> {
  late DeleteChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteChatModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 25.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (widget!.chat?.chatType != 'single chat') {
            unawaited(
              () async {
                await widget!.chat!.reference.update({
                  ...createChatsRecordData(
                    groupChatOwner: widget!.chat?.users
                        ?.where((e) => e != currentUserReference)
                        .toList()
                        ?.first,
                  ),
                  ...mapToFirestore(
                    {
                      'users': FieldValue.arrayRemove([currentUserReference]),
                    },
                  ),
                });
              }(),
            );
          } else {
            unawaited(
              () async {
                await widget!.chat!.reference.delete();
              }(),
            );
          }

          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.klogOut,
                  color: FlutterFlowTheme.of(context).error,
                  size: 22.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'Abandon chat',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          color: FlutterFlowTheme.of(context).secondaryText,
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
    );
  }
}
