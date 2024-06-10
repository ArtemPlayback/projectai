import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'chats_search_model.dart';
export 'chats_search_model.dart';

class ChatsSearchWidget extends StatefulWidget {
  const ChatsSearchWidget({
    super.key,
    required this.chats,
  });

  final List<ChatsRecord>? chats;

  @override
  State<ChatsSearchWidget> createState() => _ChatsSearchWidgetState();
}

class _ChatsSearchWidgetState extends State<ChatsSearchWidget> {
  late ChatsSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsSearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.users = await queryUsersRecordOnce(
            queryBuilder: (usersRecord) => usersRecord.whereIn(
                'uid',
                widget.chats
                    ?.map((e) => e.users
                        .where((e) => e != currentUserReference)
                        .toList()
                        .first
                        .id)
                    .toList()),
          );
        }),
      ]);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (_model.textController.text != null &&
                      _model.textController.text != '')
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 15.0, 20.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Chats',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'LTSuperior',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final messages = functions
                                  .chatmessages1(widget.chats?.toList(),
                                      _model.textController.text)
                                  .toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: messages.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 15.0),
                                itemBuilder: (context, messagesIndex) {
                                  final messagesItem = messages[messagesIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: FutureBuilder<UsersRecord>(
                                          future: UsersRecord.getDocumentOnce(
                                              messagesItem.users
                                                  .where((e) =>
                                                      e != currentUserReference)
                                                  .toList()
                                                  .first),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowUsersRecord =
                                                snapshot.data!;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'chat_page',
                                                  queryParameters: {
                                                    'chat': serializeParam(
                                                      messagesItem,
                                                      ParamType.Document,
                                                    ),
                                                    'user': serializeParam(
                                                      rowUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'chat': messagesItem,
                                                    'user': rowUsersRecord,
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          rowUsersRecord
                                                              .photoUrl,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              rowUsersRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.45,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  functions
                                                                      .chatMessages2(
                                                                          widget
                                                                              .chats
                                                                              ?.toList(),
                                                                          _model
                                                                              .textController
                                                                              .text)[
                                                                          messagesIndex]
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            25,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            75.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFECECEC),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                ].addToStart(SizedBox(height: 206.0)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Icon(
                              FFIcons.kback,
                              color: FlutterFlowTheme.of(context).thirdText,
                              size: 13.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 300),
                                    () async {
                                      safeSetState(() {
                                        _model.simpleSearchResults = TextSearch(
                                          _model.users!
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [
                                                  record.displayName!,
                                                  record.description!,
                                                  record
                                                      .professionalInformation!,
                                                  record.email!,
                                                  record.phoneNumber!
                                                ]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model.textController.text)
                                            .map((r) => r.object)
                                            .toList();
                                        ;
                                      });
                                    },
                                  ),
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textInputAction: TextInputAction.search,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .a3a3b3,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'LTSuperior',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                  minLines: 1,
                                  maxLength: 80,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final maybechats = widget.chats!.toList();
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(maybechats.length,
                                      (maybechatsIndex) {
                                final maybechatsItem =
                                    maybechats[maybechatsIndex];
                                return Builder(
                                  builder: (context) {
                                    if (maybechatsItem.chatType ==
                                        'single chat') {
                                      return FutureBuilder<UsersRecord>(
                                        future: UsersRecord.getDocumentOnce(
                                            maybechatsItem.users
                                                .where((e) =>
                                                    e != currentUserReference)
                                                .toList()
                                                .first),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final columnUsersRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'chat_page',
                                                queryParameters: {
                                                  'chat': serializeParam(
                                                    maybechatsItem,
                                                    ParamType.Document,
                                                  ),
                                                  'user': serializeParam(
                                                    columnUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'chat': maybechatsItem,
                                                  'user': columnUsersRecord,
                                                },
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          360.0),
                                                  child: Image.network(
                                                    columnUsersRecord.photoUrl,
                                                    width: 60.0,
                                                    height: 60.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    (String var1) {
                                                      return var1.split(' ')[0];
                                                    }(columnUsersRecord
                                                            .displayName)
                                                        .maybeHandleOverflow(
                                                      maxChars: 10,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return FutureBuilder<UsersRecord>(
                                        future: UsersRecord.getDocumentOnce(
                                            maybechatsItem.users
                                                .where((e) =>
                                                    e != currentUserReference)
                                                .toList()
                                                .first),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final columnUsersRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'chat_page',
                                                queryParameters: {
                                                  'chat': serializeParam(
                                                    maybechatsItem,
                                                    ParamType.Document,
                                                  ),
                                                  'user': serializeParam(
                                                    columnUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'chat': maybechatsItem,
                                                  'user': columnUsersRecord,
                                                },
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          360.0),
                                                  child: Image.network(
                                                    columnUsersRecord.photoUrl,
                                                    width: 60.0,
                                                    height: 60.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    (String var1) {
                                                      return var1.split(' ')[0];
                                                    }(columnUsersRecord
                                                            .displayName)
                                                        .maybeHandleOverflow(
                                                      maxChars: 10,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                );
                              })
                                  .divide(SizedBox(width: 15.0))
                                  .addToStart(SizedBox(width: 20.0))
                                  .addToEnd(SizedBox(width: 20.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
