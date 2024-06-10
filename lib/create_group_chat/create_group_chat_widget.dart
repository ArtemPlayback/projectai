import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'create_group_chat_model.dart';
export 'create_group_chat_model.dart';

class CreateGroupChatWidget extends StatefulWidget {
  const CreateGroupChatWidget({
    super.key,
    this.chats,
  });

  final List<ChatsRecord>? chats;

  @override
  State<CreateGroupChatWidget> createState() => _CreateGroupChatWidgetState();
}

class _CreateGroupChatWidgetState extends State<CreateGroupChatWidget> {
  late CreateGroupChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGroupChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.usersAction = await actions.queryUsers(
        currentUserReference!,
        widget.chats!.toList(),
      );
      _model.querried = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.whereIn(
            'uid', _model.usersAction?.map((e) => e.id).toList()),
      );
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
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
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
                              20.0, 15.0, 20.0, 25.0),
                          child: Container(
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
                                Duration(milliseconds: 10),
                                () async {
                                  _model.set =
                                      _model.textController.text != null &&
                                          _model.textController.text != '';
                                  setState(() {});
                                  safeSetState(() {
                                    _model.simpleSearchResults = TextSearch(
                                      _model.querried!
                                          .map(
                                            (record) =>
                                                TextSearchItem.fromTerms(
                                                    record, [
                                              record.email!,
                                              record.displayName!
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
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.search,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      color:
                                          FlutterFlowTheme.of(context).a3a3b3,
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
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
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
                        ),
                        Builder(
                          builder: (context) {
                            if (_model.set) {
                              return Builder(
                                builder: (context) {
                                  final users =
                                      _model.simpleSearchResults.toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: users.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 15.0),
                                    itemBuilder: (context, usersIndex) {
                                      final usersItem = users[usersIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.usersList2.contains(
                                                        usersItem.reference) ==
                                                    true) {
                                                  _model.removeFromUsersList2(
                                                      usersItem.reference);
                                                  setState(() {});
                                                } else {
                                                  _model.addToUsersList2(
                                                      usersItem.reference);
                                                  setState(() {});
                                                }
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
                                                        width: 53.0,
                                                        height: 55.0,
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  usersItem
                                                                      .photoUrl,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model
                                                                    .usersList2
                                                                    .contains(
                                                                        usersItem
                                                                            .reference) ==
                                                                true)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child:
                                                                    Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF16DD96),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .check_rounded,
                                                                    color: Color(
                                                                        0xC0FFFFFF),
                                                                    size: 13.0,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
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
                                                              usersItem
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
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    75.0, 4.0, 0.0, 0.0),
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
                              );
                            } else {
                              return Builder(
                                builder: (context) {
                                  final users = _model.querried?.toList() ?? [];
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: users.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 15.0),
                                    itemBuilder: (context, usersIndex) {
                                      final usersItem = users[usersIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.usersList2.contains(
                                                        usersItem.reference) ==
                                                    true) {
                                                  _model.removeFromUsersList2(
                                                      usersItem.reference);
                                                  setState(() {});
                                                } else {
                                                  _model.addToUsersList2(
                                                      usersItem.reference);
                                                  setState(() {});
                                                }
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
                                                        width: 53.0,
                                                        height: 55.0,
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  usersItem
                                                                      .photoUrl,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model
                                                                    .usersList2
                                                                    .contains(
                                                                        usersItem
                                                                            .reference) ==
                                                                true)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child:
                                                                    Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF16DD96),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .check_rounded,
                                                                    color: Color(
                                                                        0xC0FFFFFF),
                                                                    size: 13.0,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
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
                                                              usersItem
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
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    75.0, 4.0, 0.0, 0.0),
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
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ].addToStart(SizedBox(height: 105.0)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 94.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create Group Chat',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Text(
                                'up to 2000 participants',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                      child: wrapWithModel(
                        model: _model.buttonInfinityModel,
                        updateCallback: () => setState(() {}),
                        child: ButtonInfinityWidget(
                          width: 450.0,
                          height: 44.0,
                          buttonColor: FlutterFlowTheme.of(context).primary,
                          text: 'Continue',
                          fontsize: 14,
                          textcolor: Colors.white,
                          action: () async {
                            context.pushNamed(
                              'create_group_chat_2',
                              queryParameters: {
                                'users': serializeParam(
                                  _model.usersList2,
                                  ParamType.DocumentReference,
                                  true,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
