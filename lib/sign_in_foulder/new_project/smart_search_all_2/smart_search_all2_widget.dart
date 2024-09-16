import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/history_item_widget.dart';
import '/components/navigationbar_widget.dart';
import '/components/short_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/sign_in_foulder/new_project/company_card/company_card_widget.dart';
import '/sign_in_foulder/new_project/event_card/event_card_widget.dart';
import '/sign_in_foulder/new_project/product_card/product_card_widget.dart';
import '/sign_in_foulder/new_project/user_card_new/user_card_new_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'smart_search_all2_model.dart';
export 'smart_search_all2_model.dart';

class SmartSearchAll2Widget extends StatefulWidget {
  const SmartSearchAll2Widget({
    super.key,
    String? chosen,
    this.firstSearch,
    this.smartSearchSession,
  }) : this.chosen = chosen ?? 'Projects';

  final String chosen;
  final String? firstSearch;
  final SmartsearchSessionStruct? smartSearchSession;

  @override
  State<SmartSearchAll2Widget> createState() => _SmartSearchAll2WidgetState();
}

class _SmartSearchAll2WidgetState extends State<SmartSearchAll2Widget>
    with TickerProviderStateMixin {
  late SmartSearchAll2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmartSearchAll2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {}(),
      );
      _model.smartSearchSessions =
          (currentUserDocument?.smartSearchHistory?.toList() ?? [])
              .toList()
              .cast<SmartsearchSessionStruct>();
      safeSetState(() {});
      if (FFAppState().currentSearchSession.title != null &&
          FFAppState().currentSearchSession.title != '') {
        _model.smartsearchSession = FFAppState().currentSearchSession;
        safeSetState(() {});
      }
      await Future.delayed(const Duration(milliseconds: 1000));
      await _model.columnForListView?.animateTo(
        _model.columnForListView!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
      await requestPermission(notificationsPermission);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController1 ??= TextEditingController(text: widget!.firstSearch);
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(() => safeSetState(() {}));
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFAFAFA),
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Opacity(
              opacity: 0.65,
              child: Container(
                width: double.infinity,
                height: 400.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/background.png',
                    ).image,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Builder(
                builder: (context) {
                  if (_model.smartsearchSession == null) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/smart_search.png',
                          ).image,
                        ),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: SingleChildScrollView(
                              primary: false,
                              controller: _model.columnForListView,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Builder(
                                      builder: (context) {
                                        final smartSearchItems = _model
                                                .smartsearchSession
                                                ?.smartsearchItems
                                                ?.toList() ??
                                            [];

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: smartSearchItems.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 40.0),
                                          itemBuilder:
                                              (context, smartSearchItemsIndex) {
                                            final smartSearchItemsItem =
                                                smartSearchItems[
                                                    smartSearchItemsIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  14.0,
                                                                  18.0,
                                                                  14.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          360.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  currentUserPhoto,
                                                                  'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                                                                ),
                                                                width: 50.0,
                                                                height: 50.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    tablet:
                                                                        false,
                                                                  ))
                                                                    Opacity(
                                                                      opacity:
                                                                          0.8,
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Text(
                                                                          '${currentUserDisplayName} · ${dateTimeFormat("yMMMd", smartSearchItemsItem.when)} ${dateTimeFormat("Hm", smartSearchItemsItem.when)}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'LTSuperior',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            1.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      smartSearchItemsItem
                                                                          .queryStr,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'LTSuperior',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.25,
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
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 31.0,
                                                          20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.short_text,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          'Smart Search Response',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'LTSuperior',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (smartSearchItemsItem.isDone)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: ShortListWidget(
                                                      key: Key(
                                                          'Keyu56_${smartSearchItemsIndex}_of_${smartSearchItems.length}'),
                                                      searchItems:
                                                          smartSearchItemsItem
                                                              .searchResults,
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 15.0,
                                                          20.0, 0.0),
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
                                                      _model
                                                          .updateSmartsearchSessionStruct(
                                                        (e) => e
                                                          ..updateSmartsearchItems(
                                                            (e) => e[_model
                                                                    .smartsearchSession!
                                                                    .smartsearchItems
                                                                    .length -
                                                                1]
                                                              ..planOpen = _model
                                                                      .smartsearchSession!
                                                                      .smartsearchItems
                                                                      .last
                                                                      .planOpen
                                                                  ? false
                                                                  : true,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 510),
                                                      curve: Curves.easeInOut,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textAndStroke,
                                                        ),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (smartSearchItemsItem
                                                              .planOpen) {
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              18.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Icon(
                                                                            FFIcons.keventsW,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                21.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Plan',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'LTSuperior',
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                2.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_up_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 28.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if ((_model.smartsearchSession?.smartsearchItems?.last?.plan !=
                                                                            null &&
                                                                        (_model.smartsearchSession?.smartsearchItems?.last?.plan)!
                                                                            .isNotEmpty) ==
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            20.0,
                                                                            20.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final planItemsList = smartSearchItemsItem
                                                                            .plan
                                                                            .toList();

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              planItemsList.length,
                                                                              (planItemsListIndex) {
                                                                            final planItemsListItem =
                                                                                planItemsList[planItemsListIndex];
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 3.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          if (!planItemsListItem.isDone) {
                                                                                            return Lottie.asset(
                                                                                              'assets/lottie_animations/Animation_-_1725615403539.json',
                                                                                              width: 45.0,
                                                                                              height: 45.0,
                                                                                              fit: BoxFit.cover,
                                                                                              animate: true,
                                                                                            );
                                                                                          } else {
                                                                                            return Icon(
                                                                                              Icons.done_all,
                                                                                              color: Color(0xBC0300FF),
                                                                                              size: 28.0,
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    if (planItemsListIndex != (_model.planItems.length - 1))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                        child: Container(
                                                                                          width: 1.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            gradient: LinearGradient(
                                                                                              colors: [
                                                                                                Color(0x001D1D20),
                                                                                                Color(0x4EC6C6D5),
                                                                                                Color(0x001D1D20)
                                                                                              ],
                                                                                              stops: [0.0, 0.5, 1.0],
                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                            ),
                                                                                          ),
                                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 20.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          planItemsListItem.title,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'LTSuperior',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Opacity(
                                                                                          opacity: 0.7,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              planItemsListItem.description,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                              ],
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          18.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        FFIcons
                                                                            .keventsW,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            21.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Plan',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'LTSuperior',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${smartSearchItemsItem.plan.length.toString()} items',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'LTSuperior',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              28.0,
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
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 30.0),
                                                  child: custom_widgets
                                                      .CustomMarkdown(
                                                    width: double.infinity,
                                                    height: 300.0,
                                                    text: smartSearchItemsItem
                                                        .text,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final searchResult =
                                                          smartSearchItemsItem
                                                              .searchResults
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            searchResult.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 4.0),
                                                        itemBuilder: (context,
                                                            searchResultIndex) {
                                                          final searchResultItem =
                                                              searchResult[
                                                                  searchResultIndex];
                                                          return Builder(
                                                            builder: (context) {
                                                              if (searchResultItem
                                                                      .type ==
                                                                  'event') {
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            EventsRecord>>(
                                                                      stream:
                                                                          queryEventsRecord(
                                                                        queryBuilder:
                                                                            (eventsRecord) =>
                                                                                eventsRecord.where(
                                                                          'custom_id',
                                                                          isEqualTo:
                                                                              searchResultItem.firebaseId,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 1.0,
                                                                              height: 1.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  Color(0x00007AFF),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<EventsRecord>
                                                                            eventCardEventsRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final eventCardEventsRecord = eventCardEventsRecordList.isNotEmpty
                                                                            ? eventCardEventsRecordList.first
                                                                            : null;

                                                                        return EventCardWidget(
                                                                          key: Key(
                                                                              'Keyhm4_${searchResultIndex}_of_${searchResult.length}'),
                                                                          eventDoc:
                                                                              eventCardEventsRecord!,
                                                                          explanation:
                                                                              searchResultItem.explanation,
                                                                          isFrom:
                                                                              'smartsearch',
                                                                          percent:
                                                                              searchResultItem.percent,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              } else if (searchResultItem
                                                                      .type ==
                                                                  'company') {
                                                                return FutureBuilder<
                                                                    List<
                                                                        ProjectsRecord>>(
                                                                  future:
                                                                      queryProjectsRecordOnce(
                                                                    queryBuilder:
                                                                        (projectsRecord) =>
                                                                            projectsRecord.where(
                                                                      'custom_id',
                                                                      isEqualTo: searchResultItem.firebaseId !=
                                                                              ''
                                                                          ? searchResultItem
                                                                              .firebaseId
                                                                          : null,
                                                                      isNull: (searchResultItem.firebaseId != ''
                                                                              ? searchResultItem.firebaseId
                                                                              : null) ==
                                                                          null,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              1.0,
                                                                          height:
                                                                              1.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x04007AFF),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ProjectsRecord>
                                                                        companyCardProjectsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    // Return an empty Container when the item does not exist.
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final companyCardProjectsRecord = companyCardProjectsRecordList
                                                                            .isNotEmpty
                                                                        ? companyCardProjectsRecordList
                                                                            .first
                                                                        : null;

                                                                    return CompanyCardWidget(
                                                                      key: Key(
                                                                          'Keymyi_${searchResultIndex}_of_${searchResult.length}'),
                                                                      percent: searchResultItem
                                                                          .percent
                                                                          .toString(),
                                                                      expanation:
                                                                          searchResultItem
                                                                              .explanation,
                                                                      company:
                                                                          companyCardProjectsRecord!,
                                                                    );
                                                                  },
                                                                );
                                                              } else if (searchResultItem
                                                                      .type ==
                                                                  'people') {
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    FutureBuilder<
                                                                        List<
                                                                            UsersRecord>>(
                                                                      future:
                                                                          queryUsersRecordOnce(
                                                                        queryBuilder:
                                                                            (usersRecord) =>
                                                                                usersRecord.where(
                                                                          'uid',
                                                                          isEqualTo:
                                                                              searchResultItem.firebaseId,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 1.0,
                                                                              height: 1.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  Color(0x00007AFF),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<UsersRecord>
                                                                            userCardNewUsersRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final userCardNewUsersRecord = userCardNewUsersRecordList.isNotEmpty
                                                                            ? userCardNewUsersRecordList.first
                                                                            : null;

                                                                        return UserCardNewWidget(
                                                                          key: Key(
                                                                              'Keyn0f_${searchResultIndex}_of_${searchResult.length}'),
                                                                          user:
                                                                              userCardNewUsersRecord!,
                                                                          explanation:
                                                                              searchResultItem.explanation,
                                                                          percent:
                                                                              searchResultItem.percent,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              } else {
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    FutureBuilder<
                                                                        List<
                                                                            ProductsRecord>>(
                                                                      future:
                                                                          queryProductsRecordOnce(
                                                                        queryBuilder:
                                                                            (productsRecord) =>
                                                                                productsRecord.where(
                                                                          'custom_id',
                                                                          isEqualTo: searchResultItem.firebaseId != ''
                                                                              ? searchResultItem.firebaseId
                                                                              : null,
                                                                          isNull:
                                                                              (searchResultItem.firebaseId != '' ? searchResultItem.firebaseId : null) == null,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 1.0,
                                                                              height: 1.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  Color(0x00007AFF),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<ProductsRecord>
                                                                            productCardProductsRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final productCardProductsRecord = productCardProductsRecordList.isNotEmpty
                                                                            ? productCardProductsRecordList.first
                                                                            : null;

                                                                        return ProductCardWidget(
                                                                          key: Key(
                                                                              'Keyfm9_${searchResultIndex}_of_${searchResult.length}'),
                                                                          explanation:
                                                                              searchResultItem.explanation,
                                                                          isFrom:
                                                                              'main',
                                                                          product:
                                                                              productCardProductsRecord!,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              }
                                                            },
                                                          );
                                                        },
                                                        controller: _model
                                                            .listViewController,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                if (false)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    31.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.short_text,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 30.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                'Related',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
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
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            );
                                          },
                                          controller:
                                              _model.listViewSmartSearch,
                                        );
                                      },
                                    ),
                                  ),
                                ].addToStart(SizedBox(height: 130.0)).addToEnd(
                                    SizedBox(
                                        height:
                                            _model.toScroll ? 1000.0 : 300.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (!(_model.images.isNotEmpty)) {
                          return Visibility(
                            visible: (_model.message == null ||
                                    _model.message == '') &&
                                (_model.smartsearchSession == null),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Builder(
                                builder: (context) {
                                  final suggestion =
                                      _model.suggestions.toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _model.rowController1,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(suggestion.length,
                                              (suggestionIndex) {
                                        final suggestionItem =
                                            suggestion[suggestionIndex];
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            safeSetState(() {
                                              _model.textController1?.text =
                                                  suggestionItem;
                                              _model.textController1
                                                      ?.selection =
                                                  TextSelection.collapsed(
                                                      offset: _model
                                                          .textController1!
                                                          .text
                                                          .length);
                                            });
                                            _model.message = suggestionItem;
                                            safeSetState(() {});
                                          },
                                          text: suggestionItem,
                                          options: FFButtonOptions(
                                            height: 42.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textAndStroke,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        );
                                      })
                                          .divide(SizedBox(width: 8.0))
                                          .addToStart(SizedBox(width: 20.0))
                                          .addToEnd(SizedBox(width: 20.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return Visibility(
                            visible: _model.images.isNotEmpty,
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Builder(
                                  builder: (context) {
                                    final media3 = _model.images.toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _model.rowController2,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(media3.length,
                                                (media3Index) {
                                          final media3Item =
                                              media3[media3Index];
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Container(
                                              width: 97.0,
                                              height: 87.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 1.0),
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      media3Item,
                                                      width: 90.0,
                                                      height: 80.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 30.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color: Colors.white,
                                                        size: 15.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.removeFromImages(
                                                            media3Item);
                                                        safeSetState(() {});
                                                        await FirebaseStorage
                                                            .instance
                                                            .refFromURL(
                                                                media3Item)
                                                            .delete();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                            .addToStart(SizedBox(width: 10.0))
                                            .addToEnd(SizedBox(width: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            (isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible)
                                ? 0.0
                                : 20.0,
                            0.0,
                          ),
                          0.0,
                          valueOrDefault<double>(
                            (isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible)
                                ? 0.0
                                : 20.0,
                            0.0,
                          ),
                          valueOrDefault<double>(
                            (isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible)
                                ? 0.0
                                : 95.0,
                            0.0,
                          )),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 15.0,
                            sigmaY: 15.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xE3F6F6F6),
                              borderRadius:
                                  BorderRadius.circular(valueOrDefault<double>(
                                (isWeb
                                        ? MediaQuery.viewInsetsOf(context)
                                                .bottom >
                                            0
                                        : _isKeyboardVisible)
                                    ? 0.0
                                    : 15.0,
                                0.0,
                              )),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  8.0,
                                  0.0,
                                  valueOrDefault<double>(
                                    isiOS && isWeb ? 20.0 : 8.0,
                                    0.0,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 45.0,
                                        icon: Icon(
                                          FFIcons.kteenyiconsAttachSolid,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMedia(
                                            imageQuality: 100,
                                            mediaSource:
                                                MediaSource.photoGallery,
                                            multiImage: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
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

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFiles =
                                                    selectedUploadedFiles;
                                                _model.uploadedFileUrls =
                                                    downloadUrls;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          _model.images = functions
                                              .imagesList(
                                                  _model.uploadedFileUrls
                                                      .toList(),
                                                  _model.images.toList())
                                              .toList()
                                              .cast<String>();
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController1',
                                          Duration(milliseconds: 10),
                                          () async {
                                            _model.message =
                                                _model.textController1.text;
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                          hintText: 'Ask Smart Search..',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    color: Color(0x7F1D1D20),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                        maxLines: 5,
                                        minLines: 1,
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.textController1.text != null &&
                                          _model.textController1.text != '') {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 6.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 45.0,
                                            icon: Icon(
                                              Icons.send_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              unawaited(
                                                () async {
                                                  await actions.hideKeyboard();
                                                }(),
                                              );
                                              _model.toScroll = true;
                                              safeSetState(() {});
                                              if ((_model
                                                      .messages.isNotEmpty) ==
                                                  true) {
                                                _model.messages = functions
                                                    .createMessagesForAI(
                                                        functions.stringToAPI(
                                                            FFAppConstants
                                                                .smartsearchPrompt)!,
                                                        _model.messages
                                                            .toList(),
                                                        'user',
                                                        _model.lastQuery!,
                                                        null,
                                                        _model.images.toList(),
                                                        true)
                                                    .toList()
                                                    .cast<dynamic>();
                                                safeSetState(() {});
                                              }
                                              safeSetState(() {
                                                _model.textController1?.text =
                                                    '';
                                                _model.textController1
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                        offset: _model
                                                            .textController1!
                                                            .text
                                                            .length);
                                              });
                                              _model.sessionIsFinished = false;
                                              safeSetState(() {});
                                              _model
                                                  .updateSmartsearchSessionStruct(
                                                (e) => e
                                                  ..updateSmartsearchItems(
                                                    (e) =>
                                                        e.add(SmartSearchStruct(
                                                      when: getCurrentTimestamp,
                                                      queryStr: _model.message,
                                                      isDone: false,
                                                      planOpen: true,
                                                    )),
                                                  )
                                                  ..id = _model.smartsearchSession
                                                                  ?.id !=
                                                              null &&
                                                          _model.smartsearchSession
                                                                  ?.id !=
                                                              ''
                                                      ? _model
                                                          .smartsearchSession
                                                          ?.id
                                                      : random_data
                                                          .randomString(
                                                          10,
                                                          12,
                                                          true,
                                                          false,
                                                          true,
                                                        )
                                                  ..title = _model.smartsearchSession
                                                                  ?.title !=
                                                              null &&
                                                          _model.smartsearchSession
                                                                  ?.title !=
                                                              ''
                                                      ? _model
                                                          .smartsearchSession
                                                          ?.title
                                                      : 'New search',
                                              );
                                              _model.lastQuery = _model.message;
                                              safeSetState(() {});
                                              if (_model.smartsearchSession!
                                                      .smartsearchItems.length >
                                                  1) {
                                                unawaited(
                                                  () async {
                                                    await _model
                                                        .columnForListView
                                                        ?.animateTo(
                                                      _model
                                                          .columnForListView!
                                                          .position
                                                          .maxScrollExtent,
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
                                                    );
                                                  }(),
                                                );
                                              } else {
                                                unawaited(
                                                  () async {
                                                    await _model
                                                        .columnForListView
                                                        ?.animateTo(
                                                      _model
                                                          .columnForListView!
                                                          .position
                                                          .maxScrollExtent,
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
                                                    );
                                                  }(),
                                                );
                                              }

                                              _model.planMessages = functions
                                                  .createMessagesForAI(
                                                      functions.stringToAPI(
                                                          FFAppConstants
                                                              .planPrompt)!,
                                                      _model.planMessages
                                                          .toList(),
                                                      'user',
                                                      functions.stringToAPI(
                                                          'user\'s message: ${_model.message}, information about user: name: ${currentUserDisplayName}, description: ${valueOrDefault(currentUserDocument?.description, '')}, proffesional information: ${valueOrDefault(currentUserDocument?.professionalInformation, '')}, sections: ${functions.jsonListToText((currentUserDocument?.sections?.toList() ?? []).map((e) => e.toMap()).toList(), null)}  \\n \\n user\'s message: ${_model.message}')!,
                                                      null,
                                                      _model.images.toList(),
                                                      false)
                                                  .toList()
                                                  .cast<dynamic>();
                                              safeSetState(() {});
                                              _model.plan =
                                                  await OpenAIGptBigCall.call(
                                                messagesJson:
                                                    _model.planMessages,
                                              );
                                              if (_model.plan?.succeeded ??
                                                  true) {
                                                _model.plan?.streamedResponse
                                                    ?.stream
                                                    .transform(utf8.decoder)
                                                    .transform(
                                                        const LineSplitter())
                                                    .transform(
                                                        ServerSentEventLineTransformer())
                                                    .map((m) =>
                                                        ResponseStreamMessage(
                                                            message: m))
                                                    .listen(
                                                  (onMessageInput) async {
                                                    _model.planPartialJson =
                                                        '${_model.planPartialJson}${getJsonField(
                                                      onMessageInput
                                                          .serverSentEvent
                                                          .jsonData,
                                                      r'''$['choices'][0]['delta']['content']''',
                                                    ).toString()}';
                                                    safeSetState(() {});
                                                    _model.planItemJson = functions
                                                        .processPlanjson(_model
                                                            .planPartialJson)
                                                        .toList()
                                                        .cast<dynamic>();
                                                    safeSetState(() {});
                                                    _model.planItems = _model
                                                        .planItemJson
                                                        .map((e) =>
                                                            PlanItemStruct
                                                                .maybeFromMap(
                                                                    e))
                                                        .withoutNulls
                                                        .toList()
                                                        .cast<PlanItemStruct>();
                                                    _model
                                                        .updateSmartsearchSessionStruct(
                                                      (e) => e
                                                        ..updateSmartsearchItems(
                                                          (e) => e[_model
                                                                  .smartsearchSession!
                                                                  .smartsearchItems
                                                                  .length -
                                                              1]
                                                            ..plan = _model
                                                                .planItems
                                                                .toList(),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                  onError:
                                                      (onErrorInput) async {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          onErrorInput!,
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds:
                                                                14000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  },
                                                  onDone: () async {
                                                    _model.toScroll = false;
                                                    safeSetState(() {});
                                                    await Future.wait([
                                                      Future(() async {
                                                        _model.retrieveVectors1Copy =
                                                            await SingleSmartSearchCall
                                                                .call(
                                                          text: functions
                                                              .stringToAPI(
                                                                  _model
                                                                      .message),
                                                          userInfo: functions
                                                              .stringToAPI(
                                                                  'description: ${valueOrDefault(currentUserDocument?.description, '')}, professional info: ${valueOrDefault(currentUserDocument?.professionalInformation, '')}, additional info: ${functions.jsonListToText((currentUserDocument?.sections?.toList() ?? []).map((e) => e.toMap()).toList(), null)}'),
                                                          currentTime:
                                                              getCurrentTimestamp
                                                                  .toString(),
                                                          images: functions
                                                              .stringToAPI(functions
                                                                  .imagesListToStr(
                                                                      _model
                                                                          .images
                                                                          .toList())),
                                                          messages: functions
                                                              .stringToAPI(functions
                                                                  .jsonListToText(
                                                                      _model
                                                                          .messages
                                                                          .toList(),
                                                                      null)),
                                                          promptsPlan: functions.stringToAPI(
                                                              functions.jsonListToText(
                                                                  _model
                                                                      .smartsearchSession
                                                                      ?.smartsearchItems
                                                                      ?.last
                                                                      ?.plan
                                                                      ?.map((e) =>
                                                                          e.toMap())
                                                                      .toList()
                                                                      ?.toList(),
                                                                  null)),
                                                          currentPrompt: functions
                                                              .stringToAPI(
                                                                  '${_model.planItems[0].title}, ${_model.planItems[0].description}'),
                                                        );

                                                        _model
                                                            .updatePlanItemsAtIndex(
                                                          0,
                                                          (e) =>
                                                              e..isDone = true,
                                                        );
                                                        safeSetState(() {});
                                                        _model.infoForSearch =
                                                            '${_model.infoForSearch}  results of plan item \"${_model.planItems[0].title}\": ${(_model.retrieveVectors1Copy?.bodyText ?? '')}';
                                                        safeSetState(() {});
                                                        _model
                                                            .updateSmartsearchSessionStruct(
                                                          (e) => e
                                                            ..updateSmartsearchItems(
                                                              (e) => e[_model
                                                                      .smartsearchSession!
                                                                      .smartsearchItems
                                                                      .length -
                                                                  1]
                                                                ..plan = _model
                                                                    .planItems
                                                                    .toList(),
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      }),
                                                      Future(() async {
                                                        if (_model.planItems
                                                                .length >=
                                                            2) {
                                                          _model.retrieveVectors2Copy =
                                                              await SingleSmartSearchCall
                                                                  .call(
                                                            text: functions
                                                                .stringToAPI(
                                                                    _model
                                                                        .message),
                                                            userInfo: functions
                                                                .stringToAPI(
                                                                    'description: ${valueOrDefault(currentUserDocument?.description, '')}, professional info: ${valueOrDefault(currentUserDocument?.professionalInformation, '')}, additional info: ${functions.jsonListToText((currentUserDocument?.sections?.toList() ?? []).map((e) => e.toMap()).toList(), null)}'),
                                                            currentTime:
                                                                getCurrentTimestamp
                                                                    .toString(),
                                                            images: functions
                                                                .stringToAPI(functions
                                                                    .imagesListToStr(_model
                                                                        .images
                                                                        .toList())),
                                                            messages: functions
                                                                .stringToAPI(functions
                                                                    .jsonListToText(
                                                                        _model
                                                                            .messages
                                                                            .toList(),
                                                                        null)),
                                                            promptsPlan: functions.stringToAPI(functions.jsonListToText(
                                                                _model
                                                                    .smartsearchSession
                                                                    ?.smartsearchItems
                                                                    ?.last
                                                                    ?.plan
                                                                    ?.map((e) =>
                                                                        e.toMap())
                                                                    .toList()
                                                                    ?.toList(),
                                                                null)),
                                                            currentPrompt: functions
                                                                .stringToAPI(
                                                                    '${_model.planItems[1].title}, ${_model.planItems[1].description}'),
                                                          );

                                                          _model
                                                              .updatePlanItemsAtIndex(
                                                            1,
                                                            (e) => e
                                                              ..isDone = true,
                                                          );
                                                          safeSetState(() {});
                                                          _model.infoForSearch =
                                                              '${_model.infoForSearch}  results of plan item ${_model.planItems[1].title}: ${(_model.retrieveVectors2Copy?.bodyText ?? '')}';
                                                          safeSetState(() {});
                                                          _model
                                                              .updateSmartsearchSessionStruct(
                                                            (e) => e
                                                              ..updateSmartsearchItems(
                                                                (e) => e[_model
                                                                        .smartsearchSession!
                                                                        .smartsearchItems
                                                                        .length -
                                                                    1]
                                                                  ..plan = _model
                                                                      .planItems
                                                                      .toList(),
                                                              ),
                                                          );
                                                          safeSetState(() {});
                                                        }
                                                      }),
                                                      Future(() async {
                                                        if (_model.planItems
                                                                .length >=
                                                            3) {
                                                          _model.retrieveVectors3Copy =
                                                              await SingleSmartSearchCall
                                                                  .call(
                                                            text: functions
                                                                .stringToAPI(
                                                                    _model
                                                                        .message),
                                                            userInfo: functions
                                                                .stringToAPI(
                                                                    'description: ${valueOrDefault(currentUserDocument?.description, '')}, professional info: ${valueOrDefault(currentUserDocument?.professionalInformation, '')}, additional info: ${functions.jsonListToText((currentUserDocument?.sections?.toList() ?? []).map((e) => e.toMap()).toList(), null)}'),
                                                            currentTime:
                                                                getCurrentTimestamp
                                                                    .toString(),
                                                            images: functions
                                                                .imagesListToStr(
                                                                    _model
                                                                        .images
                                                                        .toList()),
                                                            messages: functions
                                                                .stringToAPI(functions
                                                                    .jsonListToText(
                                                                        _model
                                                                            .messages
                                                                            .toList(),
                                                                        null)),
                                                            promptsPlan: functions.stringToAPI(functions.jsonListToText(
                                                                _model
                                                                    .smartsearchSession
                                                                    ?.smartsearchItems
                                                                    ?.last
                                                                    ?.plan
                                                                    ?.map((e) =>
                                                                        e.toMap())
                                                                    .toList()
                                                                    ?.toList(),
                                                                null)),
                                                            currentPrompt: functions
                                                                .stringToAPI(
                                                                    '${_model.planItems[2].title}, ${_model.planItems[2].description}'),
                                                          );

                                                          _model
                                                              .updatePlanItemsAtIndex(
                                                            2,
                                                            (e) => e
                                                              ..isDone = true,
                                                          );
                                                          safeSetState(() {});
                                                          _model.infoForSearch =
                                                              '${_model.infoForSearch}  results of plan item ${_model.planItems[2].title}: ${(_model.retrieveVectors3Copy?.bodyText ?? '')}';
                                                          safeSetState(() {});
                                                          _model
                                                              .updateSmartsearchSessionStruct(
                                                            (e) => e
                                                              ..updateSmartsearchItems(
                                                                (e) => e[_model
                                                                        .smartsearchSession!
                                                                        .smartsearchItems
                                                                        .length -
                                                                    1]
                                                                  ..plan = _model
                                                                      .planItems
                                                                      .toList(),
                                                              ),
                                                          );
                                                          safeSetState(() {});
                                                        }
                                                      }),
                                                      Future(() async {
                                                        if (_model.planItems
                                                                .length >=
                                                            4) {
                                                          _model.retrieveVectors4Copy =
                                                              await SingleSmartSearchCall
                                                                  .call(
                                                            text: functions
                                                                .stringToAPI(
                                                                    _model
                                                                        .message),
                                                            userInfo: functions
                                                                .stringToAPI(
                                                                    'description: ${valueOrDefault(currentUserDocument?.description, '')}, professional info: ${valueOrDefault(currentUserDocument?.professionalInformation, '')}, additional info: ${functions.jsonListToText((currentUserDocument?.sections?.toList() ?? []).map((e) => e.toMap()).toList(), null)}'),
                                                            currentTime:
                                                                getCurrentTimestamp
                                                                    .toString(),
                                                            images: functions
                                                                .stringToAPI(functions
                                                                    .imagesListToStr(_model
                                                                        .images
                                                                        .toList())),
                                                            messages: functions
                                                                .stringToAPI(functions
                                                                    .jsonListToText(
                                                                        _model
                                                                            .messages
                                                                            .toList(),
                                                                        null)),
                                                            promptsPlan: functions.stringToAPI(functions.jsonListToText(
                                                                _model
                                                                    .smartsearchSession
                                                                    ?.smartsearchItems
                                                                    ?.last
                                                                    ?.plan
                                                                    ?.map((e) =>
                                                                        e.toMap())
                                                                    .toList()
                                                                    ?.toList(),
                                                                null)),
                                                            currentPrompt: functions
                                                                .stringToAPI(
                                                                    '${_model.planItems[3].title}, ${_model.planItems[3].description}'),
                                                          );

                                                          _model
                                                              .updatePlanItemsAtIndex(
                                                            3,
                                                            (e) => e
                                                              ..isDone = true,
                                                          );
                                                          safeSetState(() {});
                                                          _model.infoForSearch =
                                                              '${_model.infoForSearch}  results of plan item ${_model.planItems[2].title}: ${(_model.retrieveVectors4Copy?.bodyText ?? '')}';
                                                          safeSetState(() {});
                                                          _model
                                                              .updateSmartsearchSessionStruct(
                                                            (e) => e
                                                              ..updateSmartsearchItems(
                                                                (e) => e[_model
                                                                        .smartsearchSession!
                                                                        .smartsearchItems
                                                                        .length -
                                                                    1]
                                                                  ..plan = _model
                                                                      .planItems
                                                                      .toList(),
                                                              ),
                                                          );
                                                          safeSetState(() {});
                                                        }
                                                      }),
                                                      Future(() async {
                                                        if (_model.planItems
                                                                .length >=
                                                            5) {
                                                          _model.retrieveVectors5Copy =
                                                              await SingleSmartSearchCall
                                                                  .call(
                                                            text: functions
                                                                .stringToAPI(
                                                                    _model
                                                                        .message),
                                                            userInfo: functions
                                                                .stringToAPI(
                                                                    'description: ${valueOrDefault(currentUserDocument?.description, '')}, professional info: ${valueOrDefault(currentUserDocument?.professionalInformation, '')}, additional info: ${functions.jsonListToText((currentUserDocument?.sections?.toList() ?? []).map((e) => e.toMap()).toList(), null)}'),
                                                            currentTime:
                                                                getCurrentTimestamp
                                                                    .toString(),
                                                            images: functions
                                                                .stringToAPI(functions
                                                                    .imagesListToStr(_model
                                                                        .images
                                                                        .toList())),
                                                            messages: functions
                                                                .stringToAPI(functions
                                                                    .jsonListToText(
                                                                        _model
                                                                            .messages
                                                                            .toList(),
                                                                        null)),
                                                            promptsPlan: functions.stringToAPI(functions.jsonListToText(
                                                                _model
                                                                    .smartsearchSession
                                                                    ?.smartsearchItems
                                                                    ?.last
                                                                    ?.plan
                                                                    ?.map((e) =>
                                                                        e.toMap())
                                                                    .toList()
                                                                    ?.toList(),
                                                                null)),
                                                            currentPrompt: functions
                                                                .stringToAPI(
                                                                    '${_model.planItems[4].title}, ${_model.planItems[4].description}'),
                                                          );

                                                          _model
                                                              .updatePlanItemsAtIndex(
                                                            4,
                                                            (e) => e
                                                              ..isDone = true,
                                                          );
                                                          safeSetState(() {});
                                                          _model.infoForSearch =
                                                              '${_model.infoForSearch}  results of plan item ${_model.planItems[4].title}: ${(_model.retrieveVectors5Copy?.bodyText ?? '')}';
                                                          safeSetState(() {});
                                                          _model
                                                              .updateSmartsearchSessionStruct(
                                                            (e) => e
                                                              ..updateSmartsearchItems(
                                                                (e) => e[_model
                                                                        .smartsearchSession!
                                                                        .smartsearchItems
                                                                        .length -
                                                                    1]
                                                                  ..plan = _model
                                                                      .planItems
                                                                      .toList(),
                                                              ),
                                                          );
                                                          safeSetState(() {});
                                                        }
                                                      }),
                                                      Future(() async {
                                                        if (_model
                                                                .smartsearchSession
                                                                ?.title ==
                                                            'New search') {
                                                          _model.name =
                                                              await CreateNameForUsersQueryCall
                                                                  .call(
                                                            question: functions
                                                                .stringToAPI(
                                                                    _model
                                                                        .message),
                                                          );

                                                          _model
                                                              .updateSmartsearchSessionStruct(
                                                            (e) => e
                                                              ..title =
                                                                  getJsonField(
                                                                (_model.name
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.text''',
                                                              ).toString(),
                                                          );
                                                          safeSetState(() {});
                                                        }
                                                      }),
                                                    ]);
                                                    _model.messages = functions
                                                        .createMessagesForAI(
                                                            functions.stringToAPI(
                                                                FFAppConstants
                                                                    .smartsearchPrompt)!,
                                                            _model.messages
                                                                .toList(),
                                                            'user',
                                                            functions.stringToAPI(
                                                                'user\'s message: ${_model.message}\\n pieces of information:  products, events, people and companies: ${_model.infoForSearch}, information about user: name: ${currentUserDisplayName}, description: ${valueOrDefault(currentUserDocument?.description, '')}, proffesional information: ${valueOrDefault(currentUserDocument?.professionalInformation, '')}, sections: ${functions.jsonListToText((currentUserDocument?.sections?.toList() ?? []).map((e) => e.toMap()).toList(), null)}  \\n \\n current user id:${currentUserUid}  \\n \\n user\'s message: ${_model.message}')!,
                                                            null,
                                                            _model.images
                                                                .toList(),
                                                            false)
                                                        .toList()
                                                        .cast<dynamic>();
                                                    _model
                                                        .updateSmartsearchSessionStruct(
                                                      (e) => e
                                                        ..updateSmartsearchItems(
                                                          (e) => e[_model
                                                                  .smartsearchSession!
                                                                  .smartsearchItems
                                                                  .length -
                                                              1]
                                                            ..planOpen = false
                                                            ..plan = _model
                                                                .planItems
                                                                .toList(),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                    _model.alternativeCopyCopy2 =
                                                        await OpenAIGptBigCall
                                                            .call(
                                                      messagesJson:
                                                          _model.messages,
                                                    );
                                                    if (_model
                                                            .alternativeCopyCopy2
                                                            ?.succeeded ??
                                                        true) {
                                                      _model
                                                          .alternativeCopyCopy2
                                                          ?.streamedResponse
                                                          ?.stream
                                                          .transform(
                                                              utf8.decoder)
                                                          .transform(
                                                              const LineSplitter())
                                                          .transform(
                                                              ServerSentEventLineTransformer())
                                                          .map((m) =>
                                                              ResponseStreamMessage(
                                                                  message: m))
                                                          .listen(
                                                            (onMessageInput) async {
                                                              _model.partialJson =
                                                                  '${_model.partialJson}${getJsonField(
                                                                onMessageInput
                                                                    .serverSentEvent
                                                                    .jsonData,
                                                                r'''$["choices"][0]["delta"]["content"]''',
                                                              ).toString()}';
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .updateSmartsearchSessionStruct(
                                                                (e) => e
                                                                  ..updateSmartsearchItems(
                                                                    (e) => e[_model
                                                                            .smartsearchSession!
                                                                            .smartsearchItems
                                                                            .length -
                                                                        1] = SmartSearchStruct.maybeFromMap(functions.processPartialJson(_model.partialJson!))!,
                                                                  ),
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .updateSmartsearchSessionStruct(
                                                                (e) => e
                                                                  ..updateSmartsearchItems(
                                                                    (e) => e[_model
                                                                            .smartsearchSession!
                                                                            .smartsearchItems
                                                                            .length -
                                                                        1]
                                                                      ..when =
                                                                          getCurrentTimestamp
                                                                      ..queryStr =
                                                                          _model
                                                                              .lastQuery
                                                                      ..plan = _model
                                                                          .planItems
                                                                          .toList(),
                                                                  ),
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            onError:
                                                                (onErrorInput) async {},
                                                            onDone: () async {
                                                              _model.messages = functions
                                                                  .createMessagesForAI(
                                                                      functions.stringToAPI(
                                                                          FFAppConstants
                                                                              .smartsearchPrompt)!,
                                                                      _model
                                                                          .messages
                                                                          .toList(),
                                                                      'assistant',
                                                                      _model
                                                                          .partialJson!,
                                                                      null,
                                                                      _model
                                                                          .images
                                                                          .toList(),
                                                                      false)
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .updateSmartsearchSessionStruct(
                                                                (e) => e
                                                                  ..updateSmartsearchItems(
                                                                    (e) => e[_model
                                                                            .smartsearchSession!
                                                                            .smartsearchItems
                                                                            .length -
                                                                        1]
                                                                      ..isDone =
                                                                          true
                                                                      ..plan = _model
                                                                          .planItems
                                                                          .toList(),
                                                                  ),
                                                              );
                                                              _model.partialJson =
                                                                  null;
                                                              _model.message =
                                                                  null;
                                                              _model.images =
                                                                  [];
                                                              _model.retrieveVectorsPageState =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .currentSearchSession =
                                                                  _model
                                                                      .smartsearchSession!;
                                                              safeSetState(
                                                                  () {});
                                                              _model.smartSearchSessions =
                                                                  (currentUserDocument
                                                                              ?.smartSearchHistory
                                                                              ?.toList() ??
                                                                          [])
                                                                      .toList()
                                                                      .cast<
                                                                          SmartsearchSessionStruct>();
                                                              safeSetState(
                                                                  () {});
                                                              _model.planItems =
                                                                  [];
                                                              _model.planPartialJson =
                                                                  null;
                                                              _model.planItemJson =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                              if (_model
                                                                      .smartSearchSessions
                                                                      .where((e) =>
                                                                          _model
                                                                              .smartsearchSession
                                                                              ?.id ==
                                                                          e.id)
                                                                      .toList()
                                                                      .length >
                                                                  0) {
                                                                _model
                                                                    .updateSmartSearchSessionsAtIndex(
                                                                  functions.jsonIndexFromListJson(
                                                                      _model
                                                                          .smartsearchSession!
                                                                          .id,
                                                                      _model
                                                                          .smartSearchSessions
                                                                          .map((e) =>
                                                                              e.toMap())
                                                                          .toList()),
                                                                  (_) => _model
                                                                      .smartsearchSession!,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.addToSmartSearchSessions(
                                                                    _model
                                                                        .smartsearchSession!);
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              unawaited(
                                                                () async {
                                                                  await currentUserReference!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'smartSearchHistory':
                                                                            getSmartsearchSessionListFirestoreData(
                                                                          _model
                                                                              .smartSearchSessions,
                                                                        ),
                                                                      },
                                                                    ),
                                                                  });
                                                                }(),
                                                              );
                                                            },
                                                          );
                                                    }
                                                  },
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                          ),
                                        );
                                      } else {
                                        return Builder(
                                          builder: (context) {
                                            if (_model.voiceIsOn) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 6.0, 0.0),
                                                child: Container(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: custom_widgets
                                                      .SpeechToTextBoxV2(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    apiKey:
                                                        'sk-proj-i68UsWfSo57Ee7ezotmdT3BlbkFJwWZ0JJvXIRODlJi4wg61',
                                                    recordingIcon: Icon(
                                                      Icons.graphic_eq_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    setTextField: () async {
                                                      safeSetState(() {
                                                        _model.textController1
                                                                ?.text =
                                                            FFAppState()
                                                                .whisperResult;
                                                        _model.textController1
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .textController1!
                                                                    .text
                                                                    .length);
                                                      });
                                                      _model.voiceIsOn = false;
                                                      _model.message =
                                                          FFAppState()
                                                              .whisperResult;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onLongPress: () async {
                                                    _model.voiceIsOn = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.graphic_eq_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await requestPermission(
                                                          microphonePermission);
                                                      _model.voiceIsOn = true;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              );
                                            }
                                          },
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
                  ),
                ],
              ),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navigationbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavigationbarWidget(
                    chosen: 'Smart Search',
                  ),
                ),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xECFFFFFF),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.drawer = true;
                                  safeSetState(() {});
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 7.0,
                                      sigmaY: 7.0,
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .textAndStroke,
                                      borderRadius: 10.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.menu_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        _model.drawer = true;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 25.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.smartsearchSession?.title,
                                    'New search',
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'LTSuperior',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                        lineHeight: 1.25,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('wishlist');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 7.0,
                                      sigmaY: 7.0,
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .textAndStroke,
                                      borderRadius: 10.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.favorite_border_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('wishlist');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).textAndStroke,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_model.drawer)
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 40.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.drawer = false;
                                                  _model.smartsearchSession =
                                                      null;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15.0,
                                                                10.0,
                                                                15.0,
                                                                10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        2.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'New search',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'LTSuperior',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
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
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (((currentUserDocument
                                                              ?.smartSearchHistory
                                                              ?.toList() ??
                                                          [])
                                                      .where((e) =>
                                                          functions
                                                              .dateTimeComparison(
                                                                  getCurrentTimestamp,
                                                                  e.smartsearchItems
                                                                      .last.when!)
                                                              .toString() ==
                                                          '0')
                                                      .toList()
                                                      .length >=
                                                  1) ||
                                              (_model.smartsearchSession ==
                                                  null))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 40.0, 0.0, 10.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  'Today',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            Color(0x7B1D1D20),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          if (_model.smartsearchSession == null)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.drawer = false;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF0F0F0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 10.0,
                                                          12.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'New search',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'LTSuperior',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Builder(
                                              builder: (context) {
                                                final today = (currentUserDocument
                                                            ?.smartSearchHistory
                                                            ?.toList() ??
                                                        [])
                                                    .where((e) =>
                                                        functions
                                                            .dateTimeComparison(
                                                                getCurrentTimestamp,
                                                                e.smartsearchItems
                                                                    .last.when!)
                                                            .toString() ==
                                                        '0')
                                                    .toList()
                                                    .sortedList(
                                                        keyOf: (e) => e
                                                            .smartsearchItems
                                                            .last
                                                            .when!,
                                                        desc: true)
                                                    .toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      today.length,
                                                      (todayIndex) {
                                                    final todayItem =
                                                        today[todayIndex];
                                                    return Visibility(
                                                      visible: todayItem.title
                                                          .toLowerCase()
                                                          .startsWith(_model
                                                              .textController2
                                                              .text
                                                              .toLowerCase()),
                                                      child: HistoryItemWidget(
                                                        key: Key(
                                                            'Key3wb_${todayIndex}_of_${today.length}'),
                                                        title: valueOrDefault<
                                                            String>(
                                                          todayItem.title,
                                                          'New chat',
                                                        ),
                                                        currentItemId:
                                                            todayItem.id,
                                                        sessionid: _model
                                                            .smartsearchSession
                                                            ?.id,
                                                        currentItem: todayItem,
                                                        showOptions: todayItem
                                                                .id ==
                                                            _model
                                                                .smartsearchSession
                                                                ?.id,
                                                        actionEdit: () async {
                                                          _model.smartSearchSessions =
                                                              (currentUserDocument
                                                                          ?.smartSearchHistory
                                                                          ?.toList() ??
                                                                      [])
                                                                  .toList()
                                                                  .cast<
                                                                      SmartsearchSessionStruct>();
                                                          _model
                                                              .smartsearchSession = _model
                                                                  .smartSearchSessions[
                                                              functions.jsonIndexFromListJson(
                                                                  todayItem.id,
                                                                  _model
                                                                      .smartSearchSessions
                                                                      .map((e) =>
                                                                          e.toMap())
                                                                      .toList())];
                                                          safeSetState(() {});
                                                        },
                                                        actionOnTap: () async {
                                                          if (true) {
                                                            if (_model
                                                                    .smartsearchSession
                                                                    ?.id ==
                                                                todayItem.id) {
                                                              _model.drawer =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.smartsearchSession =
                                                                  todayItem;
                                                              _model.drawer =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          700));
                                                              await _model
                                                                  .columnForListView
                                                                  ?.animateTo(
                                                                _model
                                                                    .columnForListView!
                                                                    .position
                                                                    .maxScrollExtent,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        100),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            }
                                                          }
                                                        },
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      if ((currentUserDocument
                                                      ?.smartSearchHistory
                                                      ?.toList() ??
                                                  [])
                                              .where((e) =>
                                                  functions
                                                      .dateTimeComparison(
                                                          getCurrentTimestamp,
                                                          e.smartsearchItems
                                                              .last.when!)
                                                      .toString() ==
                                                  '-1')
                                              .toList()
                                              .length >=
                                          1)
                                        AuthUserStreamWidget(
                                          builder: (context) => Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if ((currentUserDocument
                                                              ?.smartSearchHistory
                                                              ?.toList() ??
                                                          [])
                                                      .where((e) =>
                                                          functions
                                                              .dateTimeComparison(
                                                                  getCurrentTimestamp,
                                                                  e.smartsearchItems
                                                                      .last.when!)
                                                              .toString() ==
                                                          '0')
                                                      .toList()
                                                      .length >=
                                                  1)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 40.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Yesterday',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color:
                                                              Color(0x7B1D1D20),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final yesterday = (currentUserDocument
                                                                ?.smartSearchHistory
                                                                ?.toList() ??
                                                            [])
                                                        .where((e) =>
                                                            functions
                                                                .dateTimeComparison(
                                                                    getCurrentTimestamp,
                                                                    e
                                                                        .smartsearchItems
                                                                        .last
                                                                        .when!)
                                                                .toString() ==
                                                            '-1')
                                                        .toList()
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .smartsearchItems
                                                                .last
                                                                .when!,
                                                            desc: true)
                                                        .toList();

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                          yesterday.length,
                                                          (yesterdayIndex) {
                                                        final yesterdayItem =
                                                            yesterday[
                                                                yesterdayIndex];
                                                        return Visibility(
                                                          visible: yesterdayItem
                                                              .title
                                                              .toLowerCase()
                                                              .startsWith(_model
                                                                  .textController2
                                                                  .text
                                                                  .toLowerCase()),
                                                          child:
                                                              HistoryItemWidget(
                                                            key: Key(
                                                                'Keynys_${yesterdayIndex}_of_${yesterday.length}'),
                                                            title:
                                                                valueOrDefault<
                                                                    String>(
                                                              yesterdayItem
                                                                  .title,
                                                              'New chat',
                                                            ),
                                                            currentItemId:
                                                                yesterdayItem
                                                                    .id,
                                                            sessionid: _model
                                                                .smartsearchSession
                                                                ?.id,
                                                            currentItem:
                                                                yesterdayItem,
                                                            actionEdit:
                                                                () async {
                                                              _model.smartSearchSessions =
                                                                  (currentUserDocument
                                                                              ?.smartSearchHistory
                                                                              ?.toList() ??
                                                                          [])
                                                                      .toList()
                                                                      .cast<
                                                                          SmartsearchSessionStruct>();
                                                              _model
                                                                  .smartsearchSession = _model
                                                                      .smartSearchSessions[
                                                                  functions.jsonIndexFromListJson(
                                                                      yesterdayItem
                                                                          .id,
                                                                      _model
                                                                          .smartSearchSessions
                                                                          .map((e) =>
                                                                              e.toMap())
                                                                          .toList())];
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            actionOnTap:
                                                                () async {
                                                              if (true) {
                                                                if (_model
                                                                        .smartsearchSession
                                                                        ?.id ==
                                                                    yesterdayItem
                                                                        .id) {
                                                                  _model.drawer =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.smartsearchSession =
                                                                      yesterdayItem;
                                                                  _model.drawer =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              700));
                                                                  await _model
                                                                      .columnForListView
                                                                      ?.animateTo(
                                                                    _model
                                                                        .columnForListView!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                }
                                                              }
                                                            },
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if ((currentUserDocument
                                                      ?.smartSearchHistory
                                                      ?.toList() ??
                                                  [])
                                              .where((e) =>
                                                  (functions
                                                          .dateTimeComparison(
                                                              getCurrentTimestamp,
                                                              e.smartsearchItems
                                                                  .last.when!)
                                                          .toString() !=
                                                      '-1') &&
                                                  (functions
                                                          .dateTimeComparison(
                                                              getCurrentTimestamp,
                                                              e.smartsearchItems
                                                                  .last.when!)
                                                          .toString() !=
                                                      '0'))
                                              .toList()
                                              .length >=
                                          1)
                                        AuthUserStreamWidget(
                                          builder: (context) => Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 30.0, 0.0, 0.0),
                                                child: Text(
                                                  'Previous days',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            Color(0x7B1D1D20),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final previous = (currentUserDocument
                                                                ?.smartSearchHistory
                                                                ?.toList() ??
                                                            [])
                                                        .where((e) =>
                                                            (functions
                                                                    .dateTimeComparison(
                                                                        getCurrentTimestamp,
                                                                        e
                                                                            .smartsearchItems
                                                                            .last
                                                                            .when!)
                                                                    .toString() !=
                                                                '-1') &&
                                                            (functions
                                                                    .dateTimeComparison(
                                                                        getCurrentTimestamp,
                                                                        e
                                                                            .smartsearchItems
                                                                            .last
                                                                            .when!)
                                                                    .toString() !=
                                                                '0'))
                                                        .toList()
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .smartsearchItems
                                                                .last
                                                                .when!,
                                                            desc: true)
                                                        .toList();

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                          previous.length,
                                                          (previousIndex) {
                                                        final previousItem =
                                                            previous[
                                                                previousIndex];
                                                        return Visibility(
                                                          visible: previousItem
                                                              .title
                                                              .toLowerCase()
                                                              .startsWith(_model
                                                                  .textController2
                                                                  .text
                                                                  .toLowerCase()),
                                                          child:
                                                              HistoryItemWidget(
                                                            key: Key(
                                                                'Keyuwt_${previousIndex}_of_${previous.length}'),
                                                            title:
                                                                valueOrDefault<
                                                                    String>(
                                                              previousItem
                                                                  .title,
                                                              'New chat',
                                                            ),
                                                            currentItemId:
                                                                previousItem.id,
                                                            sessionid: _model
                                                                .smartsearchSession
                                                                ?.id,
                                                            currentItem:
                                                                previousItem,
                                                            showOptions:
                                                                previousItem
                                                                        .id ==
                                                                    _model
                                                                        .smartsearchSession
                                                                        ?.id,
                                                            actionEdit:
                                                                () async {
                                                              _model.smartSearchSessions =
                                                                  (currentUserDocument
                                                                              ?.smartSearchHistory
                                                                              ?.toList() ??
                                                                          [])
                                                                      .toList()
                                                                      .cast<
                                                                          SmartsearchSessionStruct>();
                                                              _model
                                                                  .smartsearchSession = _model
                                                                      .smartSearchSessions[
                                                                  functions.jsonIndexFromListJson(
                                                                      previousItem
                                                                          .id,
                                                                      _model
                                                                          .smartSearchSessions
                                                                          .map((e) =>
                                                                              e.toMap())
                                                                          .toList())];
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            actionOnTap:
                                                                () async {
                                                              if (true) {
                                                                if (_model
                                                                        .smartsearchSession
                                                                        ?.id ==
                                                                    previousItem
                                                                        .id) {
                                                                  _model.drawer =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.smartsearchSession =
                                                                      previousItem;
                                                                  _model.drawer =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              200));
                                                                  await _model
                                                                      .columnForListView
                                                                      ?.animateTo(
                                                                    _model
                                                                        .columnForListView!
                                                                        .position
                                                                        .maxScrollExtent,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                }
                                                              }
                                                            },
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ].addToStart(SizedBox(height: 100.0)),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 0.0,
                                      sigmaY: 0.0,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            if (!_model.searchSearches) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 55.0, 12.0, 0.0),
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
                                                    _model.searchSearches =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF0F0F0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Icon(
                                                            FFIcons.ksearch,
                                                            color: Color(
                                                                0xFFA3A3B3),
                                                            size: 14.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Search for searches',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'LTSuperior',
                                                                  color: Color(
                                                                      0xFFA3A3B3),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  40.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF0F0F0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController2,
                                                              focusNode: _model
                                                                  .textFieldFocusNode2,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.textController2',
                                                                Duration(
                                                                    milliseconds:
                                                                        10),
                                                                () =>
                                                                    safeSetState(
                                                                        () {}),
                                                              ),
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'LTSuperior',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                hintText:
                                                                    'Search...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'LTSuperior',
                                                                      color: Color(
                                                                          0x821D1D20),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedErrorBorder:
                                                                    InputBorder
                                                                        .none,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'LTSuperior',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              validator: _model
                                                                  .textController2Validator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                15.0, 12.0),
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
                                                        _model.searchSearches =
                                                            false;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model.textController2
                                                              ?.clear();
                                                        });
                                                      },
                                                      child: Text(
                                                        'Cancel',
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
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 15.0, 12.0, 25.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('profile');
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 100),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 100),
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    currentUserPhoto,
                                                    'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  currentUserDisplayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 8.0,
                        sigmaY: 8.0,
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.drawer = false;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.textController2?.clear();
                          });
                        },
                        child: Container(
                          width: _model.searchSearches ? 20.0 : 70.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xBB000000),
                          ),
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
