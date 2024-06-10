import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/event_card_small_widget.dart';
import '/components/image_slider_widget.dart';
import '/components/information_modal_company_widget.dart';
import '/components/navigate_back_widget.dart';
import '/components/navigationbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import '/new_project/create_new_publication/create_new_publication_widget.dart';
import '/new_project/post_card/post_card_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'company_page_model.dart';
export 'company_page_model.dart';

class CompanyPageWidget extends StatefulWidget {
  const CompanyPageWidget({
    super.key,
    required this.company,
  });

  final ProjectsRecord? company;

  @override
  State<CompanyPageWidget> createState() => _CompanyPageWidgetState();
}

class _CompanyPageWidgetState extends State<CompanyPageWidget>
    with TickerProviderStateMixin {
  late CompanyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompanyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if ((widget.company?.products != null &&
                  (widget.company?.products)!.isNotEmpty) ==
              false) {
            _model.productsQuery = await queryProductsRecordOnce(
              queryBuilder: (productsRecord) => productsRecord.where(
                'owner_company',
                isEqualTo: widget.company?.reference,
              ),
            );
          }
        }),
        Future(() async {
          if (widget.company!.events.isNotEmpty) {
            _model.eventsQuery = await queryEventsRecordOnce(
              queryBuilder: (eventsRecord) => eventsRecord.where(
                'project',
                isEqualTo: widget.company?.reference,
              ),
            );
          }
        }),
      ]);
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 240.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
                        if (widget.company?.cover != null &&
                            widget.company?.cover != '') {
                          return ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).width - 45,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    widget.company!.cover,
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
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 30.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              highlightColor:
                                                  Colors.transparent,
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
                                                    BorderRadius.circular(
                                                        360.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    widget.company?.mainImage,
                                                    'https://firebasestorage.googleapis.com/v0/b/project-e33e5.appspot.com/o/placeholder%20company.png?alt=media&token=2808caf2-01cb-4434-9d4c-3f16d9ebfab5',
                                                  ),
                                                  width: 83.0,
                                                  height: 83.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      17.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      widget.company?.title,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                                    child: ButtonInfinityWidget(
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
                                                      textcolor: Colors.white,
                                                      icon: Icon(
                                                        FFIcons.kbiChat,
                                                        color: Colors.white,
                                                        size: 15.0,
                                                      ),
                                                      action: () async {
                                                        context.pushNamed(
                                                          'chat_page',
                                                          queryParameters: {
                                                            'company':
                                                                serializeParam(
                                                              widget.company,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'company':
                                                                widget.company,
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 6.0,
                                                  sigmaY: 6.0,
                                                ),
                                                child: FlutterFlowIconButton(
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
                                                    FFIcons.kadd,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 14.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: double.infinity,
                            height: 290.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF242526),
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
                                                  widget.company?.mainImage,
                                                  'https://firebasestorage.googleapis.com/v0/b/project-e33e5.appspot.com/o/placeholder%20company.png?alt=media&token=2808caf2-01cb-4434-9d4c-3f16d9ebfab5',
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
                                                    widget.company?.title,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 15.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
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
                                                  child: ButtonInfinityWidget(
                                                    width: 428.0,
                                                    height: 42.0,
                                                    buttonColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .whiteBlur,
                                                    text: 'New publication',
                                                    borderColor:
                                                        Color(0x35FFFFFF),
                                                    fontsize: 14,
                                                    textcolor: Colors.white,
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
                                                            Colors.transparent,
                                                        barrierColor:
                                                            Color(0x69000000),
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: 265.0,
                                                                child:
                                                                    CreateNewPublicationWidget(),
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
                                            ),
                                          ),
                                          if (widget.company?.user ==
                                              currentUserReference)
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 6.0,
                                                  sigmaY: 6.0,
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Color(0x2BC6C6D5),
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .whiteBlur,
                                                  icon: Icon(
                                                    Icons.keyboard_control,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                                            '') ==
                                        null ||
                                    valueOrDefault(
                                            currentUserDocument?.description,
                                            '') ==
                                        '')
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      'About ${widget.company?.title}',
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
                                if ((valueOrDefault(
                                                currentUserDocument
                                                    ?.description,
                                                '') ==
                                            null ||
                                        valueOrDefault(
                                                currentUserDocument
                                                    ?.description,
                                                '') ==
                                            '') &&
                                    (widget.company?.user ==
                                        currentUserReference))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        'Tell more about yourself in settings',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              color: Color(0xBF1D1D20),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
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
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault<String>(
                                            widget.company?.projectInformation
                                                ?.shortDescription,
                                            'Name',
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 5,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: wrapWithModel(
                                          model: _model.buttonFixedSizeModel1,
                                          updateCallback: () => setState(() {}),
                                          child: ButtonFixedSizeWidget(
                                            width: 350.0,
                                            height: 40.0,
                                            buttonColor: Color(0x03000000),
                                            text: 'More information',
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .textAndStroke,
                                            fontsize: 14,
                                            textcolor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
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
                                                barrierColor: Color(0x7E000000),
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.9,
                                                        child:
                                                            InformationModalCompanyWidget(
                                                          company:
                                                              widget.company!,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 6.0,
                                              sigmaY: 6.0,
                                            ),
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textAndStroke,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'AI',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation']!,
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
                                      if (widget.company?.user !=
                                          currentUserReference)
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
                                      if (widget.company?.user !=
                                          currentUserReference)
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
                                              color: _model.chosen == 'Products'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color:
                                                    _model.chosen == 'Products'
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color: _model.chosen ==
                                                                'Products'
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
                                      if (widget.company?.user !=
                                          currentUserReference)
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
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: _model.chosen == 'Events'
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color: _model.chosen ==
                                                                'Events'
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
                                        if (widget.company?.images?.length !=
                                            0) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 16.0, 20.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Visibility(
                                                      visible: (currentUserDocument
                                                                      ?.images
                                                                      ?.toList() ??
                                                                  [])
                                                              .length !=
                                                          0,
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Builder(
                                                          builder: (context) {
                                                            final images = (functions
                                                                        .reverseImagesList(widget
                                                                            .company
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
                                                                      _model.user3 =
                                                                          await UsersRecord.getDocumentOnce(
                                                                              currentUserReference!);
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
                                                                                  user: _model.user3,
                                                                                  isThisYours: true,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      setState(
                                                                          () {});
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
                                                            .fromSTEB(0.0, 18.0,
                                                                0.0, 0.0),
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
                                                        final selectedMedia =
                                                            await selectMedia(
                                                          mediaSource:
                                                              MediaSource
                                                                  .photoGallery,
                                                          multiImage: true,
                                                        );
                                                        if (selectedMedia !=
                                                                null &&
                                                            selectedMedia.every((m) =>
                                                                validateFileFormat(
                                                                    m.storagePath,
                                                                    context))) {
                                                          setState(() => _model
                                                                  .isDataUploading1 =
                                                              true);
                                                          var selectedUploadedFiles =
                                                              <FFUploadedFile>[];

                                                          var downloadUrls =
                                                              <String>[];
                                                          try {
                                                            selectedUploadedFiles =
                                                                selectedMedia
                                                                    .map((m) =>
                                                                        FFUploadedFile(
                                                                          name: m
                                                                              .storagePath
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                          blurHash:
                                                                              m.blurHash,
                                                                        ))
                                                                    .toList();

                                                            downloadUrls =
                                                                (await Future
                                                                        .wait(
                                                              selectedMedia.map(
                                                                (m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes),
                                                              ),
                                                            ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                          } finally {
                                                            _model.isDataUploading1 =
                                                                false;
                                                          }
                                                          if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length &&
                                                              downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                            setState(() {
                                                              _model.uploadedLocalFiles1 =
                                                                  selectedUploadedFiles;
                                                              _model.uploadedFileUrls1 =
                                                                  downloadUrls;
                                                            });
                                                          } else {
                                                            setState(() {});
                                                            return;
                                                          }
                                                        }

                                                        unawaited(
                                                          () async {
                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'images': functions.imagesList(
                                                                      _model
                                                                          .uploadedFileUrls2
                                                                          .toList(),
                                                                      (currentUserDocument?.images?.toList() ??
                                                                              [])
                                                                          .toList()),
                                                                },
                                                              ),
                                                            });
                                                          }(),
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
                                                                          8.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kadd1,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .thirdText,
                                                                    size: 15.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Add images',
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
                                                              ],
                                                            ),
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
                                                            'images':
                                                                serializeParam(
                                                              (currentUserDocument
                                                                      ?.images
                                                                      ?.toList() ??
                                                                  []),
                                                              ParamType.String,
                                                              true,
                                                            ),
                                                          }.withoutNulls,
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
                                                                    size: 13.0,
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
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 60.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                      'You haven\'t added any images yet',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'LTSuperior',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .buttonFixedSizeModel2,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          ButtonFixedSizeWidget(
                                                        width: 200.0,
                                                        height: 40.0,
                                                        buttonColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        text: 'Upload images',
                                                        fontsize: 14,
                                                        textcolor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        showLoadingIndicator:
                                                            false,
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 20.0,
                                                        ),
                                                        action: () async {
                                                          final selectedMedia =
                                                              await selectMedia(
                                                            mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                            multiImage: true,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            setState(() => _model
                                                                    .isDataUploading2 =
                                                                true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading2 =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              setState(() {
                                                                _model.uploadedLocalFiles2 =
                                                                    selectedUploadedFiles;
                                                                _model.uploadedFileUrls2 =
                                                                    downloadUrls;
                                                              });
                                                            } else {
                                                              setState(() {});
                                                              return;
                                                            }
                                                          }

                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'images': functions.imagesList(
                                                                    _model
                                                                        .uploadedFileUrls2
                                                                        .toList(),
                                                                    (currentUserDocument?.images?.toList() ??
                                                                            [])
                                                                        .toList()),
                                                              },
                                                            ),
                                                          });
                                                        },
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
                                    return FutureBuilder<List<ProductsRecord>>(
                                      future: FFAppState().productsProfile(
                                        requestFn: () =>
                                            queryProductsRecordOnce(
                                          queryBuilder: (productsRecord) =>
                                              productsRecord.where(
                                            'owner_company',
                                            isEqualTo:
                                                widget.company?.reference,
                                          ),
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
                                        List<ProductsRecord>
                                            containerProductsRecordList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              if (containerProductsRecordList
                                                      .length !=
                                                  0) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    18.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final products =
                                                                containerProductsRecordList
                                                                    .toList();
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                        products
                                                                            .length,
                                                                        (productsIndex) {
                                                                  final productsItem =
                                                                      products[
                                                                          productsIndex];
                                                                  return InkWell(
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
                                                                      context
                                                                          .pushNamed(
                                                                        'product_page',
                                                                        queryParameters:
                                                                            {
                                                                          'product':
                                                                              serializeParam(
                                                                            productsItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'isFrom':
                                                                              serializeParam(
                                                                            'profile',
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'product':
                                                                              productsItem,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          child:
                                                                              Image.network(
                                                                            productsItem.images.first,
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              productsItem.title,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'LTSuperior',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 15.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${productsItem.price.toString()}\$',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'LTSuperior',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                })
                                                                    .divide(SizedBox(
                                                                        width:
                                                                            10.0))
                                                                    .addToStart(
                                                                        SizedBox(
                                                                            width:
                                                                                20.0))
                                                                    .addToEnd(
                                                                        SizedBox(
                                                                            width:
                                                                                20.0)),
                                                              ),
                                                            );
                                                          },
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
                                                            width:
                                                                double.infinity,
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
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
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
                                                              context.pushNamed(
                                                                  'create_product');
                                                            },
                                                            child: Container(
                                                              height: 45.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kadd1,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).thirdText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Add products',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'LTSuperior',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                            child: Container(
                                                              width: 1.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textAndStroke,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Show all',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'LTSuperior',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: FlutterFlowTheme.of(context)
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
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5.0, 20.0, 10.0,
                                                          20.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  15.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Add new product!',
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
                                                                              FontWeight.w800,
                                                                          useGoogleFonts:
                                                                              false,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Add a new product or service to your profile.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'LTSuperior',
                                                                            color:
                                                                                Color(0xBF1D1D20),
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .buttonFixedSizeModel3,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          ButtonFixedSizeWidget(
                                                                        width:
                                                                            180.0,
                                                                        height:
                                                                            40.0,
                                                                        buttonColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        text:
                                                                            'New product',
                                                                        fontsize:
                                                                            14,
                                                                        textcolor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        showLoadingIndicator:
                                                                            false,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        action:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('create_event');
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/Rectangle_41655.png',
                                                              width: 123.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  } else if (_model.chosen == 'Events') {
                                    return FutureBuilder<List<EventsRecord>>(
                                      future: FFAppState().eventsProfile(
                                        requestFn: () => queryEventsRecordOnce(
                                          queryBuilder: (eventsRecord) =>
                                              eventsRecord.where(
                                            'project',
                                            isEqualTo:
                                                widget.company?.reference,
                                          ),
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
                                        List<EventsRecord>
                                            containerEventsRecordList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (containerEventsRecordList
                                                              .length !=
                                                          0) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      25.0,
                                                                      0.0,
                                                                      12.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final events = functions
                                                                        .reverseEventsList(
                                                                            containerEventsRecordList.toList())
                                                                        .toList();
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          events
                                                                              .length,
                                                                          (eventsIndex) {
                                                                        final eventsItem =
                                                                            events[eventsIndex];
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'event_page',
                                                                                queryParameters: {
                                                                                  'events': serializeParam(
                                                                                    eventsItem,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                  'isFrom': serializeParam(
                                                                                    'profile',
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'events': eventsItem,
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                EventCardSmallWidget(
                                                                              key: Key('Keyjvx_${eventsIndex}_of_${events.length}'),
                                                                              event: eventsItem,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).divide(SizedBox(
                                                                          width:
                                                                              10.0)),
                                                                    );
                                                                  },
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          10.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              20.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              20.0)),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      20.0,
                                                                      10.0,
                                                                      20.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Add new event!',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'LTSuperior',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w800,
                                                                                  useGoogleFonts: false,
                                                                                  lineHeight: 1.2,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Add new event to your profile',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'LTSuperior',
                                                                                    color: Color(0xBF1D1D20),
                                                                                    fontSize: 15.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.buttonFixedSizeModel4,
                                                                              updateCallback: () => setState(() {}),
                                                                              child: ButtonFixedSizeWidget(
                                                                                width: 180.0,
                                                                                height: 40.0,
                                                                                buttonColor: FlutterFlowTheme.of(context).primary,
                                                                                text: 'New event',
                                                                                fontsize: 14,
                                                                                textcolor: FlutterFlowTheme.of(context).info,
                                                                                showLoadingIndicator: false,
                                                                                icon: Icon(
                                                                                  Icons.add,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  size: 20.0,
                                                                                ),
                                                                                action: () async {
                                                                                  context.pushNamed('create_event');
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Rectangle_41655.png',
                                                                      width:
                                                                          123.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
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
                                              ),
                                              if (containerEventsRecordList
                                                      .length !=
                                                  0)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.6,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
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
                                                              context.pushNamed(
                                                                  'create_event');
                                                            },
                                                            child: Container(
                                                              height: 45.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kadd1,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).thirdText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Create event',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'LTSuperior',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                            child: Container(
                                                              width: 1.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textAndStroke,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Show all',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'LTSuperior',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: FlutterFlowTheme.of(context)
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
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                  StreamBuilder<List<PostsRecord>>(
                    stream: queryPostsRecord(
                      queryBuilder: (postsRecord) => postsRecord.where(
                        'company',
                        isEqualTo: widget.company?.reference,
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
                                        reverse: true,
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
                                                'Key2j2_${postsIndex}_of_${posts.length}'),
                                            isAuthUser: true,
                                            post: postsItem,
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
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/image_213.png',
                                                  height: 150.0,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .buttonFixedSizeModel5,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: ButtonFixedSizeWidget(
                                                  width: 200.0,
                                                  height: 40.0,
                                                  buttonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  text: 'New post',
                                                  fontsize: 14,
                                                  textcolor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  showLoadingIndicator: false,
                                                  icon: Icon(
                                                    FFIcons.kadd1,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 16.0,
                                                  ),
                                                  action: () async {
                                                    context.pushNamed(
                                                      'addPost',
                                                      queryParameters: {
                                                        'isUpdate':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
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
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ].addToEnd(SizedBox(height: 240.0)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navigationbarModel,
                updateCallback: () => setState(() {}),
                child: NavigationbarWidget(
                  chosen: 'Profile',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
