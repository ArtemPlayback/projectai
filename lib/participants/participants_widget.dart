import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list_widget_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'participants_model.dart';
export 'participants_model.dart';

class ParticipantsWidget extends StatefulWidget {
  const ParticipantsWidget({
    super.key,
    required this.event,
  });

  final EventsRecord? event;

  @override
  State<ParticipantsWidget> createState() => _ParticipantsWidgetState();
}

class _ParticipantsWidgetState extends State<ParticipantsWidget>
    with TickerProviderStateMixin {
  late ParticipantsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParticipantsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.participants =
          widget.event!.participantUsers.toList().cast<ParticipantsStruct>();
      _model.appliedToJoin =
          widget.event!.usersAppliedToJoin.toList().cast<ParticipantsStruct>();
      setState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EventsRecord>(
      stream: EventsRecord.getDocument(widget.event!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final participantsEventsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 75.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).textAndStroke,
                            borderRadius: 10.0,
                            borderWidth: 1.0,
                            buttonSize: 38.0,
                            icon: Icon(
                              FFIcons.kback,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 13.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                        ),
                        Text(
                          'Event People',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'LTSuperior',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 80.0, 20.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(-1.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'LTSuperior',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'LTSuperior',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                          labelColor: Colors.white,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          unselectedBorderColor:
                              FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 10.0,
                          elevation: 0.0,
                          labelPadding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 0.0, 40.0, 0.0),
                          buttonMargin: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          tabs: [
                            Tab(
                              text: 'Requests',
                            ),
                            Tab(
                              text: 'Participants',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            KeepAliveWidgetWrapper(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final participants2 = participantsEventsRecord
                                      .usersAppliedToJoin
                                      .toList();
                                  if (participants2.isEmpty) {
                                    return Center(
                                      child: Container(
                                        height: 210.0,
                                        child: EmptyListWidgetWidget(
                                          text:
                                              'There are now requests at the moment',
                                        ),
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      32.0,
                                      0,
                                      0,
                                    ),
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: participants2.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 15.0),
                                    itemBuilder: (context, participants2Index) {
                                      final participants2Item =
                                          participants2[participants2Index];
                                      return FutureBuilder<UsersRecord>(
                                        future: UsersRecord.getDocumentOnce(
                                            participants2Item.user!),
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/100/600',
                                                      width: 53.0,
                                                      height: 53.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
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
                                                                    'LTSuperior',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Applied to Join ${dateTimeFormat('M/d h:mm a', participants2Item.when)}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'LTSuperior',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 10.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 38.0,
                                                      fillColor:
                                                          Color(0x27FF3B30),
                                                      icon: Icon(
                                                        Icons.close,
                                                        color:
                                                            Color(0xFFFF3B30),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.removeFromAppliedToJoin(
                                                            participants2Item);
                                                        setState(() {});
                                                        unawaited(
                                                          () async {
                                                            await widget.event!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'users_applied_to_join':
                                                                      getParticipantsListFirestoreData(
                                                                    _model
                                                                        .appliedToJoin,
                                                                  ),
                                                                },
                                                              ),
                                                            });
                                                          }(),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 0.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 10.0,
                                                      borderWidth: 0.0,
                                                      buttonSize: 38.0,
                                                      fillColor:
                                                          Color(0x2500B071),
                                                      icon: Icon(
                                                        Icons.check_sharp,
                                                        color:
                                                            Color(0xFF00B071),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.removeFromAppliedToJoin(
                                                            participants2Item);
                                                        _model.addToParticipants(
                                                            participants2Item);
                                                        setState(() {});
                                                        _model
                                                            .updateParticipantsAtIndex(
                                                          participants2Index,
                                                          (e) => e
                                                            ..when =
                                                                getCurrentTimestamp,
                                                        );
                                                        setState(() {});
                                                        unawaited(
                                                          () async {
                                                            await widget.event!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'users_applied_to_join':
                                                                      getParticipantsListFirestoreData(
                                                                    _model
                                                                        .appliedToJoin,
                                                                  ),
                                                                  'participant_users':
                                                                      getParticipantsListFirestoreData(
                                                                    _model
                                                                        .participants,
                                                                  ),
                                                                },
                                                              ),
                                                            });
                                                          }(),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final participants2 = participantsEventsRecord
                                      .participantUsers
                                      .toList();
                                  if (participants2.isEmpty) {
                                    return Center(
                                      child: Container(
                                        height: 230.0,
                                        child: EmptyListWidgetWidget(
                                          text:
                                              'You have no participants at the moment',
                                        ),
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      32.0,
                                      0,
                                      0,
                                    ),
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: participants2.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 15.0),
                                    itemBuilder: (context, participants2Index) {
                                      final participants2Item =
                                          participants2[participants2Index];
                                      return FutureBuilder<UsersRecord>(
                                        future: UsersRecord.getDocumentOnce(
                                            participants2Item.user!),
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
                                          final rowUsersRecord = snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/100/600',
                                                      width: 53.0,
                                                      height: 53.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
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
                                                                    'LTSuperior',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Applied to Join ${dateTimeFormat('M/d h:mm a', participants2Item.when)}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'LTSuperior',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 10.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 38.0,
                                                      fillColor:
                                                          Color(0x27FF3B30),
                                                      icon: Icon(
                                                        Icons.close,
                                                        color:
                                                            Color(0xFFFF3B30),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.removeFromParticipants(
                                                            participants2Item);
                                                        setState(() {});

                                                        await widget
                                                            .event!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'participant_users':
                                                                  getParticipantsListFirestoreData(
                                                                _model
                                                                    .participants,
                                                              ),
                                                            },
                                                          ),
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
