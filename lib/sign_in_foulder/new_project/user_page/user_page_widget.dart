import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/event_card_small_widget.dart';
import '/components/image_slider_widget.dart';
import '/components/information_modal_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/navigationbar_widget.dart';
import '/components/project_small_card_widget.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import '/sign_in_foulder/new_project/create_new_publication/create_new_publication_widget.dart';
import '/sign_in_foulder/new_project/post_card/post_card_widget.dart';
import '/sign_in_foulder/new_project/user_options/user_options_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_page_model.dart';
export 'user_page_model.dart';

class UserPageWidget extends StatefulWidget {
  const UserPageWidget({
    super.key,
    required this.user,
  });

  final UsersRecord? user;

  @override
  State<UserPageWidget> createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  late UserPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.subscribedPeople =
          widget.user!.subscribers.toList().cast<SubscriptionsStruct>();
      _model.subscribed = (currentUserDocument?.subscriptions?.toList() ?? [])
              .where((e) => e.user == widget.user?.reference)
              .toList()
              .length >
          0;
      setState(() {});
      await Future.wait([
        Future(() async {
          if ((widget.user?.products != null &&
                  (widget.user?.products)!.isNotEmpty) ==
              false) {
            _model.productsQuery = await queryProductsRecordOnce(
              queryBuilder: (productsRecord) => productsRecord.where(
                'owner_person',
                isEqualTo: widget.user?.reference,
              ),
            );
          }
        }),
        Future(() async {
          if (widget.user!.events.isNotEmpty) {
            _model.eventsQuery = await queryEventsRecordOnce(
              queryBuilder: (eventsRecord) => eventsRecord.where(
                'user',
                isEqualTo: currentUserReference,
              ),
            );
          }
        }),
        Future(() async {
          if (widget.user!.projects.isNotEmpty) {
            _model.projectsQuery = await queryProjectsRecordOnce(
              queryBuilder: (projectsRecord) => projectsRecord.where(
                'user',
                isEqualTo: currentUserReference,
              ),
            );
          }
        }),
      ]);
    });

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (widget.user?.cover != null &&
                            widget.user?.cover != '') {
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).width - 45,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: Image.network(
                                  widget.user!.cover,
                                ).image,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x8D000000),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signOut();
                                              GoRouter.of(context)
                                                  .clearRedirectLocation();

                                              context.goNamedAuth(
                                                  'sign_in', context.mounted);
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(360.0),
                                              child: Image.network(
                                                widget.user!.photoUrl,
                                                width: 83.0,
                                                height: 83.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    17.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    widget.user?.displayName,
                                                    'Name',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color: Colors.white,
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Text(
                                                  'Last seen recently',
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            Color(0xC2FFFFFF),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.user?.reference !=
                                            currentUserReference) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 6.0,
                                                        sigmaY: 6.0,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .buttonInfinityModel1,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            ButtonInfinityWidget(
                                                          width: 428.0,
                                                          height: 42.0,
                                                          buttonColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .darkBlur,
                                                          text: 'Message',
                                                          borderColor:
                                                              Color(0x35FFFFFF),
                                                          fontsize: 14,
                                                          textcolor:
                                                              Colors.white,
                                                          icon: Icon(
                                                            FFIcons.kbiChat,
                                                            color: Colors.white,
                                                            size: 15.0,
                                                          ),
                                                          action: () async {
                                                            context.pushNamed(
                                                              'chat_page',
                                                              queryParameters: {
                                                                'user':
                                                                    serializeParam(
                                                                  widget.user,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'user':
                                                                    widget.user,
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (widget.user?.reference !=
                                                    currentUserReference)
                                                  Builder(
                                                    builder: (context) {
                                                      if (!_model.subscribed) {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 6.0,
                                                              sigmaY: 6.0,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Color(
                                                                  0x3FC6C6D5),
                                                              borderRadius:
                                                                  10.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .whiteBlur,
                                                              icon: Icon(
                                                                Icons
                                                                    .person_add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 18.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                _model.subscribed =
                                                                    true;
                                                                setState(() {});
                                                                unawaited(
                                                                  () async {
                                                                    await widget
                                                                        .user!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'subscribers':
                                                                              FieldValue.arrayUnion([
                                                                            getSubscriptionsFirestoreData(
                                                                              updateSubscriptionsStruct(
                                                                                SubscriptionsStruct(
                                                                                  type: 'User',
                                                                                  user: currentUserReference,
                                                                                ),
                                                                                clearUnsetFields: false,
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
                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'subscriptions':
                                                                              FieldValue.arrayUnion([
                                                                            getSubscriptionsFirestoreData(
                                                                              updateSubscriptionsStruct(
                                                                                SubscriptionsStruct(
                                                                                  type: 'User',
                                                                                  user: widget.user?.reference,
                                                                                ),
                                                                                clearUnsetFields: false,
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
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 6.0,
                                                              sigmaY: 6.0,
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                _model.subscribed =
                                                                    false;
                                                                setState(() {});
                                                                unawaited(
                                                                  () async {
                                                                    await widget
                                                                        .user!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'subscribers':
                                                                              FieldValue.arrayRemove([
                                                                            getSubscriptionsFirestoreData(
                                                                              updateSubscriptionsStruct(
                                                                                SubscriptionsStruct(
                                                                                  type: 'User',
                                                                                  user: currentUserReference,
                                                                                ),
                                                                                clearUnsetFields: false,
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
                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'subscriptions':
                                                                              FieldValue.arrayRemove([
                                                                            getSubscriptionsFirestoreData(
                                                                              updateSubscriptionsStruct(
                                                                                SubscriptionsStruct(
                                                                                  type: 'User',
                                                                                  user: widget.user?.reference,
                                                                                ),
                                                                                clearUnsetFields: false,
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
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .userCheck,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 6.0,
                                                      sigmaY: 6.0,
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                      borderRadius: 10.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .whiteBlur,
                                                      icon: Icon(
                                                        Icons.keyboard_control,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (currentUserReference ==
                                                            widget.user
                                                                ?.reference) {
                                                          context.pushNamed(
                                                              'settings');
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0x66000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      UserOptionsWidget(
                                                                    user: widget
                                                                        .user!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 6.0,
                                                        sigmaY: 6.0,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .buttonInfinityModel2,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            ButtonInfinityWidget(
                                                          width: 700.0,
                                                          height: 42.0,
                                                          buttonColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .darkBlur,
                                                          text:
                                                              'New publication',
                                                          borderColor:
                                                              Color(0x35FFFFFF),
                                                          fontsize: 14,
                                                          textcolor:
                                                              Colors.white,
                                                          icon: Icon(
                                                            FFIcons.kadd1,
                                                            color: Colors.white,
                                                            size: 17.0,
                                                          ),
                                                          action: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x69000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          215.0,
                                                                      child:
                                                                          CreateNewPublicationWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 6.0,
                                                      sigmaY: 6.0,
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                      borderRadius: 10.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .whiteBlur,
                                                      icon: Icon(
                                                        Icons.keyboard_control,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            'settings');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: double.infinity,
                            height: 290.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signOut();
                                              GoRouter.of(context)
                                                  .clearRedirectLocation();

                                              context.goNamedAuth(
                                                  'sign_in', context.mounted);
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(360.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  widget.user?.photoUrl !=
                                                              null &&
                                                          widget.user
                                                                  ?.photoUrl !=
                                                              ''
                                                      ? widget.user?.photoUrl
                                                      : 'https://t4.ftcdn.net/jpg/02/17/34/67/360_F_217346796_TSg5VcYjsFxZtIDK6Qdctg3yqAapG7Xa.jpg',
                                                  'https://t4.ftcdn.net/jpg/02/17/34/67/360_F_217346796_TSg5VcYjsFxZtIDK6Qdctg3yqAapG7Xa.jpg',
                                                ),
                                                width: 83.0,
                                                height: 83.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    17.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    widget.user?.displayName,
                                                    'er',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Text(
                                                  'Last seen recently',
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.user?.reference !=
                                            currentUserReference) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 6.0,
                                                        sigmaY: 6.0,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .buttonInfinityModel3,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            ButtonInfinityWidget(
                                                          width: 428.0,
                                                          height: 42.0,
                                                          buttonColor:
                                                              Color(0xBC007AFF),
                                                          text: 'Message',
                                                          borderColor:
                                                              Color(0x35FFFFFF),
                                                          fontsize: 14,
                                                          textcolor:
                                                              Colors.white,
                                                          icon: Icon(
                                                            FFIcons.kbiChat,
                                                            color: Colors.white,
                                                            size: 15.0,
                                                          ),
                                                          action: () async {
                                                            context.pushNamed(
                                                              'chat_page',
                                                              queryParameters: {
                                                                'user':
                                                                    serializeParam(
                                                                  widget.user,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'user':
                                                                    widget.user,
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (widget.user?.reference !=
                                                    currentUserReference)
                                                  Builder(
                                                    builder: (context) {
                                                      if (!_model.subscribed) {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 6.0,
                                                              sigmaY: 6.0,
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Color(
                                                                  0x3FC6C6D5),
                                                              borderRadius:
                                                                  10.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 42.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              icon: Icon(
                                                                Icons
                                                                    .person_add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 18.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                _model.subscribed =
                                                                    true;
                                                                setState(() {});
                                                                unawaited(
                                                                  () async {
                                                                    await widget
                                                                        .user!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'subscribers':
                                                                              FieldValue.arrayUnion([
                                                                            getSubscriptionsFirestoreData(
                                                                              updateSubscriptionsStruct(
                                                                                SubscriptionsStruct(
                                                                                  type: 'User',
                                                                                  user: currentUserReference,
                                                                                ),
                                                                                clearUnsetFields: false,
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
                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'subscriptions':
                                                                              FieldValue.arrayUnion([
                                                                            getSubscriptionsFirestoreData(
                                                                              updateSubscriptionsStruct(
                                                                                SubscriptionsStruct(
                                                                                  type: 'User',
                                                                                  user: widget.user?.reference,
                                                                                ),
                                                                                clearUnsetFields: false,
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
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 6.0,
                                                              sigmaY: 6.0,
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                _model.subscribed =
                                                                    false;
                                                                setState(() {});
                                                                unawaited(
                                                                  () async {
                                                                    await widget
                                                                        .user!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'subscribers':
                                                                              FieldValue.arrayRemove([
                                                                            getSubscriptionsFirestoreData(
                                                                              updateSubscriptionsStruct(
                                                                                SubscriptionsStruct(
                                                                                  type: 'User',
                                                                                  user: currentUserReference,
                                                                                ),
                                                                                clearUnsetFields: false,
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
                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'subscriptions':
                                                                              FieldValue.arrayRemove([
                                                                            getSubscriptionsFirestoreData(
                                                                              updateSubscriptionsStruct(
                                                                                SubscriptionsStruct(
                                                                                  type: 'User',
                                                                                  user: widget.user?.reference,
                                                                                ),
                                                                                clearUnsetFields: false,
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
                                                              child: Container(
                                                                width: 42.0,
                                                                height: 42.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .userCheck,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 6.0,
                                                      sigmaY: 6.0,
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                      borderRadius: 10.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 42.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .whiteBlur,
                                                      icon: Icon(
                                                        Icons.keyboard_control,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (currentUserReference ==
                                                            widget.user
                                                                ?.reference) {
                                                          context.pushNamed(
                                                              'settings');
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0x66000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      UserOptionsWidget(
                                                                    user: widget
                                                                        .user!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 6.0,
                                                        sigmaY: 6.0,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .buttonInfinityModel4,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            ButtonInfinityWidget(
                                                          width: 700.0,
                                                          height: 42.0,
                                                          buttonColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          text:
                                                              'New publication',
                                                          fontsize: 14,
                                                          textcolor:
                                                              Colors.white,
                                                          icon: Icon(
                                                            FFIcons.kadd1,
                                                            color: Colors.white,
                                                            size: 17.0,
                                                          ),
                                                          action: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x69000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          215.0,
                                                                      child:
                                                                          CreateNewPublicationWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 6.0,
                                                      sigmaY: 6.0,
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                      borderRadius: 10.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .whiteBlur,
                                                      icon: Icon(
                                                        Icons.keyboard_control,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (currentUserReference ==
                                                            widget.user
                                                                ?.reference) {
                                                          context.pushNamed(
                                                              'settings');
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0x66000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      UserOptionsWidget(
                                                                    user: widget
                                                                        .user!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  if (widget.user?.subscriptions != null &&
                      (widget.user?.subscriptions)!.isNotEmpty)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.user?.subscriptions?.length?.toString()} subscrptions',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 3.0, 0.0, 0.0),
                                    child: Text(
                                      !_model.subscribed
                                          ? 'You are subscribed'
                                          : 'You are not subscribed',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 64.0,
                                child: Stack(
                                  children: [
                                    if (widget.user!.subscriptions.length >= 3)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if ((widget.user?.subscriptions?[2])
                                                    ?.type ==
                                                'User') {
                                              return FutureBuilder<UsersRecord>(
                                                future:
                                                    UsersRecord.getDocumentOnce(
                                                        widget
                                                            .user!
                                                            .subscriptions[2]
                                                            .user!),
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
                                                  final containerUsersRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerUsersRecord
                                                              .photoUrl,
                                                          'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              return FutureBuilder<
                                                  ProjectsRecord>(
                                                future: ProjectsRecord
                                                    .getDocumentOnce(widget
                                                        .user!
                                                        .subscriptions[2]
                                                        .company!),
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
                                                  final containerProjectsRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerProjectsRecord
                                                              .mainImage,
                                                          'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    if (widget.user!.subscriptions.length >= 2)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if ((widget.user?.subscriptions?[2])
                                                    ?.type ==
                                                'User') {
                                              return FutureBuilder<UsersRecord>(
                                                future:
                                                    UsersRecord.getDocumentOnce(
                                                        widget
                                                            .user!
                                                            .subscriptions[1]
                                                            .user!),
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
                                                  final containerUsersRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerUsersRecord
                                                              .photoUrl,
                                                          'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              return FutureBuilder<
                                                  ProjectsRecord>(
                                                future: ProjectsRecord
                                                    .getDocumentOnce(widget
                                                        .user!
                                                        .subscriptions[1]
                                                        .company!),
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
                                                  final containerProjectsRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerProjectsRecord
                                                              .mainImage,
                                                          'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    if (widget.user!.subscriptions.length >= 1)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if ((widget.user?.subscriptions?[2])
                                                    ?.type ==
                                                'User') {
                                              return FutureBuilder<UsersRecord>(
                                                future:
                                                    UsersRecord.getDocumentOnce(
                                                        widget
                                                            .user!
                                                            .subscriptions[0]
                                                            .user!),
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
                                                  final containerUsersRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerUsersRecord
                                                              .photoUrl,
                                                          'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              return FutureBuilder<
                                                  ProjectsRecord>(
                                                future: ProjectsRecord
                                                    .getDocumentOnce(widget
                                                        .user!
                                                        .subscriptions[0]
                                                        .company!),
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
                                                  final containerProjectsRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerProjectsRecord
                                                              .mainImage,
                                                          'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if ((widget.user?.description != null &&
                          widget.user?.description != '') ||
                      ((widget.user?.sections != null &&
                              (widget.user?.sections)!.isNotEmpty) ==
                          true) ||
                      (widget.user?.professionalInformation != null &&
                          widget.user?.professionalInformation != ''))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (valueOrDefault(
                                              currentUserDocument?.description,
                                              '') !=
                                          null &&
                                      valueOrDefault(
                                              currentUserDocument?.description,
                                              '') !=
                                          '')
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        'About ${widget.user?.displayName}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              useGoogleFonts: false,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                    ),
                                  if (valueOrDefault(
                                              currentUserDocument?.description,
                                              '') !=
                                          null &&
                                      valueOrDefault(
                                              currentUserDocument?.description,
                                              '') !=
                                          '')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              widget.user?.description,
                                              'Name',
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 5,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'LTSuperior',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((widget.user?.description != null &&
                                          widget.user?.description != '') ||
                                      ((widget.user?.sections != null &&
                                              (widget.user?.sections)!
                                                  .isNotEmpty) ==
                                          true) ||
                                      (widget.user?.professionalInformation !=
                                              null &&
                                          widget.user
                                                  ?.professionalInformation !=
                                              ''))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: wrapWithModel(
                                              model:
                                                  _model.buttonFixedSizeModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: ButtonFixedSizeWidget(
                                                width: 500.0,
                                                height: 36.0,
                                                buttonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                text: 'Information',
                                                fontsize: 14,
                                                textcolor: Colors.white,
                                                showLoadingIndicator: false,
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 0.0,
                                                ),
                                                action: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x67000000),
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.9,
                                                            child:
                                                                InformationModalWidget(
                                                              user:
                                                                  widget.user!,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
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
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Visibility(
                        visible: (widget.user!.images.isNotEmpty) ||
                            (widget.user!.products.isNotEmpty) ||
                            (widget.user!.events.isNotEmpty) ||
                            (widget.user!.products.isNotEmpty) ||
                            true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.chosen = 'Images';
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 33.0,
                                            decoration: BoxDecoration(
                                              color: _model.chosen == 'Images'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: _model.chosen == 'Images'
                                                    ? Color(0x01007AFF)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .textAndStroke,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Text(
                                                  'Images',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color: _model.chosen ==
                                                                'Images'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .textAndStroke,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (widget.user?.projects != null &&
                                            (widget.user?.projects)!.isNotEmpty)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.chosen = 'Companies';
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 33.0,
                                              decoration: BoxDecoration(
                                                color: _model.chosen ==
                                                        'Companies'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: _model.chosen ==
                                                          'Companies'
                                                      ? Color(0x01007AFF)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .textAndStroke,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Companies',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'LTSuperior',
                                                              color: _model
                                                                          .chosen ==
                                                                      'Companies'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .textAndStroke,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (widget.user?.products != null &&
                                            (widget.user?.products)!.isNotEmpty)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.chosen = 'Products';
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 33.0,
                                              decoration: BoxDecoration(
                                                color: _model.chosen ==
                                                        'Products'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: _model.chosen ==
                                                          'Products'
                                                      ? Color(0x01007AFF)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .textAndStroke,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Products',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'LTSuperior',
                                                              color: _model
                                                                          .chosen ==
                                                                      'Products'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .textAndStroke,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (widget.user?.events != null &&
                                            (widget.user?.events)!.isNotEmpty)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.chosen = 'Events';
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 33.0,
                                              decoration: BoxDecoration(
                                                color: _model.chosen == 'Events'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color:
                                                      _model.chosen == 'Events'
                                                          ? Color(0x01007AFF)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Events',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'LTSuperior',
                                                              color: _model
                                                                          .chosen ==
                                                                      'Events'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .textAndStroke,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ]
                                          .divide(SizedBox(width: 7.0))
                                          .addToStart(SizedBox(width: 20.0))
                                          .addToEnd(SizedBox(width: 20.0)),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    if (_model.chosen == 'Images') {
                                      return Builder(
                                        builder: (context) {
                                          if ((currentUserDocument?.images
                                                          ?.toList() ??
                                                      [])
                                                  .length !=
                                              0) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 16.0,
                                                          20.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Visibility(
                                                        visible: (currentUserDocument
                                                                        ?.images
                                                                        ?.toList() ??
                                                                    [])
                                                                .length !=
                                                            0,
                                                        child: Builder(
                                                          builder: (context) {
                                                            final images = (functions
                                                                        .reverseImagesList(widget
                                                                            .user
                                                                            ?.images
                                                                            ?.toList())
                                                                        ?.toList() ??
                                                                    [])
                                                                .take(6)
                                                                .toList();
                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    3,
                                                                crossAxisSpacing:
                                                                    2.0,
                                                                mainAxisSpacing:
                                                                    2.0,
                                                                childAspectRatio:
                                                                    1.0,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  images.length,
                                                              itemBuilder: (context,
                                                                  imagesIndex) {
                                                                final imagesItem =
                                                                    images[
                                                                        imagesIndex];
                                                                return Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showDialog(
                                                                        barrierColor:
                                                                            Color(0x04000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                child: ImageSliderWidget(
                                                                                  images: (currentUserDocument?.images?.toList() ?? []),
                                                                                  initialindex: imagesIndex,
                                                                                  user: widget.user,
                                                                                  isThisYours: false,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child: Hero(
                                                                      tag:
                                                                          imagesItem,
                                                                      transitionOnUserGestures:
                                                                          true,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: Image
                                                                            .network(
                                                                          imagesItem,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Opacity(
                                                  opacity: 0.6,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  18.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textAndStroke,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.6,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Container(
                                                          width: 1.0,
                                                          height: 25.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .textAndStroke,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'imageGallery',
                                                            queryParameters: {
                                                              'user':
                                                                  serializeParam(
                                                                widget.user,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'images':
                                                                  serializeParam(
                                                                widget.user
                                                                    ?.images,
                                                                ParamType
                                                                    .String,
                                                                isList: true,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'user':
                                                                  widget.user,
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Show all',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'LTSuperior',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .thirdText,
                                                                      size:
                                                                          13.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/no_image_placeholder.png',
                                                        width: 350.0,
                                                        height: 190.0,
                                                        fit: BoxFit.cover,
                                                        alignment:
                                                            Alignment(0.0, 0.0),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  120.0,
                                                                  5.0,
                                                                  120.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${widget.user?.displayName} haven\'t added any images yet',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'LTSuperior',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    } else if (_model.chosen == 'Products') {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 18.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final products = _model
                                                          .productsQuery
                                                          ?.toList() ??
                                                      [];
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                              products.length,
                                                              (productsIndex) {
                                                        final productsItem =
                                                            products[
                                                                productsIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'product_page',
                                                              queryParameters: {
                                                                'product':
                                                                    serializeParam(
                                                                  productsItem,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                                'isFrom':
                                                                    serializeParam(
                                                                  'profile',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'product':
                                                                    productsItem,
                                                              },
                                                            );
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                child: Image
                                                                    .network(
                                                                  productsItem
                                                                      .images
                                                                      .first,
                                                                  width: 200.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    productsItem
                                                                        .title,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'LTSuperior',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            1.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '${productsItem.price.toString()}\$',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'LTSuperior',
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      })
                                                          .divide(SizedBox(
                                                              width: 10.0))
                                                          .addToStart(SizedBox(
                                                              width: 20.0))
                                                          .addToEnd(SizedBox(
                                                              width: 20.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.6,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 18.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textAndStroke,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Opacity(
                                                opacity: 0.6,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Container(
                                                    width: 1.0,
                                                    height: 25.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Show all',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'LTSuperior',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        2.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .thirdText,
                                                              size: 13.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    } else if (_model.chosen == 'Events') {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 25.0, 0.0, 12.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final events = functions
                                                          .reverseEventsList(
                                                              _model
                                                                  .eventsQuery!
                                                                  .toList())
                                                          .toList();
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            events.length,
                                                            (eventsIndex) {
                                                          final eventsItem =
                                                              events[
                                                                  eventsIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'event_page',
                                                                  queryParameters:
                                                                      {
                                                                    'events':
                                                                        serializeParam(
                                                                      eventsItem,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                    'isFrom':
                                                                        serializeParam(
                                                                      'profile',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'events':
                                                                        eventsItem,
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  EventCardSmallWidget(
                                                                key: Key(
                                                                    'Keyuwj_${eventsIndex}_of_${events.length}'),
                                                                event:
                                                                    eventsItem,
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            width: 10.0)),
                                                      );
                                                    },
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(width: 10.0))
                                                    .addToStart(
                                                        SizedBox(width: 20.0))
                                                    .addToEnd(
                                                        SizedBox(width: 20.0)),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Opacity(
                                                opacity: 0.6,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Opacity(
                                                    opacity: 0.6,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Container(
                                                        width: 1.0,
                                                        height: 25.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textAndStroke,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Show all',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'LTSuperior',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .thirdText,
                                                                  size: 13.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final projects = _model
                                                            .projectsQuery
                                                            ?.toList() ??
                                                        [];
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                                projects.length,
                                                                (projectsIndex) {
                                                          final projectsItem =
                                                              projects[
                                                                  projectsIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child:
                                                                ProjectSmallCardWidget(
                                                              key: Key(
                                                                  'Keyeqj_${projectsIndex}_of_${projects.length}'),
                                                              parameter2:
                                                                  projectsItem
                                                                      .title,
                                                              companyRef:
                                                                  projectsItem,
                                                            ),
                                                          );
                                                        })
                                                            .divide(SizedBox(
                                                                width: 14.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    width:
                                                                        20.0))
                                                            .addToEnd(SizedBox(
                                                                width: 20.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.6,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 30.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Opacity(
                                                  opacity: 0.6,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Container(
                                                      width: 1.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textAndStroke,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Show all',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'LTSuperior',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .thirdText,
                                                                size: 13.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  StreamBuilder<List<PostsRecord>>(
                    stream: queryPostsRecord(
                      queryBuilder: (postsRecord) => postsRecord.where(
                        'user',
                        isEqualTo: widget.user?.reference,
                      ),
                    ),
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
                      List<PostsRecord> containerPostsRecordList =
                          snapshot.data!;
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Builder(
                            builder: (context) {
                              if (containerPostsRecordList.length != 0) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final posts =
                                          containerPostsRecordList.toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: posts.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 4.0),
                                        itemBuilder: (context, postsIndex) {
                                          final postsItem = posts[postsIndex];
                                          return PostCardWidget(
                                            key: Key(
                                                'Keyo8d_${postsIndex}_of_${posts.length}'),
                                            isAuthUser: true,
                                            post: postsItem,
                                            user: widget.user,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 6.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/no_posts.png',
                                                  height: 190.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      120.0, 5.0, 120.0, 0.0),
                                              child: Text(
                                                'You haven\'t added any posts yet',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
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
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ].addToEnd(SizedBox(height: 110.0)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navigationbarModel,
                updateCallback: () => setState(() {}),
                child: NavigationbarWidget(
                  chosen: 'User Page',
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.navigateBackModel,
                    updateCallback: () => setState(() {}),
                    child: NavigateBackWidget(
                      parameter1: 'smartsearch',
                    ),
                  ),
                ),
                if (widget.user?.reference != currentUserReference)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => wrapWithModel(
                        model: _model.toggleModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: ToggleWidget(
                          boolean: (currentUserDocument?.saved?.toList() ?? [])
                                  .where(
                                      (e) => e.people == widget.user?.reference)
                                  .toList()
                                  .length >
                              0,
                          toggleOn: () async {
                            unawaited(
                              () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'saved': FieldValue.arrayUnion([
                                        getSavedFirestoreData(
                                          updateSavedStruct(
                                            SavedStruct(
                                              people: currentUserReference,
                                            ),
                                            clearUnsetFields: false,
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
                          toggleOff: () async {
                            unawaited(
                              () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'saved': FieldValue.arrayRemove([
                                        getSavedFirestoreData(
                                          updateSavedStruct(
                                            SavedStruct(
                                              people: currentUserReference,
                                            ),
                                            clearUnsetFields: false,
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
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
