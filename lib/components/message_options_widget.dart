import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_options_model.dart';
export 'message_options_model.dart';

class MessageOptionsWidget extends StatefulWidget {
  const MessageOptionsWidget({
    super.key,
    required this.chat,
    required this.message,
  });

  final DocumentReference? chat;
  final ChatMessagesStruct? message;

  @override
  State<MessageOptionsWidget> createState() => _MessageOptionsWidgetState();
}

class _MessageOptionsWidgetState extends State<MessageOptionsWidget> {
  late MessageOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageOptionsModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
      child: Container(
        width: 200.0,
        height: 90.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 6.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: widget.message!.text));
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Copy',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Icon(
                            Icons.content_copy,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 17.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: Color(0x15000000),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.chat!.update({
                        ...mapToFirestore(
                          {
                            'chat_messages': FieldValue.arrayRemove([
                              getChatMessagesFirestoreData(
                                updateChatMessagesStruct(
                                  widget.message,
                                  clearUnsetFields: false,
                                ),
                                true,
                              )
                            ]),
                          },
                        ),
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delete for everyone',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Icon(
                              FFIcons.kbasket,
                              color: FlutterFlowTheme.of(context).error,
                              size: 17.0,
                            ),
                          ],
                        ),
                      ),
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
