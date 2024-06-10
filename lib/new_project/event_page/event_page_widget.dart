import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/image_slider_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import 'dart:async';
import 'dart:ui';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'event_page_model.dart';
export 'event_page_model.dart';

class EventPageWidget extends StatefulWidget {
  const EventPageWidget({
    super.key,
    required this.events,
    this.text,
    required this.isFrom,
  });

  final EventsRecord? events;
  final dynamic text;
  final String? isFrom;

  @override
  State<EventPageWidget> createState() => _EventPageWidgetState();
}

class _EventPageWidgetState extends State<EventPageWidget> {
  late EventPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userParticipating =
          widget.events!.participants.contains(currentUserReference);
      _model.participants =
          widget.events!.participantUsers.toList().cast<ParticipantsStruct>();
      _model.appliedToJoin =
          widget.events!.usersAppliedToJoin.toList().cast<ParticipantsStruct>();
      _model.userApplied = _model.appliedToJoin
          .where((e) => e.user == currentUserReference)
          .toList()
          .first
          .applied;
      setState(() {});
      await Future.wait([
        Future(() async {
          if (widget.events?.user != null) {
            _model.owner =
                await UsersRecord.getDocumentOnce(widget.events!.user!);
            _model.whose = 'user';
            setState(() {});
          }
        }),
        Future(() async {
          if (widget.events?.project != null) {
            _model.company =
                await ProjectsRecord.getDocumentOnce(widget.events!.project!);
            _model.whose = 'company';
            setState(() {});
          }
        }),
      ]);
      unawaited(
        () async {
          await _model.googleMapsController.future.then(
            (c) => c.animateCamera(
              CameraUpdate.newLatLng(
                  widget.events!.eventInfo.location!.toGoogleMaps()),
            ),
          );
        }(),
      );
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
    return StreamBuilder<EventsRecord>(
      stream: EventsRecord.getDocument(widget.events!.reference),
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
        final eventPageEventsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Stack(
                children: [
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            final images =
                                widget.events?.eventInfo?.images?.toList() ??
                                    [];
                            return Container(
                              width: double.infinity,
                              height: 380.0,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: max(
                                                0, min(0, images.length - 1))),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    itemBuilder: (context, imagesIndex) {
                                      final imagesItem = images[imagesIndex];
                                      return Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Container(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: ImageSliderWidget(
                                                        images: widget.events!
                                                            .eventInfo.images,
                                                        initialindex:
                                                            imagesIndex,
                                                        event: widget.events,
                                                        isThisYours: false,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              imagesItem,
                                              width: 300.0,
                                              height: 380.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.98),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 16.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(0,
                                                    min(0, images.length - 1))),
                                        count: images.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          setState(() {});
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 2.0,
                                          spacing: 8.0,
                                          radius: 16.0,
                                          dotWidth: 8.0,
                                          dotHeight: 8.0,
                                          dotColor: Color(0xB3A3A3B3),
                                          activeDotColor: Colors.white,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 42.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.events?.eventInfo?.title,
                                      'title',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_model.whose != null && _model.whose != '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 18.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.whose == 'user') {
                                          context.pushNamed(
                                            'user_page',
                                            queryParameters: {
                                              'user': serializeParam(
                                                _model.owner,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'user': _model.owner,
                                            },
                                          );
                                        } else {
                                          context.pushNamed(
                                            'company_page',
                                            queryParameters: {
                                              'company': serializeParam(
                                                _model.company,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'company': _model.company,
                                            },
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(360.0),
                                            child: Image.network(
                                              _model.whose == 'user'
                                                  ? _model.owner!.photoUrl
                                                  : _model.company!.mainImage,
                                              width: 47.0,
                                              height: 47.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      11.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      _model.whose == 'user'
                                                          ? _model.owner
                                                              ?.displayName
                                                          : _model
                                                              .company?.title,
                                                      'name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Event owner ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color:
                                                              Color(0x89000000),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 1.0)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.whereIn(
                                                'uid',
                                                widget.events?.participants
                                                    ?.map((e) => e.id)
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
                                        List<UsersRecord>
                                            containerUsersRecordList =
                                            snapshot.data!;
                                        return Container(
                                          width: 65.0,
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            width: 64.0,
                                            child: Stack(
                                              children: [
                                                if (containerUsersRecordList
                                                        .length >=
                                                    3)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            containerUsersRecordList[
                                                                    2]
                                                                .photoUrl,
                                                            'https://picsum.photos/seed/412/600',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (containerUsersRecordList
                                                        .length >=
                                                    2)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            containerUsersRecordList[
                                                                    1]
                                                                .photoUrl,
                                                            'https://picsum.photos/seed/412/600',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Container(
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
                                                          containerUsersRecordList[
                                                                  0]
                                                              .photoUrl,
                                                          'https://picsum.photos/seed/412/600',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        eventPageEventsRecord
                                            .participants.length
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        if (widget.text != null)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 30.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          FFIcons.kfire,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 22.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 1.0, 0.0, 0.0),
                                          child: Text(
                                            'Smart Search',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'LTSuperior',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      17.0, 0.0, 17.0, 0.0),
                                              child: Text(
                                                '${getJsonField(
                                                  widget.text,
                                                  r'''$.percent''',
                                                ).toString()}%',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      widget.text,
                                      r'''$.explanation''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: Color(0xBF1D1D20),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if ((_model.userParticipating == false) ||
                                    (eventPageEventsRecord.eventInfo.isOpen ==
                                        true)) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 36.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Description',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.events?.eventInfo
                                                  ?.description,
                                              'info',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'LTSuperior',
                                                  color: Color(0xBF1D1D20),
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 46.0,
                                                    height: 46.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x3F007AFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Icon(
                                                      Icons.timelapse,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                    'yMMMd',
                                                                    widget
                                                                        .events
                                                                        ?.eventInfo
                                                                        ?.startDate),
                                                                'info',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'LTSuperior',
                                                                    color: Color(
                                                                        0x8A1D1D20),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      2.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${valueOrDefault<String>(
                                                              dateTimeFormat(
                                                                  'Hm',
                                                                  widget
                                                                      .events
                                                                      ?.eventInfo
                                                                      ?.startTime),
                                                              'info',
                                                            )}',
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
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (widget.events?.eventInfo
                                                      ?.location !=
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 46.0,
                                                        height: 46.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x3F007AFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .locationArrow,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    14.0,
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
                                                              'Location',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'LTSuperior',
                                                                    color: Color(
                                                                        0x8A1D1D20),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
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
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .events
                                                                      ?.eventInfo
                                                                      ?.locationTitle,
                                                                  'info',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 36.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await launchMap(
                                                mapType: $ml.MapType.google,
                                                address: widget.events
                                                    ?.eventInfo?.locationTitle,
                                                title: '',
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Maps',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                if (widget.events?.eventInfo
                                                            ?.additionalInfoLocation !=
                                                        null &&
                                                    widget.events?.eventInfo
                                                            ?.additionalInfoLocation !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget.events?.eventInfo
                                                            ?.additionalInfoLocation,
                                                        'info',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'LTSuperior',
                                                            color: Color(
                                                                0xBF1D1D20),
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                if (widget.events?.eventInfo
                                                        ?.location !=
                                                    null)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 17.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 240.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Builder(builder:
                                                                (context) {
                                                              final _googleMapMarker =
                                                                  widget
                                                                      .events
                                                                      ?.eventInfo
                                                                      ?.location;
                                                              return FlutterFlowGoogleMap(
                                                                controller: _model
                                                                    .googleMapsController,
                                                                onCameraIdle:
                                                                    (latLng) =>
                                                                        _model.googleMapsCenter =
                                                                            latLng,
                                                                initialLocation: _model
                                                                        .googleMapsCenter ??=
                                                                    LatLng(
                                                                        13.106061,
                                                                        -59.613158),
                                                                markers: [
                                                                  if (_googleMapMarker !=
                                                                      null)
                                                                    FlutterFlowMarker(
                                                                      _googleMapMarker
                                                                          .serialize(),
                                                                      _googleMapMarker,
                                                                    ),
                                                                ],
                                                                markerColor:
                                                                    GoogleMarkerColor
                                                                        .violet,
                                                                mapType: MapType
                                                                    .normal,
                                                                style:
                                                                    GoogleMapStyle
                                                                        .standard,
                                                                initialZoom:
                                                                    14.0,
                                                                allowInteraction:
                                                                    true,
                                                                allowZoom:
                                                                    false,
                                                                showZoomControls:
                                                                    false,
                                                                showLocation:
                                                                    true,
                                                                showCompass:
                                                                    false,
                                                                showMapToolbar:
                                                                    false,
                                                                showTraffic:
                                                                    false,
                                                                centerMapOnMarkerTap:
                                                                    true,
                                                              );
                                                            }),
                                                            Opacity(
                                                              opacity: 0.001,
                                                              child:
                                                                  PointerInterceptor(
                                                                intercepting:
                                                                    isWeb,
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await launchMap(
                                                                      mapType: $ml
                                                                          .MapType
                                                                          .google,
                                                                      address: widget
                                                                          .events
                                                                          ?.eventInfo
                                                                          ?.locationTitle,
                                                                      title: '',
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9F9F9),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 25.0, 0.0, 0.0),
                                                  child: Text(
                                                    'It\'s closed event',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'You can\'t see the location and time until the owner let you become participant',
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 15.0, 0.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .buttonFixedSizeModel1,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        ButtonFixedSizeWidget(
                                                      width: 150.0,
                                                      height: 40.0,
                                                      buttonColor: widget
                                                              .events!
                                                              .eventInfo
                                                              .isOpen
                                                          ? (_model
                                                                  .userParticipating
                                                              ? Color(
                                                                  0xFFD01F2A)
                                                              : FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary)
                                                          : (_model.userApplied
                                                              ? Color(
                                                                  0xFFDD2A34)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary),
                                                      text: widget.events!
                                                              .eventInfo.isOpen
                                                          ? (_model
                                                                  .userParticipating
                                                              ? 'Abandon'
                                                              : 'Join')
                                                          : (_model
                                                                  .userParticipating
                                                              ? 'Abandon'
                                                              : (_model
                                                                      .userApplied
                                                                  ? 'Cancel'
                                                                  : 'Apply to Join')),
                                                      fontsize: 16,
                                                      textcolor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      showLoadingIndicator:
                                                          false,
                                                      action: () async {
                                                        if (widget
                                                                .events
                                                                ?.eventInfo
                                                                ?.isOpen ==
                                                            true) {
                                                          if (_model
                                                              .userParticipating) {
                                                            _model.userParticipating =
                                                                false;
                                                            _model.removeFromParticipants(_model
                                                                .participants
                                                                .where((e) =>
                                                                    e.user ==
                                                                    currentUserReference)
                                                                .toList()
                                                                .first);
                                                            setState(() {});
                                                            unawaited(
                                                              () async {
                                                                await widget
                                                                    .events!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'participants':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              }(),
                                                            );
                                                          } else {
                                                            _model.userParticipating =
                                                                true;
                                                            _model.addToParticipants(
                                                                ParticipantsStruct(
                                                              user:
                                                                  currentUserReference,
                                                              when:
                                                                  getCurrentTimestamp,
                                                            ));
                                                            setState(() {});
                                                            unawaited(
                                                              () async {
                                                                await widget
                                                                    .events!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'participants':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              }(),
                                                            );
                                                          }
                                                        } else {
                                                          if (_model
                                                              .userApplied) {
                                                            _model.removeFromAppliedToJoin(_model
                                                                .appliedToJoin
                                                                .where((e) =>
                                                                    e.user ==
                                                                    currentUserReference)
                                                                .toList()
                                                                .first);
                                                            _model.userApplied =
                                                                false;
                                                            setState(() {});
                                                            unawaited(
                                                              () async {
                                                                await widget
                                                                    .events!
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
                                                          } else {
                                                            _model.addToAppliedToJoin(
                                                                ParticipantsStruct(
                                                              user:
                                                                  currentUserReference,
                                                              applied: true,
                                                            ));
                                                            _model.userApplied =
                                                                true;
                                                            setState(() {});
                                                            unawaited(
                                                              () async {
                                                                await widget
                                                                    .events!
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
                                                          }
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Rectangle_41654.jpg',
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ].addToEnd(SizedBox(height: 140.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.navigateBackModel,
                          updateCallback: () => setState(() {}),
                          child: NavigateBackWidget(
                            parameter1: widget.isFrom!,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((_model.owner?.reference ==
                                    currentUserReference) ||
                                (_model.company?.user == currentUserReference))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 7.0,
                                      sigmaY: 7.0,
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 10.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0x34000000),
                                      icon: Icon(
                                        Icons.keyboard_control,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'event_settings',
                                          queryParameters: {
                                            'event': serializeParam(
                                              widget.events,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'event': widget.events,
                                          },
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 15.0,
                          sigmaY: 15.0,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 90.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).mainThemeBlur,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .textAndStroke,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            widget.events!.eventInfo.isFree
                                                ? 'Free'
                                                : '\$${'\$${widget.events?.eventInfo?.price?.toString()}'}',
                                            'zxc',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: Text(
                                            '${valueOrDefault<String>(
                                              dateTimeFormat(
                                                  'yMMMd',
                                                  widget.events?.eventInfo
                                                      ?.startDate),
                                              'info',
                                            )} ${valueOrDefault<String>(
                                              dateTimeFormat(
                                                  'Hm',
                                                  widget.events?.eventInfo
                                                      ?.startTime),
                                              'info',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'LTSuperior',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model: _model.buttonFixedSizeModel2,
                                          updateCallback: () => setState(() {}),
                                          child: ButtonFixedSizeWidget(
                                            width: 150.0,
                                            height: 40.0,
                                            buttonColor:
                                                widget.events!.eventInfo.isOpen
                                                    ? (_model.userParticipating
                                                        ? Color(0xFFD01F2A)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary)
                                                    : (_model.userApplied
                                                        ? Color(0xFFDD2A34)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary),
                                            text: eventPageEventsRecord
                                                    .eventInfo.isOpen
                                                ? (eventPageEventsRecord
                                                        .participants
                                                        .contains(
                                                            currentUserReference)
                                                    ? 'Abandon'
                                                    : 'Join')
                                                : (eventPageEventsRecord
                                                        .participants
                                                        .contains(
                                                            currentUserReference)
                                                    ? 'Abandon'
                                                    : (_model.userApplied
                                                        ? 'Cancel'
                                                        : 'Apply to Join')),
                                            fontsize: 16,
                                            textcolor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            showLoadingIndicator: false,
                                            action: () async {
                                              if (widget.events?.eventInfo
                                                      ?.isOpen ==
                                                  true) {
                                                if (_model.userParticipating) {
                                                  _model.userParticipating =
                                                      false;
                                                  _model.removeFromParticipants(
                                                      _model.participants
                                                          .where((e) =>
                                                              e.user ==
                                                              currentUserReference)
                                                          .toList()
                                                          .first);
                                                  setState(() {});
                                                  unawaited(
                                                    () async {
                                                      await widget
                                                          .events!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'participants':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }(),
                                                  );
                                                } else {
                                                  _model.userParticipating =
                                                      true;
                                                  _model.addToParticipants(
                                                      ParticipantsStruct(
                                                    user: currentUserReference,
                                                    when: getCurrentTimestamp,
                                                  ));
                                                  setState(() {});
                                                  unawaited(
                                                    () async {
                                                      await widget
                                                          .events!.reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'participants':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }(),
                                                  );
                                                }
                                              } else {
                                                if (_model.userApplied) {
                                                  _model.removeFromAppliedToJoin(
                                                      _model.appliedToJoin
                                                          .where((e) =>
                                                              e.user ==
                                                              currentUserReference)
                                                          .toList()
                                                          .first);
                                                  _model.userApplied = false;
                                                  setState(() {});
                                                  unawaited(
                                                    () async {
                                                      await widget
                                                          .events!.reference
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
                                                } else {
                                                  _model.addToAppliedToJoin(
                                                      ParticipantsStruct(
                                                    user: currentUserReference,
                                                    applied: true,
                                                  ));
                                                  _model.userApplied = true;
                                                  setState(() {});
                                                  unawaited(
                                                    () async {
                                                      await widget
                                                          .events!.reference
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
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 10.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              FFIcons.kmessages,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 16.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                'chat_page',
                                                queryParameters: {
                                                  'user': serializeParam(
                                                    _model.owner,
                                                    ParamType.Document,
                                                  ),
                                                  'company': serializeParam(
                                                    _model.company,
                                                    ParamType.Document,
                                                  ),
                                                  'event': serializeParam(
                                                    widget.events,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'user': _model.owner,
                                                  'company': _model.company,
                                                  'event': widget.events,
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
