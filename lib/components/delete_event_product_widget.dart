import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_event_product_model.dart';
export 'delete_event_product_model.dart';

class DeleteEventProductWidget extends StatefulWidget {
  const DeleteEventProductWidget({
    super.key,
    this.event,
    this.product,
  });

  final EventsRecord? event;
  final ProductsRecord? product;

  @override
  State<DeleteEventProductWidget> createState() =>
      _DeleteEventProductWidgetState();
}

class _DeleteEventProductWidgetState extends State<DeleteEventProductWidget> {
  late DeleteEventProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteEventProductModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xE8FFFFFF),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 24.0, 30.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                  child: Text(
                    widget!.event != null ? 'Delete event' : 'Delete product',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: Text(
                    'Are you sure you want to delete ${widget!.event != null ? 'event' : 'product'}? This action cannot be undone.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (widget!.event != null) {
                            unawaited(
                              () async {
                                await widget!.event!.reference.delete();
                              }(),
                            );
                            unawaited(
                              () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'events': FieldValue.arrayRemove(
                                          [widget!.event?.reference]),
                                    },
                                  ),
                                });
                              }(),
                            );
                            unawaited(
                              () async {
                                await DocumentsTable().delete(
                                  matchingRows: (rows) => rows.eq(
                                    'firebase_id',
                                    widget!.product?.customId,
                                  ),
                                );
                              }(),
                            );
                            FFAppState().clearEventsProfileCache();
                            unawaited(
                              () async {
                                Navigator.pop(context);
                              }(),
                            );

                            context.pushNamed(
                              'profile',
                              queryParameters: {
                                'chosen': serializeParam(
                                  'Events',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            unawaited(
                              () async {
                                await widget!.product!.reference.delete();
                              }(),
                            );
                            unawaited(
                              () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'products': FieldValue.arrayRemove(
                                          [widget!.product?.reference]),
                                    },
                                  ),
                                });
                              }(),
                            );
                            unawaited(
                              () async {
                                await DocumentsTable().delete(
                                  matchingRows: (rows) => rows.eq(
                                    'firebase_id',
                                    widget!.product?.customId,
                                  ),
                                );
                              }(),
                            );
                            FFAppState().clearProductsProfileCache();
                            unawaited(
                              () async {
                                Navigator.pop(context);
                              }(),
                            );

                            context.pushNamed(
                              'profile',
                              queryParameters: {
                                'chosen': serializeParam(
                                  'Products',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          }
                        },
                        text: 'Delete',
                        options: FFButtonOptions(
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'LTSuperior',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          color: Color(0x02007AFF),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'LTSuperior',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).textAndStroke,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 6.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
