import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/company_card/company_card_widget.dart';
import '/sign_in_foulder/new_project/event_card/event_card_widget.dart';
import '/sign_in_foulder/new_project/product_card/product_card_widget.dart';
import '/sign_in_foulder/new_project/user_card_new/user_card_new_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'history_item_model.dart';
export 'history_item_model.dart';

class HistoryItemWidget extends StatefulWidget {
  const HistoryItemWidget({
    super.key,
    String? chosen,
    this.indexItem,
  }) : this.chosen = chosen ?? 'Projects';

  final String chosen;
  final int? indexItem;

  @override
  State<HistoryItemWidget> createState() => _HistoryItemWidgetState();
}

class _HistoryItemWidgetState extends State<HistoryItemWidget>
    with TickerProviderStateMixin {
  late HistoryItemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryItemModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.index = widget.indexItem;
      setState(() {});
      _model.smartSearchHistoryItem =
          (currentUserDocument?.smartSearchHistory?.toList() ?? [])[
              (currentUserDocument?.smartSearchHistory?.toList() ?? []).length -
                  (_model.index!) -
                  1];
      _model.searchResults = _model.smartSearchHistoryItem!.searchResults
          .toList()
          .cast<SearchItemStruct>();
      setState(() {});
    });

    animationsMap.addAll({
      'iconButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 170.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.95, 0.95),
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
          alignment: AlignmentDirectional(0.0, 1.0),
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 48.0, 20.0, 14.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Icon(
                                    FFIcons.kback,
                                    color:
                                        FlutterFlowTheme.of(context).thirdText,
                                    size: 13.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  'History',
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
                              Builder(
                                builder: (context) {
                                  if (false) {
                                    return Container(
                                      width: 52.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Icon(
                                        FFIcons.knotifications,
                                        color: FlutterFlowTheme.of(context)
                                            .thirdText,
                                        size: 20.0,
                                      ),
                                    );
                                  } else {
                                    return Opacity(
                                      opacity: 0.01,
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 10.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: FaIcon(
                                          FontAwesomeIcons.history,
                                          color: Colors.white,
                                          size: 15.0,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'iconButtonOnActionTriggerAnimation']!,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                        if (_model.searchResults.isNotEmpty)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 8.0, 20.0, 14.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.chosenState = 'All';
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 52.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color: _model.chosenState == 'All'
                                              ? Color(0xFF00B071)
                                              : Color(0x1A00B071),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Icon(
                                          FFIcons.knewsW,
                                          color: _model.chosenState == 'All'
                                              ? Colors.white
                                              : Color(0xFF00B071),
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          'All',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    _model.chosenState == 'All'
                                                        ? Color(0xFF00B071)
                                                        : Color(0xFFA3A3B3),
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.chosenState = 'Events';
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 52.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color: _model.chosenState == 'Events'
                                              ? Color(0xFFFF3596)
                                              : Color(0x1AFF3596),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Icon(
                                          FFIcons.keventsW,
                                          color: _model.chosenState == 'Events'
                                              ? Colors.white
                                              : Color(0xFFFF3596),
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          'Events',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color: _model.chosenState ==
                                                        'Events'
                                                    ? Color(0xFFFF3596)
                                                    : Color(0xFFA3A3B3),
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.chosenState = 'Shop';
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 52.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color: _model.chosenState == 'Shop'
                                              ? Color(0xFFFFA620)
                                              : Color(0x1BFFC804),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Icon(
                                          FFIcons.kshopW,
                                          color: _model.chosenState == 'Shop'
                                              ? Colors.white
                                              : Color(0xFFFFA620),
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          'Shop',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    _model.chosenState == 'Shop'
                                                        ? Color(0xFFFFA620)
                                                        : Color(0xFFA3A3B3),
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.chosenState = 'People';
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 52.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color: _model.chosenState == 'People'
                                              ? Color(0xFFA129FF)
                                              : Color(0x1AA129FF),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Icon(
                                          FFIcons.kpeopleW,
                                          color: _model.chosenState == 'People'
                                              ? Colors.white
                                              : Color(0xFFA129FF),
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          'People',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color: _model.chosenState ==
                                                        'People'
                                                    ? Color(0xFFA129FF)
                                                    : Color(0xFFA3A3B3),
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.chosenState = 'Companies';
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 52.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color:
                                              _model.chosenState == 'Companies'
                                                  ? Color(0xFF00C2FF)
                                                  : Color(0x1A00C2FF),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Icon(
                                          FFIcons.kprojectsW,
                                          color:
                                              _model.chosenState == 'Companies'
                                                  ? Colors.white
                                                  : Color(0xFF00C2FF),
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          'Companies',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color: _model.chosenState ==
                                                        'Companies'
                                                    ? Color(0xFF00C2FF)
                                                    : Color(0xFFA3A3B3),
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
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
                  Builder(
                    builder: (context) {
                      if (true) {
                        return Builder(
                          builder: (context) {
                            if (_model.chosenState == 'All') {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final searchResult =
                                        _model.searchResults.toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        100.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: searchResult.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 12.0),
                                      itemBuilder:
                                          (context, searchResultIndex) {
                                        final searchResultItem =
                                            searchResult[searchResultIndex];
                                        return Builder(
                                          builder: (context) {
                                            if (searchResultItem.type ==
                                                'event') {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<
                                                      List<EventsRecord>>(
                                                    future: _model.event(
                                                      requestFn: () =>
                                                          queryEventsRecordOnce(
                                                        queryBuilder:
                                                            (eventsRecord) =>
                                                                eventsRecord
                                                                    .where(
                                                          'custom_id',
                                                          isEqualTo: searchResultItem
                                                                      .firebaseId !=
                                                                  ''
                                                              ? searchResultItem
                                                                  .firebaseId
                                                              : null,
                                                          isNull: (searchResultItem
                                                                          .firebaseId !=
                                                                      ''
                                                                  ? searchResultItem
                                                                      .firebaseId
                                                                  : null) ==
                                                              null,
                                                        ),
                                                        singleRecord: true,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<EventsRecord>
                                                          eventCardEventsRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final eventCardEventsRecord =
                                                          eventCardEventsRecordList
                                                                  .isNotEmpty
                                                              ? eventCardEventsRecordList
                                                                  .first
                                                              : null;
                                                      return EventCardWidget(
                                                        key: Key(
                                                            'Key9ty_${searchResultIndex}_of_${searchResult.length}'),
                                                        eventDoc:
                                                            eventCardEventsRecord!,
                                                        explanation:
                                                            searchResultItem
                                                                .explanation,
                                                        isFrom: 'smartsearch',
                                                        percent:
                                                            searchResultItem
                                                                .percent,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            } else if (searchResultItem.type ==
                                                'company') {
                                              return FutureBuilder<
                                                  List<ProjectsRecord>>(
                                                future: queryProjectsRecordOnce(
                                                  queryBuilder:
                                                      (projectsRecord) =>
                                                          projectsRecord.where(
                                                    'custom_id',
                                                    isEqualTo: searchResultItem
                                                                .firebaseId !=
                                                            ''
                                                        ? searchResultItem
                                                            .firebaseId
                                                        : null,
                                                    isNull: (searchResultItem
                                                                    .firebaseId !=
                                                                ''
                                                            ? searchResultItem
                                                                .firebaseId
                                                            : null) ==
                                                        null,
                                                  ),
                                                  singleRecord: true,
                                                ),
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
                                                  List<ProjectsRecord>
                                                      companyCardProjectsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final companyCardProjectsRecord =
                                                      companyCardProjectsRecordList
                                                              .isNotEmpty
                                                          ? companyCardProjectsRecordList
                                                              .first
                                                          : null;
                                                  return CompanyCardWidget(
                                                    key: Key(
                                                        'Key5m2_${searchResultIndex}_of_${searchResult.length}'),
                                                    percent: searchResultItem
                                                        .percent
                                                        .toString(),
                                                    expanation: searchResultItem
                                                        .explanation,
                                                    company:
                                                        companyCardProjectsRecord!,
                                                  );
                                                },
                                              );
                                            } else if (searchResultItem.type ==
                                                'user') {
                                              return StreamBuilder<
                                                  List<UsersRecord>>(
                                                stream: _model.user(
                                                  requestFn: () =>
                                                      queryUsersRecord(
                                                    queryBuilder:
                                                        (usersRecord) =>
                                                            usersRecord.where(
                                                      'uid',
                                                      isEqualTo:
                                                          searchResultItem
                                                              .firebaseId,
                                                    ),
                                                    singleRecord: true,
                                                  ),
                                                ),
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
                                                  List<UsersRecord>
                                                      userCardNewUsersRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final userCardNewUsersRecord =
                                                      userCardNewUsersRecordList
                                                              .isNotEmpty
                                                          ? userCardNewUsersRecordList
                                                              .first
                                                          : null;
                                                  return UserCardNewWidget(
                                                    key: Key(
                                                        'Keyi2y_${searchResultIndex}_of_${searchResult.length}'),
                                                    user:
                                                        userCardNewUsersRecord!,
                                                    explanation:
                                                        searchResultItem
                                                            .explanation,
                                                    percent: searchResultItem
                                                        .percent,
                                                  );
                                                },
                                              );
                                            } else {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<
                                                      List<ProductsRecord>>(
                                                    future:
                                                        queryProductsRecordOnce(
                                                      queryBuilder:
                                                          (productsRecord) =>
                                                              productsRecord
                                                                  .where(
                                                        'custom_id',
                                                        isEqualTo: searchResultItem
                                                                    .firebaseId !=
                                                                ''
                                                            ? searchResultItem
                                                                .firebaseId
                                                            : null,
                                                        isNull: (searchResultItem
                                                                        .firebaseId !=
                                                                    ''
                                                                ? searchResultItem
                                                                    .firebaseId
                                                                : null) ==
                                                            null,
                                                      ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<ProductsRecord>
                                                          productCardProductsRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final productCardProductsRecord =
                                                          productCardProductsRecordList
                                                                  .isNotEmpty
                                                              ? productCardProductsRecordList
                                                                  .first
                                                              : null;
                                                      return ProductCardWidget(
                                                        key: Key(
                                                            'Keyjgc_${searchResultIndex}_of_${searchResult.length}'),
                                                        isFrom: 'main',
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
                                    );
                                  },
                                ),
                              );
                            } else if (_model.chosenState == 'Events') {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: StreamBuilder<List<EventsRecord>>(
                                  stream: queryEventsRecord(
                                    queryBuilder: (eventsRecord) =>
                                        eventsRecord.whereIn(
                                            'custom_id',
                                            _model.searchResults
                                                .map((e) => e.firebaseId)
                                                .toList()),
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
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<EventsRecord>
                                        listViewEventsRecordList =
                                        snapshot.data!;
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        100.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewEventsRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 12.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewEventsRecord =
                                            listViewEventsRecordList[
                                                listViewIndex];
                                        return EventCardWidget(
                                          key: Key(
                                              'Keybts_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                          eventDoc: listViewEventsRecord,
                                          explanation: _model.searchResults
                                              .where((e) =>
                                                  (e.type == 'event') &&
                                                  (e.firebaseId ==
                                                      listViewEventsRecord
                                                          .customId))
                                              .toList()
                                              .first
                                              .explanation,
                                          isFrom: 'smartsearch',
                                          percent: _model.searchResults
                                              .where((e) =>
                                                  (e.type == 'event') &&
                                                  (e.firebaseId ==
                                                      listViewEventsRecord
                                                          .customId))
                                              .toList()
                                              .first
                                              .percent,
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else if (_model.chosenState == 'People') {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FutureBuilder<List<UsersRecord>>(
                                  future: queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.whereIn(
                                            'uid',
                                            _model.searchResults
                                                        .map(
                                                            (e) => e.firebaseId)
                                                        .toList() !=
                                                    ''
                                                ? _model.searchResults
                                                    .map((e) => e.firebaseId)
                                                    .toList()
                                                : null),
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
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord> listViewUsersRecordList =
                                        snapshot.data!;
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        100.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewUsersRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 12.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewUsersRecord =
                                            listViewUsersRecordList[
                                                listViewIndex];
                                        return UserCardNewWidget(
                                          key: Key(
                                              'Keygf6_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                                          user: listViewUsersRecord,
                                          explanation: _model.searchResults
                                              .where((e) =>
                                                  (e.type == 'people') &&
                                                  (e.firebaseId ==
                                                      listViewUsersRecord.uid))
                                              .toList()
                                              .first
                                              .explanation,
                                          percent: _model.searchResults
                                              .where((e) =>
                                                  (e.type == 'people') &&
                                                  (e.firebaseId ==
                                                      listViewUsersRecord.uid))
                                              .toList()
                                              .first
                                              .percent,
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else if (_model.chosenState == 'Companies') {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 210.0, 0.0, 0.0),
                                child: StreamBuilder<List<ProjectsRecord>>(
                                  stream: queryProjectsRecord(
                                    queryBuilder: (projectsRecord) =>
                                        projectsRecord.whereIn(
                                            'custom_id',
                                            _model.searchResults
                                                .map((e) => e.firebaseId)
                                                .toList()),
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
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProjectsRecord>
                                        listViewProjectsRecordList =
                                        snapshot.data!;
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        100.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewProjectsRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 12.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewProjectsRecord =
                                            listViewProjectsRecordList[
                                                listViewIndex];
                                        return CompanyCardWidget(
                                          key: Key(
                                              'Key833_${listViewIndex}_of_${listViewProjectsRecordList.length}'),
                                          percent: _model.searchResults
                                              .where((e) =>
                                                  (e.type == 'company') &&
                                                  (e.firebaseId ==
                                                      listViewProjectsRecord
                                                          .customId))
                                              .toList()
                                              .first
                                              .percent
                                              .toString(),
                                          expanation: _model.searchResults
                                              .where((e) =>
                                                  (e.type == 'company') &&
                                                  (e.firebaseId ==
                                                      listViewProjectsRecord
                                                          .customId))
                                              .toList()
                                              .first
                                              .explanation,
                                          company: listViewProjectsRecord,
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: StreamBuilder<List<ProductsRecord>>(
                                      stream: queryProductsRecord(
                                        queryBuilder: (productsRecord) =>
                                            productsRecord.whereIn(
                                                'custom_id',
                                                _model.searchResults
                                                    .map((e) => e.firebaseId)
                                                    .toList()),
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
                                            listViewProductsRecordList =
                                            snapshot.data!;
                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            100.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewProductsRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewProductsRecord =
                                                listViewProductsRecordList[
                                                    listViewIndex];
                                            return ProductCardWidget(
                                              key: Key(
                                                  'Keyw5f_${listViewIndex}_of_${listViewProductsRecordList.length}'),
                                              explanation: _model.searchResults
                                                  .where((e) =>
                                                      (e.type == 'product') &&
                                                      (e.firebaseId ==
                                                          listViewProductsRecord
                                                              .customId))
                                                  .toList()
                                                  .first
                                                  .explanation,
                                              isFrom: 'main',
                                              product: listViewProductsRecord,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        );
                      } else if (_model.showGIF) {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 200.0, 0.0, 0.0),
                                child: Lottie.network(
                                  'https://lottie.host/4785b9b6-1757-46a7-93e7-6b7eef45b50c/wvIEOppafc.json',
                                  width: 150.0,
                                  height: 130.0,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                        );
                      }
                    },
                  ),
                ].addToEnd(SizedBox(height: 50.0)),
              ),
            ),
            if (false)
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if ((int index, int numItems) {
                              return index >= 0 && index < numItems;
                            }(_model.index!, _model.searchResults.length))
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 15.0, 20.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.index = (_model.index!) - 1;
                                      setState(() {});
                                      _model.smartSearchHistoryItem =
                                          (currentUserDocument
                                                  ?.smartSearchHistory
                                                  ?.toList() ??
                                              [])[(currentUserDocument
                                                          ?.smartSearchHistory
                                                          ?.toList() ??
                                                      [])
                                                  .length -
                                              (_model.index!) -
                                              1];
                                      _model.searchResults = _model
                                          .smartSearchHistoryItem!.searchResults
                                          .toList()
                                          .cast<SearchItemStruct>();
                                      setState(() {});
                                    },
                                    text: 'Previous',
                                    options: FFButtonOptions(
                                      height: 43.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 24.0, 12.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00007AFF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .textAndStroke,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            if ((int index, int numItems) {
                              return index >= 0 && index < numItems;
                            }(_model.index!, _model.searchResults.length))
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.index = (_model.index!) + 1;
                                      setState(() {});
                                      _model.smartSearchHistoryItem =
                                          (currentUserDocument
                                                  ?.smartSearchHistory
                                                  ?.toList() ??
                                              [])[(currentUserDocument
                                                          ?.smartSearchHistory
                                                          ?.toList() ??
                                                      [])
                                                  .length -
                                              (_model.index!) -
                                              1];
                                      _model.searchResults = _model
                                          .smartSearchHistoryItem!.searchResults
                                          .toList()
                                          .cast<SearchItemStruct>();
                                      setState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.buttonFixedSizeModel,
                                      updateCallback: () => setState(() {}),
                                      child: ButtonFixedSizeWidget(
                                        width: 150.0,
                                        height: 43.0,
                                        buttonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        text: 'Next',
                                        fontsize: 16,
                                        textcolor:
                                            FlutterFlowTheme.of(context).info,
                                        showLoadingIndicator: false,
                                        action: () async {},
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
          ],
        ),
      ),
    );
  }
}
