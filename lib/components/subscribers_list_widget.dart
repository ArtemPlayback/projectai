import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'subscribers_list_model.dart';
export 'subscribers_list_model.dart';

class SubscribersListWidget extends StatefulWidget {
  const SubscribersListWidget({
    super.key,
    required this.users,
    required this.company,
  });

  final List<DocumentReference>? users;
  final ProjectsRecord? company;

  @override
  State<SubscribersListWidget> createState() => _SubscribersListWidgetState();
}

class _SubscribersListWidgetState extends State<SubscribersListWidget> {
  late SubscribersListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscribersListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.invites = widget.company!.invites.toList().cast<InvitesStruct>();
      setState(() {});
      _model.querried = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) =>
            usersRecord.whereIn('uid', widget.users?.map((e) => e.id).toList()),
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                final users = widget.users!.toList();
                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    120.0,
                    0,
                    0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: users.length,
                  separatorBuilder: (_, __) => SizedBox(height: 15.0),
                  itemBuilder: (context, usersIndex) {
                    final usersItem = users[usersIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: FutureBuilder<UsersRecord>(
                            future: UsersRecord.getDocumentOnce(usersItem),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 53.0,
                                        height: 55.0,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              rowUsersRecord.displayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.invites
                                              .where((e) =>
                                                  e.who == currentUserReference)
                                              .toList()
                                              .length <=
                                          0) {
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            _model.addToInvites(InvitesStruct(
                                              who: rowUsersRecord.reference,
                                              where: widget.company?.reference,
                                              role: 'Team Member',
                                              when: getCurrentTimestamp,
                                              inviterName:
                                                  currentUserDisplayName,
                                              status:
                                                  TeamMemberStatus.isWaiting,
                                            ));
                                            setState(() {});
                                            unawaited(
                                              () async {
                                                await widget.company!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'invites': FieldValue
                                                          .arrayUnion([
                                                        getInvitesFirestoreData(
                                                          createInvitesStruct(
                                                            who: rowUsersRecord
                                                                .reference,
                                                            where: widget
                                                                .company
                                                                ?.reference,
                                                            role: 'Team Member',
                                                            when:
                                                                getCurrentTimestamp,
                                                            inviterName:
                                                                currentUserDisplayName,
                                                            status:
                                                                TeamMemberStatus
                                                                    .isWaiting,
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                          true,
                                                        )
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }(),
                                            );
                                            unawaited(
                                              () async {
                                                await rowUsersRecord
                                                    .notificationChat!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'notifications':
                                                          FieldValue
                                                              .arrayUnion([
                                                        getNotificationsFirestoreData(
                                                          updateNotificationsStruct(
                                                            NotificationsStruct(
                                                              user:
                                                                  currentUserReference,
                                                              when:
                                                                  getCurrentTimestamp,
                                                              type: NotificationTypes
                                                                  .team_invite,
                                                              company: widget
                                                                  .company
                                                                  ?.reference,
                                                              isSeen: false,
                                                              id: random_data
                                                                  .randomString(
                                                                10,
                                                                12,
                                                                true,
                                                                false,
                                                                true,
                                                              ),
                                                              invite:
                                                                  InvitesStruct(
                                                                who:
                                                                    currentUserReference,
                                                                where: widget
                                                                    .company
                                                                    ?.reference,
                                                                role:
                                                                    'Team Member',
                                                              ),
                                                            ),
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                          true,
                                                        )
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }(),
                                            );
                                          },
                                          text: 'Add',
                                          options: FFButtonOptions(
                                            height: 36.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 30.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      } else {
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            _model.removeFromInvites(
                                                InvitesStruct(
                                              who: rowUsersRecord.reference,
                                              where: widget.company?.reference,
                                              role: 'Team Member',
                                              when: getCurrentTimestamp,
                                              inviterName:
                                                  currentUserDisplayName,
                                              status:
                                                  TeamMemberStatus.isWaiting,
                                            ));
                                            setState(() {});
                                            unawaited(
                                              () async {
                                                await widget.company!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'invites': FieldValue
                                                          .arrayRemove([
                                                        getInvitesFirestoreData(
                                                          createInvitesStruct(
                                                            who: rowUsersRecord
                                                                .reference,
                                                            where: widget
                                                                .company
                                                                ?.reference,
                                                            role: 'Team Member',
                                                            when:
                                                                getCurrentTimestamp,
                                                            inviterName:
                                                                currentUserDisplayName,
                                                            status:
                                                                TeamMemberStatus
                                                                    .isWaiting,
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                          true,
                                                        )
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }(),
                                            );
                                            unawaited(
                                              () async {
                                                await rowUsersRecord
                                                    .notificationChat!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'notifications':
                                                          FieldValue
                                                              .arrayRemove([
                                                        getNotificationsFirestoreData(
                                                          updateNotificationsStruct(
                                                            NotificationsStruct(
                                                              user:
                                                                  currentUserReference,
                                                              when:
                                                                  getCurrentTimestamp,
                                                              type: NotificationTypes
                                                                  .team_invite,
                                                              company: widget
                                                                  .company
                                                                  ?.reference,
                                                              isSeen: false,
                                                              id: random_data
                                                                  .randomString(
                                                                10,
                                                                12,
                                                                true,
                                                                false,
                                                                true,
                                                              ),
                                                              invite:
                                                                  InvitesStruct(
                                                                who:
                                                                    currentUserReference,
                                                                where: widget
                                                                    .company
                                                                    ?.reference,
                                                                role:
                                                                    'Team Member',
                                                              ),
                                                            ),
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                          true,
                                                        )
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }(),
                                            );
                                          },
                                          text: 'Remove ',
                                          options: FFButtonOptions(
                                            height: 36.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 30.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFEE3A45),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
            ),
            Container(
              width: double.infinity,
              height: 110.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add to team',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'LTSuperior',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).textAndStroke,
                          borderRadius: 10.0,
                          borderWidth: 1.0,
                          buttonSize: 36.0,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 25.0),
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
                            safeSetState(() {
                              _model.simpleSearchResults = TextSearch(
                                _model.querried!
                                    .map(
                                      (record) => TextSearchItem.fromTerms(
                                          record,
                                          [record.email!, record.displayName!]),
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
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'LTSuperior',
                                    color: FlutterFlowTheme.of(context).a3a3b3,
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).primaryText,
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
                        validator:
                            _model.textControllerValidator.asValidator(context),
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
