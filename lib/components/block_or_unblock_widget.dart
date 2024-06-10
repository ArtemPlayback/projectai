import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/block_user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'block_or_unblock_model.dart';
export 'block_or_unblock_model.dart';

class BlockOrUnblockWidget extends StatefulWidget {
  const BlockOrUnblockWidget({
    super.key,
    required this.user,
  });

  final DocumentReference? user;

  @override
  State<BlockOrUnblockWidget> createState() => _BlockOrUnblockWidgetState();
}

class _BlockOrUnblockWidgetState extends State<BlockOrUnblockWidget> {
  late BlockOrUnblockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockOrUnblockModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (!(currentUserDocument?.blockedUsers?.toList() ?? [])
            .contains(widget.user)) {
          return Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: Container(
                        height: 220.0,
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        child: BlockUserWidget(
                          user: widget.user!,
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              child: Container(
                width: 146.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.block_flipped,
                        color: FlutterFlowTheme.of(context).textAndStroke,
                        size: 20.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Block user',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'LTSuperior',
                                color:
                                    FlutterFlowTheme.of(context).textAndStroke,
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
        } else {
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'blockedUsers': FieldValue.arrayRemove([widget.user]),
                  },
                ),
              });
            },
            child: Container(
              width: 146.0,
              height: 42.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Unblock user',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: Color(0xFFA3A3B3),
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
          );
        }
      },
    );
  }
}
