import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/navigationbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/company_card/company_card_widget.dart';
import '/new_project/event_card/event_card_widget.dart';
import '/new_project/product_card/product_card_widget.dart';
import '/new_project/user_card_new/user_card_new_widget.dart';
import 'dart:async';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'smart_search_all2_model.dart';
export 'smart_search_all2_model.dart';

class SmartSearchAll2Widget extends StatefulWidget {
  const SmartSearchAll2Widget({
    super.key,
    String? chosen,
    this.firstSearch,
  }) : this.chosen = chosen ?? 'Projects';

  final String chosen;
  final String? firstSearch;

  @override
  State<SmartSearchAll2Widget> createState() => _SmartSearchAll2WidgetState();
}

class _SmartSearchAll2WidgetState extends State<SmartSearchAll2Widget> {
  late SmartSearchAll2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmartSearchAll2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.firstSearch != null && widget.firstSearch != '') {
        _model.showGIF = true;
        setState(() {});
        _model.smartsearch2 = await SmartSearchNeightnCall.call(
          text: functions.stringToAPI(_model.textController.text),
        );
        if ((_model.smartsearch2?.succeeded ?? true)) {
          _model.str = getJsonField(
            (_model.smartsearch2?.jsonBody ?? ''),
            r'''$.response.text''',
          ).toString().toString();
          _model.showGIF = false;
          setState(() {});
          unawaited(
            () async {
              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'smartSearchHistory': FieldValue.arrayUnion([
                      getSmartSearchFirestoreData(
                        updateSmartSearchStruct(
                          SmartSearchStruct(
                            when: getCurrentTimestamp,
                            type: _model.str,
                            result: _model.str,
                            queryStr: _model.textController.text,
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
        }
      }
    });

    _model.textController ??= TextEditingController(text: widget.firstSearch);
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
                    height: 188.0,
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
                              20.0, 40.0, 20.0, 0.0),
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
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          setState(() {});
                                          _model.searchSubmit =
                                              await SmartSearchCall.call(
                                            text: 'sf',
                                          );
                                          if ((_model.searchSubmit?.succeeded ??
                                              true)) {
                                            _model.searchResults = ((_model
                                                                .searchSubmit
                                                                ?.jsonBody ??
                                                            '')
                                                        .toList()
                                                        .map<SearchItemStruct?>(
                                                            SearchItemStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        SearchItemStruct?>)
                                                .withoutNulls!
                                                .toList()
                                                .cast<SearchItemStruct>();
                                            setState(() {});
                                          }

                                          setState(() {});
                                        },
                                        autofocus: true,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .a3a3b3,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 0.0, 18.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
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
                                    return FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 10.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.showGIF = true;
                                        setState(() {});
                                        _model.smartsearch =
                                            await SmartSearchNeightnCall.call(
                                          text: functions.stringToAPI(
                                              _model.textController.text),
                                        );
                                        if ((_model.smartsearch?.succeeded ??
                                            true)) {
                                          _model.str = getJsonField(
                                            (_model.smartsearch?.jsonBody ??
                                                ''),
                                            r'''$.response.text''',
                                          ).toString();
                                          _model.showGIF = false;
                                          setState(() {});
                                          unawaited(
                                            () async {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'smartSearchHistory':
                                                        FieldValue.arrayUnion([
                                                      getSmartSearchFirestoreData(
                                                        updateSmartSearchStruct(
                                                          SmartSearchStruct(
                                                            when:
                                                                getCurrentTimestamp,
                                                            type: _model.str,
                                                            result: _model.str,
                                                            queryStr: _model
                                                                .textController
                                                                .text,
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
                                        }

                                        setState(() {});
                                      },
                                    );
                                  }
                                },
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 22.0, 24.0, 0.0),
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
                                  _model.chosenState = 'News';
                                  setState(() {});
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 52.0,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        color: _model.chosenState == 'News'
                                            ? Color(0xFF00B071)
                                            : Color(0x1A00B071),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                      child: Icon(
                                        FFIcons.knewsW,
                                        color: _model.chosenState == 'News'
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
                                                  _model.chosenState == 'News'
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
                                              color:
                                                  _model.chosenState == 'Events'
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
                                              color:
                                                  _model.chosenState == 'People'
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
                                        color: _model.chosenState == 'Companies'
                                            ? Color(0xFF00C2FF)
                                            : Color(0x1A00C2FF),
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                      child: Icon(
                                        FFIcons.kprojectsW,
                                        color: _model.chosenState == 'Companies'
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
                      if (!_model.showGIF &&
                          (_model.str != null && _model.str != '')) {
                        return Builder(
                          builder: (context) {
                            if (_model.chosenState == 'All') {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final searchResult = functions
                                        .cleanJson(getJsonField(
                                          (_model.smartsearch?.jsonBody ?? ''),
                                          r'''$.response.text''',
                                        ).toString())
                                        .toList();
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
                                            if (getJsonField(
                                                  searchResultItem,
                                                  r'''$.type''',
                                                ) ==
                                                getJsonField(
                                                  <String, String?>{
                                                    'type': 'event',
                                                  },
                                                  r'''$.type''',
                                                )) {
                                              return StreamBuilder<
                                                  List<EventsRecord>>(
                                                stream: _model.event(
                                                  requestFn: () =>
                                                      queryEventsRecord(
                                                    queryBuilder:
                                                        (eventsRecord) =>
                                                            eventsRecord.where(
                                                      'custom_id',
                                                      isEqualTo: getJsonField(
                                                        searchResultItem,
                                                        r'''$.firebase_id''',
                                                      ).toString(),
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
                                                  List<EventsRecord>
                                                      eventCardEventsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
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
                                                        'Keyz99_${searchResultIndex}_of_${searchResult.length}'),
                                                    eventDoc:
                                                        eventCardEventsRecord!,
                                                    explanation: getJsonField(
                                                      searchResultItem,
                                                      r'''$.explanation''',
                                                    ).toString(),
                                                    isFrom: 'smartsearch',
                                                  );
                                                },
                                              );
                                            } else if (getJsonField(
                                                  searchResultItem,
                                                  r'''$.type''',
                                                ) ==
                                                getJsonField(
                                                  <String, String?>{
                                                    'type': _model.chosenState,
                                                  },
                                                  r'''$.type''',
                                                )) {
                                              return StreamBuilder<
                                                  List<ProjectsRecord>>(
                                                stream: queryProjectsRecord(
                                                  queryBuilder:
                                                      (projectsRecord) =>
                                                          projectsRecord.where(
                                                    'custom_id',
                                                    isEqualTo: getJsonField(
                                                      searchResultItem,
                                                      r'''$.firebase_id''',
                                                    ).toString(),
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
                                                        'Keyqer_${searchResultIndex}_of_${searchResult.length}'),
                                                    percent: getJsonField(
                                                      searchResultItem,
                                                      r'''$.percent''',
                                                    ).toString(),
                                                    expanation: getJsonField(
                                                      searchResultItem,
                                                      r'''$.explanation''',
                                                    ).toString(),
                                                    company:
                                                        companyCardProjectsRecord!,
                                                  );
                                                },
                                              );
                                            } else if (getJsonField(
                                                  searchResultItem,
                                                  r'''$.type''',
                                                ) ==
                                                getJsonField(
                                                  <String, String?>{
                                                    'type': _model.chosenState,
                                                  },
                                                  r'''$.type''',
                                                )) {
                                              return StreamBuilder<
                                                  List<UsersRecord>>(
                                                stream: _model.user(
                                                  requestFn: () =>
                                                      queryUsersRecord(
                                                    queryBuilder:
                                                        (usersRecord) =>
                                                            usersRecord.where(
                                                      'uid',
                                                      isEqualTo: getJsonField(
                                                        searchResultItem,
                                                        r'''$.firebase_id''',
                                                      ).toString(),
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
                                                        'Keyzb8_${searchResultIndex}_of_${searchResult.length}'),
                                                    user:
                                                        userCardNewUsersRecord!,
                                                  );
                                                },
                                              );
                                            } else {
                                              return StreamBuilder<
                                                  List<ProductsRecord>>(
                                                stream: queryProductsRecord(
                                                  queryBuilder:
                                                      (productsRecord) =>
                                                          productsRecord.where(
                                                    'custom_id',
                                                    isEqualTo: getJsonField(
                                                      searchResultItem,
                                                      r'''$.firebase_id''',
                                                    ).toString(),
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
                                                  List<ProductsRecord>
                                                      productCardProductsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
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
                                                        'Keydw6_${searchResultIndex}_of_${searchResult.length}'),
                                                    isFrom: 'main',
                                                    product:
                                                        productCardProductsRecord!,
                                                  );
                                                },
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
                                    0.0, 24.0, 0.0, 0.0),
                                child: StreamBuilder<List<EventsRecord>>(
                                  stream: queryEventsRecord(
                                    queryBuilder: (eventsRecord) =>
                                        eventsRecord.whereIn(
                                            'custom_id',
                                            functions
                                                .cleanJson(_model.str!)
                                                .map((e) => getJsonField(
                                                      e,
                                                      r'''$.firebase_id''',
                                                    ))
                                                .toList()
                                                .map((e) => e.toString())
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
                                              'Keyb62_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                          eventDoc: listViewEventsRecord,
                                          explanation: getJsonField(
                                            functions.cleanJson(
                                                _model.str!)[listViewIndex],
                                            r'''$.explanation''',
                                          ).toString(),
                                          isFrom: 'smartsearch',
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else if (_model.chosenState == 'People') {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.whereIn(
                                            'uid',
                                            functions
                                                .cleanJson(_model.str!)
                                                .map((e) => getJsonField(
                                                      e,
                                                      r'''$.firebase_id''',
                                                    ))
                                                .toList()
                                                .where((e) =>
                                                    getJsonField(
                                                      e,
                                                      r'''$.type''',
                                                    ) ==
                                                    getJsonField(
                                                      <String, String?>{
                                                        'type': 'people',
                                                      },
                                                      r'''$.type''',
                                                    ))
                                                .toList()
                                                .map((e) => e.toString())
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
                                              'Keyl0q_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                                          user: listViewUsersRecord,
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else if (_model.chosenState == 'Companies') {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: StreamBuilder<List<ProjectsRecord>>(
                                  stream: queryProjectsRecord(
                                    queryBuilder: (projectsRecord) =>
                                        projectsRecord.whereIn(
                                            'custom_id',
                                            functions
                                                .cleanJson(_model.str!)
                                                .map((e) => getJsonField(
                                                      e,
                                                      r'''$.firebase_id''',
                                                    ))
                                                .toList()
                                                .where((e) =>
                                                    getJsonField(
                                                      e,
                                                      r'''$.type''',
                                                    ) ==
                                                    getJsonField(
                                                      <String, String?>{
                                                        'type': 'company',
                                                      },
                                                      r'''$.type''',
                                                    ))
                                                .toList()
                                                .map((e) => e.toString())
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
                                              'Keyn95_${listViewIndex}_of_${listViewProjectsRecordList.length}'),
                                          percent: getJsonField(
                                            functions.cleanJson(
                                                _model.str!)[listViewIndex],
                                            r'''$.percent''',
                                          ).toString(),
                                          expanation: getJsonField(
                                            functions.cleanJson(
                                                _model.str!)[listViewIndex],
                                            r'''$.explanation''',
                                          ).toString(),
                                          company: listViewProjectsRecord,
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: StreamBuilder<List<ProductsRecord>>(
                                  stream: queryProductsRecord(
                                    queryBuilder: (productsRecord) =>
                                        productsRecord.whereIn(
                                            'custom_id',
                                            functions
                                                .cleanJson(_model.str!)
                                                .map((e) => getJsonField(
                                                      e,
                                                      r'''$.firebase_id''',
                                                    ))
                                                .toList()
                                                .where((e) =>
                                                    getJsonField(
                                                      e,
                                                      r'''$.type''',
                                                    ) ==
                                                    getJsonField(
                                                      <String, String?>{
                                                        'type': 'company',
                                                      },
                                                      r'''$.type''',
                                                    ))
                                                .toList()
                                                .map((e) => e.toString())
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
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewProductsRecord =
                                            listViewProductsRecordList[
                                                listViewIndex];
                                        return ProductCardWidget(
                                          key: Key(
                                              'Key0lk_${listViewIndex}_of_${listViewProductsRecordList.length}'),
                                          explanation: getJsonField(
                                            functions.cleanJson(
                                                _model.str!)[listViewIndex],
                                            r'''$.explanation''',
                                          ).toString(),
                                          isFrom: 'main',
                                          product: listViewProductsRecord,
                                        );
                                      },
                                    );
                                  },
                                ),
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
                            children: [],
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
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navigationbarModel,
                updateCallback: () => setState(() {}),
                child: NavigationbarWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
