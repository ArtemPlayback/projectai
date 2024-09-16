import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_account_model.dart';
export 'delete_account_model.dart';

class DeleteAccountWidget extends StatefulWidget {
  const DeleteAccountWidget({super.key});

  @override
  State<DeleteAccountWidget> createState() => _DeleteAccountWidgetState();
}

class _DeleteAccountWidgetState extends State<DeleteAccountWidget> {
  late DeleteAccountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountModel());

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
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 24.0, 30.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: Color(0x8BECECEE),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.warning_rounded,
                    color: Color(0xFFFF3B30),
                    size: 40.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 6.0),
                  child: Text(
                    'Delete account?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                  child: Text(
                    'Are you sure you want to delete your account? All your evens and products will be deleted as well',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          fontSize: 16.0,
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
                          unawaited(
                            () async {
                              await DocumentsTable().delete(
                                matchingRows: (rows) => rows.eq(
                                  'firebase_id',
                                  currentUserUid,
                                ),
                              );
                            }(),
                          );
                          _model.test = 'qwe2';
                          safeSetState(() {});
                          _model.test = 'qwe3';
                          safeSetState(() {});
                          await Future.wait([
                            Future(() async {
                              _model.chats = await queryChatsRecordOnce(
                                queryBuilder: (chatsRecord) => chatsRecord
                                    .where(
                                      'type',
                                      isEqualTo: 'single chat',
                                    )
                                    .where(
                                      'users',
                                      arrayContains: currentUserReference,
                                    ),
                              );
                              if (_model.chats!.length >= 1) {
                                while (
                                    _model.chatCounter < _model.chats!.length) {
                                  if (_model.chats?[_model.chatCounter]
                                          ?.chatType ==
                                      'single chat') {
                                    unawaited(
                                      () async {
                                        await _model.chats![_model.chatCounter]
                                            .reference
                                            .delete();
                                      }(),
                                    );
                                    _model.chatCounter = _model.chatCounter + 1;
                                    safeSetState(() {});
                                  } else {
                                    unawaited(
                                      () async {
                                        await _model.chats![_model.chatCounter]
                                            .reference
                                            .update({
                                          ...createChatsRecordData(
                                            groupChatOwner: _model
                                                        .chats![
                                                            _model.chatCounter]
                                                        .users
                                                        .length >=
                                                    2
                                                ? (_model
                                                    .chats?[_model.chatCounter]
                                                    ?.users
                                                    ?.last)
                                                : currentUserReference,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'users': FieldValue.arrayRemove(
                                                  [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }(),
                                    );
                                    _model.chatCounter = _model.chatCounter + 1;
                                    safeSetState(() {});
                                  }
                                }
                              }
                            }),
                            Future(() async {
                              _model.events = await queryEventsRecordOnce(
                                queryBuilder: (eventsRecord) =>
                                    eventsRecord.where(
                                  'user',
                                  isEqualTo: currentUserReference,
                                ),
                              );
                              if (_model.events!.length >= 1) {
                                while (_model.eventsCounter <
                                    _model.events!.length) {
                                  unawaited(
                                    () async {
                                      await _model.events![_model.eventsCounter]
                                          .reference
                                          .delete();
                                    }(),
                                  );
                                  _model.eventsCounter =
                                      _model.eventsCounter + 1;
                                  safeSetState(() {});
                                }
                              }
                            }),
                            Future(() async {
                              _model.products = await queryProductsRecordOnce(
                                queryBuilder: (productsRecord) =>
                                    productsRecord.where(
                                  'owner_person',
                                  isEqualTo: currentUserReference,
                                ),
                              );
                              if (_model.products!.length >= 1) {
                                while (_model.productsCounter <
                                    _model.products!.length) {
                                  unawaited(
                                    () async {
                                      await _model
                                          .products![_model.productsCounter]
                                          .reference
                                          .delete();
                                    }(),
                                  );
                                  _model.productsCounter =
                                      _model.productsCounter + 1;
                                  safeSetState(() {});
                                }
                              }
                            }),
                            Future(() async {
                              _model.test = 'не ищу!!!';
                              safeSetState(() {});
                              FFAppState().test = _model.test;
                              safeSetState(() {});
                              _model.companies = await queryProjectsRecordOnce(
                                queryBuilder: (projectsRecord) =>
                                    projectsRecord.where(
                                  'user',
                                  isEqualTo: currentUserReference,
                                ),
                              );
                              FFAppState().test = _model.test;
                              safeSetState(() {});
                              _model.test = 'ищу!!!';
                              safeSetState(() {});
                              FFAppState().test =
                                  _model.companies!.length.toString();
                              safeSetState(() {});
                              if (_model.companies!.length >= 1) {
                                while (_model.companyCounter! <
                                    _model.companies!.length) {
                                  unawaited(
                                    () async {
                                      await _model
                                          .companies![_model.companyCounter!]
                                          .reference
                                          .delete();
                                    }(),
                                  );
                                  _model.test =
                                      'лол${_model.companyCounter?.toString()}';
                                  safeSetState(() {});
                                  FFAppState().test = _model.test;
                                  safeSetState(() {});
                                  _model.companyCounter =
                                      _model.companyCounter! + 1;
                                  safeSetState(() {});
                                }
                              }
                            }),
                          ]);
                          await currentUserReference!.delete();
                          FFAppState().test = 'deleted doc ';
                          safeSetState(() {});
                          await authManager.deleteUser(context);
                          FFAppState().test = 'deleted acc';
                          safeSetState(() {});

                          context.pushNamed('sign_in');

                          safeSetState(() {});
                        },
                        text: 'Delete',
                        options: FFButtonOptions(
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          color: Color(0xFFFF3B30),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'LTSuperior',
                                    color: Colors.white,
                                    fontSize: 15.0,
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 15.0,
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
