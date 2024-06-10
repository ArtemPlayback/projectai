import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'create_event_model.dart';
export 'create_event_model.dart';

class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({
    super.key,
    this.event,
    this.company,
  });

  final EventsRecord? event;
  final ProjectsRecord? company;

  @override
  State<CreateEventWidget> createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget>
    with TickerProviderStateMixin {
  late CreateEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateEventModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isOpen = widget.event!.eventInfo.isOpen;
      _model.images = widget.event!.eventInfo.images.toList().cast<String>();
      _model.isFree = widget.event!.eventInfo.isFree;
      _model.customID = widget.event?.customId;
      setState(() {});
    });

    _model.textController1 ??=
        TextEditingController(text: widget.event?.eventInfo?.title);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.event?.eventInfo?.description);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(
        text: dateTimeFormat('d/M/y', widget.event?.eventInfo?.startDate));
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController(
        text: dateTimeFormat('Hm', widget.event?.eventInfo?.startTime));
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController(
        text: widget.event != null
            ? '${widget.event?.eventInfo?.price?.toString()}\$'
            : '\$');
    _model.textFieldFocusNode5 ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 130.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 0.98),
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: PageView(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                onPageChanged: (_) => setState(() {}),
                scrollDirection: Axis.horizontal,
                children: [
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              31.0, 0.0, 120.0, 0.0),
                          child: Text(
                            'Create event with OMNIS',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  fontSize: 35.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              31.0, 40.0, 0.0, 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '01',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            13.0, 0.0, 22.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tell people about your event',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: false,
                                                    lineHeight: 1.2,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                'Provide the key details, such as where the event takes place and how many guests can attend',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/image_13.png',
                                  width: 117.0,
                                  height: 117.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: 0.15,
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              31.0, 25.0, 0.0, 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '02',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            13.0, 0.0, 8.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Add more details',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                'Add as much information as you can because it makes it easier for our AI to ensure that your event is shown to the right people',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/image_14.png',
                                  width: 117.0,
                                  height: 117.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: 0.15,
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              31.0, 25.0, 0.0, 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '03',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            13.0, 0.0, 22.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Review and publish',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                'Once published, our intelligent AI will showcase your event to potential guests seeking experiences just like yours.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: false,
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/image_15.png',
                                  width: 117.0,
                                  height: 117.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .addToStart(SizedBox(height: 137.0))
                          .addToEnd(SizedBox(height: 120.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tell us about your event',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.0, 0.0, 0.0),
                            child: Text(
                              'Remember: the more you tell us, the more suitable participants will find your event',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 35.0, 0.0, 0.0),
                            child: Container(
                              height: 43.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                children: [
                                  TextFormField(
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Event title',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .textAndStroke,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .textAndStroke,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .thirdText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .whiteBlur,
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
                                    maxLines: 2,
                                    minLines: 1,
                                    maxLength: 80,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Stack(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                children: [
                                  TextFormField(
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode2,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Event description',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .textAndStroke,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .textAndStroke,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .thirdText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .whiteBlur,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              18.0, 20.0, 18.0, 20.0),
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
                                    maxLines: 8,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.locationArrow,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Location',
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .textAndStroke,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 12.0, 18.0, 12.0),
                                            child: Text(
                                              _model.placePickerValue.latLng !=
                                                      null
                                                  ? _model
                                                      .placePickerValue.address
                                                  : (widget.event?.eventInfo
                                                                  ?.locationTitle !=
                                                              null &&
                                                          widget
                                                                  .event
                                                                  ?.eventInfo
                                                                  ?.locationTitle !=
                                                              ''
                                                      ? widget.event!.eventInfo
                                                          .locationTitle
                                                      : ''),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    color:
                                                        _model.placePickerValue !=
                                                                null
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
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
                                      Opacity(
                                        opacity: 0.001,
                                        child: FlutterFlowPlacePicker(
                                          iOSGoogleMapsApiKey:
                                              'AIzaSyCBtpZrPcAqji_tZWGFZvrXY7q2DHrC5yk',
                                          androidGoogleMapsApiKey:
                                              'AIzaSyD7s4MbxzPSLvDvI5PEgNaaPtvbLCiWcjw',
                                          webGoogleMapsApiKey:
                                              'AIzaSyCTM7VgLe8T5jLGZIjYDCAxHVdM0HDje5g',
                                          onSelect: (place) async {
                                            setState(() => _model
                                                .placePickerValue = place);
                                          },
                                          defaultText: 'Select Location',
                                          icon: Icon(
                                            Icons.place,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 16.0,
                                          ),
                                          buttonOptions: FFButtonOptions(
                                            width: double.infinity,
                                            height: 43.0,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
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
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.timelapse_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Event start time',
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
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Container(
                                          width: 150.0,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 43.0,
                                                  decoration: BoxDecoration(),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController3,
                                                    focusNode: _model
                                                        .textFieldFocusNode3,
                                                    autofocus: false,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: 'Date',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'LTSuperior',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textAndStroke,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textAndStroke,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .whiteBlur,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  0.0,
                                                                  18.0,
                                                                  0.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                    maxLines: 2,
                                                    minLines: 1,
                                                    maxLength: 80,
                                                    buildCounter: (context,
                                                            {required currentLength,
                                                            required isFocused,
                                                            maxLength}) =>
                                                        null,
                                                    validator: _model
                                                        .textController3Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final _datePicked1Date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        getCurrentTimestamp,
                                                    firstDate:
                                                        getCurrentTimestamp,
                                                    lastDate: DateTime(2050),
                                                    builder: (context, child) {
                                                      return wrapInMaterialDatePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'LTSuperior',
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );

                                                  if (_datePicked1Date !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked1 =
                                                          DateTime(
                                                        _datePicked1Date.year,
                                                        _datePicked1Date.month,
                                                        _datePicked1Date.day,
                                                      );
                                                    });
                                                  }
                                                  setState(() {
                                                    _model.textController3
                                                            ?.text =
                                                        dateTimeFormat(
                                                            'MMMMEEEEd',
                                                            _model.datePicked1);
                                                  });
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 43.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x03FFFFFF),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Container(
                                          width: 150.0,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Container(
                                                  height: 43.0,
                                                  decoration: BoxDecoration(),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController4,
                                                    focusNode: _model
                                                        .textFieldFocusNode4,
                                                    autofocus: false,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: 'Time',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'LTSuperior',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textAndStroke,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textAndStroke,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .whiteBlur,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  0.0,
                                                                  18.0,
                                                                  15.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                    maxLines: 2,
                                                    minLines: 1,
                                                    maxLength: 80,
                                                    buildCounter: (context,
                                                            {required currentLength,
                                                            required isFocused,
                                                            maxLength}) =>
                                                        null,
                                                    validator: _model
                                                        .textController4Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final _datePicked2Time =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.fromDateTime(
                                                            getCurrentTimestamp),
                                                    builder: (context, child) {
                                                      return wrapInMaterialTimePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'LTSuperior',
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );
                                                  if (_datePicked2Time !=
                                                      null) {
                                                    safeSetState(() {
                                                      _model.datePicked2 =
                                                          DateTime(
                                                        getCurrentTimestamp
                                                            .year,
                                                        getCurrentTimestamp
                                                            .month,
                                                        getCurrentTimestamp.day,
                                                        _datePicked2Time.hour,
                                                        _datePicked2Time.minute,
                                                      );
                                                    });
                                                  }
                                                  setState(() {
                                                    _model.textController4
                                                            ?.text =
                                                        dateTimeFormat('Hm',
                                                            _model.datePicked2);
                                                  });
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 43.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x03FFFFFF),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ],
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 146.0))
                            .addToEnd(SizedBox(height: 180.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add images ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.0, 0.0, 0.0),
                            child: Text(
                              'Images is the key for attractiveness of your event. Add at least 5 images. You can add or delete them later',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final imageslist = _model.images.toList();
                                    return ReorderableListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: imageslist.length,
                                      itemBuilder: (context, imageslistIndex) {
                                        final imageslistItem =
                                            imageslist[imageslistIndex];
                                        return Container(
                                          key: ValueKey("ListView_49cv8hjp" +
                                              '_' +
                                              imageslistIndex.toString()),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    imageslistItem,
                                                    width: double.infinity,
                                                    height: 233.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Opacity(
                                                  opacity: 0.9,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  20.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 20.0,
                                                        borderWidth: 0.0,
                                                        buttonSize: 30.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        icon: Icon(
                                                          Icons.close_rounded,
                                                          color: Colors.white,
                                                          size: 12.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.removeAtIndexFromImages(
                                                              imageslistIndex);
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      onReorder: (int reorderableOldIndex,
                                          int reorderableNewIndex) async {
                                        _model.reorder =
                                            await actions.reorderItems(
                                          _model.images.toList(),
                                          reorderableOldIndex,
                                          reorderableNewIndex,
                                        );
                                        _model.images = _model.reorder!
                                            .toList()
                                            .cast<String>();
                                        setState(() {});

                                        setState(() {});
                                      },
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 22.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 34.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia = await selectMedia(
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
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
                                    setState(() {
                                      _model.uploadedLocalFiles =
                                          selectedUploadedFiles;
                                      _model.uploadedFileUrls = downloadUrls;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }

                                _model.images = functions
                                    .imagesList(
                                        _model.uploadedFileUrls.toList(),
                                        _model.images.toList())
                                    .toList()
                                    .cast<String>();
                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 186.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .textAndStroke,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 28.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Add new images',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation']!,
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 146.0))
                            .addToEnd(SizedBox(height: 150.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  FFIcons.kphLockOpenLight,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 28.0,
                                ),
                              ),
                              Text(
                                'Open or closed',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.0, 0.0, 0.0),
                            child: Text(
                              'Choose “closed event” if you want to decide whom to join your event.  Users won\'t see information about date and location, until you allow them to become participants of the event',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 28.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isOpen = true;
                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: _model.isOpen
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .textAndStroke,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 24.0, 18.0, 24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        child: Visibility(
                                          visible: _model.isOpen,
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Container(
                                              width: 15.0,
                                              height: 15.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13.0, 0.0, 22.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Open event',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.2,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  'Anyone can take part in the open event. Participants just come to your event',
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
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.35,
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
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 14.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isOpen = false;
                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: !_model.isOpen
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .textAndStroke,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 24.0, 18.0, 24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        child: Visibility(
                                          visible: !_model.isOpen,
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Container(
                                              width: 15.0,
                                              height: 15.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13.0, 0.0, 22.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Closed event',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.2,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  'To become a participant in a closed event, someone must submit an application and wait for your approval of this application',
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
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.35,
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
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.khealthiconsMoneyBagOutline,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Payments',
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 7.0, 0.0, 0.0),
                                  child: Text(
                                    'Is this event free our requires some charges?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 7.0, 0.0, 0.0),
                                        child: Text(
                                          'This event is totally free',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.isFree) {
                                            _model.isFree = false;
                                            setState(() {});
                                          } else {
                                            _model.isFree = true;
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          width: 46.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: _model.isFree
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .textAndStroke,
                                            borderRadius:
                                                BorderRadius.circular(90.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 3.0, 5.0, 3.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (!_model.isFree)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      width: 15.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.isFree)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Container(
                                                      width: 15.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
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
                                if (!_model.isFree)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 18.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Price',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  1.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 43.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController5,
                                                          focusNode: _model
                                                              .textFieldFocusNode5,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController5',
                                                            Duration(
                                                                milliseconds:
                                                                    2),
                                                            () async {
                                                              setState(() {
                                                                _model.textController5
                                                                        ?.text =
                                                                    functions.newCustomFunction(_model
                                                                        .textController5
                                                                        .text);
                                                              });
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .sentences,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: '0\$',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'LTSuperior',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .textAndStroke,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textAndStroke,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .whiteBlur,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        18.0,
                                                                        0.0,
                                                                        18.0,
                                                                        0.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'LTSuperior',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                          maxLines: 2,
                                                          minLines: 1,
                                                          maxLength: 80,
                                                          buildCounter: (context,
                                                                  {required currentLength,
                                                                  required isFocused,
                                                                  maxLength}) =>
                                                              null,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .textController5Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 146.0))
                            .addToEnd(SizedBox(height: 180.0)),
                      ),
                    ),
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
                    height: 110.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).mainThemeBlur,
                    ),
                    child: Builder(
                      builder: (context) {
                        if (_model.pageViewCurrentIndex != 0) {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: 110.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(360.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            LinearPercentIndicator(
                                              percent:
                                                  _model.pageViewCurrentIndex >=
                                                          1
                                                      ? 1.0
                                                      : 0.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.3,
                                              lineHeight: 7.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  Color(0x82A3A3B3),
                                              padding: EdgeInsets.zero,
                                            ),
                                            Container(
                                              width: 4.0,
                                              height: 7.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent:
                                                    _model.pageViewCurrentIndex >=
                                                            2
                                                        ? 1.0
                                                        : 0.0,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.28,
                                                lineHeight: 7.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0x82A3A3B3),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                            Container(
                                              width: 4.0,
                                              height: 7.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent:
                                                    _model.pageViewCurrentIndex >=
                                                            3
                                                        ? 1.0
                                                        : 0.0,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.3,
                                                lineHeight: 7.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0x82A3A3B3),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Opacity(
                                          opacity:
                                              _model.pageViewCurrentIndex != 0
                                                  ? 1.0
                                                  : 0.001,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 15.0, 20.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (_model
                                                          .pageViewCurrentIndex ==
                                                      1) {
                                                    await _model
                                                        .pageViewController
                                                        ?.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  } else {
                                                    await _model
                                                        .pageViewController
                                                        ?.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  }
                                                },
                                                text: 'Back',
                                                options: FFButtonOptions(
                                                  width: 80.0,
                                                  height: 43.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 12.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00007AFF),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textAndStroke,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model:
                                                  _model.buttonFixedSizeModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: ButtonFixedSizeWidget(
                                                width: 150.0,
                                                height: 43.0,
                                                buttonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                text: 'Next',
                                                fontsize: 16,
                                                textcolor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                showLoadingIndicator: false,
                                                action: () async {
                                                  if (_model
                                                          .pageViewCurrentIndex !=
                                                      3) {
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  } else {
                                                    if (widget.event != null) {
                                                      unawaited(
                                                        () async {
                                                          await widget
                                                              .event!.reference
                                                              .update(
                                                                  createEventsRecordData(
                                                            eventInfo:
                                                                updateEventStruct(
                                                              EventStruct(
                                                                isOpen: _model
                                                                    .isOpen,
                                                                title: _model
                                                                    .textController1
                                                                    .text,
                                                                description: _model
                                                                    .textController2
                                                                    .text,
                                                                images: _model
                                                                    .images,
                                                                location: _model
                                                                    .placePickerValue
                                                                    .latLng,
                                                                locationTitle:
                                                                    _model
                                                                        .placePickerValue
                                                                        .name,
                                                                startDate: _model
                                                                    .datePicked1,
                                                                startTime: _model
                                                                    .datePicked2,
                                                                price: int.tryParse(_model
                                                                    .textController5
                                                                    .text
                                                                    .substring(
                                                                        1)),
                                                                isFree: _model
                                                                    .isFree,
                                                              ),
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                            user:
                                                                currentUserReference,
                                                            project: widget
                                                                .company
                                                                ?.reference,
                                                            customId:
                                                                _model.customID,
                                                          ));
                                                        }(),
                                                      );
                                                      FFAppState()
                                                          .clearEventsProfileCache();
                                                      unawaited(
                                                        () async {
                                                          await DocumentsTable()
                                                              .delete(
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'firebase_id',
                                                              widget.event
                                                                  ?.customId,
                                                            ),
                                                          );
                                                        }(),
                                                      );
                                                      await UpsertVectorsNeightnCall
                                                          .call(
                                                        upsertText: functions
                                                            .stringToAPI(
                                                                'firebase_id: ${_model.customID}, title: ${_model.textController1.text} , description: ${_model.textController2.text}, start date${_model.textController3.text}, start time: ${_model.textController4.text}, price: ${_model.isFree ? 'event is free' : _model.textController5.text}'),
                                                        ownerType: 'user',
                                                        owner: currentUserUid,
                                                        documentId:
                                                            _model.customID,
                                                      );
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500));
                                                      unawaited(
                                                        () async {
                                                          await DocumentsTable()
                                                              .update(
                                                            data: {
                                                              'firebase_id':
                                                                  widget.event
                                                                      ?.customId,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'content',
                                                              functions.stringToAPI(
                                                                  'firebase_id: ${_model.customID}, title: ${_model.textController1.text} , description: ${_model.textController2.text}, start date${_model.textController3.text}, start time: ${_model.textController4.text}, price: ${_model.isFree ? 'event is free' : _model.textController5.text}'),
                                                            ),
                                                          );
                                                        }(),
                                                      );
                                                      _model.event2 =
                                                          await EventsRecord
                                                              .getDocumentOnce(
                                                                  widget.event!
                                                                      .reference);

                                                      context.pushNamed(
                                                        'event_page',
                                                        queryParameters: {
                                                          'events':
                                                              serializeParam(
                                                            _model.event2,
                                                            ParamType.Document,
                                                          ),
                                                          'isFrom':
                                                              serializeParam(
                                                            'create event',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'events':
                                                              _model.event2,
                                                        },
                                                      );
                                                    } else {
                                                      FFAppState()
                                                          .clearEventsProfileCache();
                                                      _model.customID =
                                                          random_data
                                                              .randomString(
                                                        8,
                                                        8,
                                                        true,
                                                        true,
                                                        true,
                                                      );
                                                      setState(() {});

                                                      var eventsRecordReference2 =
                                                          EventsRecord
                                                              .collection
                                                              .doc();
                                                      await eventsRecordReference2
                                                          .set({
                                                        ...createEventsRecordData(
                                                          eventInfo:
                                                              updateEventStruct(
                                                            EventStruct(
                                                              isOpen:
                                                                  _model.isOpen,
                                                              title: _model
                                                                  .textController1
                                                                  .text,
                                                              description: _model
                                                                  .textController2
                                                                  .text,
                                                              images:
                                                                  _model.images,
                                                              location: _model
                                                                  .placePickerValue
                                                                  .latLng,
                                                              locationTitle: _model
                                                                  .placePickerValue
                                                                  .name,
                                                              startDate: _model
                                                                  .datePicked1,
                                                              startTime: _model
                                                                  .datePicked2,
                                                              price: int.tryParse(
                                                                  _model
                                                                      .textController5
                                                                      .text
                                                                      .substring(
                                                                          1)),
                                                              isFree:
                                                                  _model.isFree,
                                                            ),
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                          user:
                                                              currentUserReference,
                                                          isFinished: true,
                                                          customId:
                                                              _model.customID,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'participants': [
                                                              currentUserReference
                                                            ],
                                                          },
                                                        ),
                                                      });
                                                      _model.event = EventsRecord
                                                          .getDocumentFromData({
                                                        ...createEventsRecordData(
                                                          eventInfo:
                                                              updateEventStruct(
                                                            EventStruct(
                                                              isOpen:
                                                                  _model.isOpen,
                                                              title: _model
                                                                  .textController1
                                                                  .text,
                                                              description: _model
                                                                  .textController2
                                                                  .text,
                                                              images:
                                                                  _model.images,
                                                              location: _model
                                                                  .placePickerValue
                                                                  .latLng,
                                                              locationTitle: _model
                                                                  .placePickerValue
                                                                  .name,
                                                              startDate: _model
                                                                  .datePicked1,
                                                              startTime: _model
                                                                  .datePicked2,
                                                              price: int.tryParse(
                                                                  _model
                                                                      .textController5
                                                                      .text
                                                                      .substring(
                                                                          1)),
                                                              isFree:
                                                                  _model.isFree,
                                                            ),
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                          user:
                                                              currentUserReference,
                                                          isFinished: true,
                                                          customId:
                                                              _model.customID,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'participants': [
                                                              currentUserReference
                                                            ],
                                                          },
                                                        ),
                                                      }, eventsRecordReference2);
                                                      unawaited(
                                                        () async {
                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'events': FieldValue
                                                                    .arrayUnion([
                                                                  _model.event
                                                                      ?.reference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }(),
                                                      );
                                                      await UpsertVectorsNeightnCall
                                                          .call(
                                                        upsertText: functions
                                                            .stringToAPI(
                                                                'firebase_id: ${_model.customID}, title: ${_model.textController1.text} , description: ${_model.textController2.text}, start date${_model.textController3.text}, start time: ${_model.textController4.text}, price: ${_model.isFree ? 'event is free' : _model.textController5.text}'),
                                                        ownerType: 'user',
                                                        owner: currentUserUid,
                                                        documentId:
                                                            _model.customID,
                                                      );
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500));
                                                      unawaited(
                                                        () async {
                                                          await DocumentsTable()
                                                              .update(
                                                            data: {
                                                              'firebase_id':
                                                                  _model
                                                                      .customID,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'content',
                                                              functions.stringToAPI(
                                                                  'firebase_id: ${_model.customID}, title: ${_model.textController1.text} , description: ${_model.textController2.text}, start date${_model.textController3.text}, start time: ${_model.textController4.text}, price: ${_model.isFree ? 'event is free' : _model.textController5.text}'),
                                                            ),
                                                          );
                                                        }(),
                                                      );

                                                      context.pushNamed(
                                                        'event_page',
                                                        queryParameters: {
                                                          'events':
                                                              serializeParam(
                                                            _model.event,
                                                            ParamType.Document,
                                                          ),
                                                          'isFrom':
                                                              serializeParam(
                                                            'create event',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'events':
                                                              _model.event,
                                                        },
                                                      );
                                                    }
                                                  }

                                                  setState(() {});
                                                },
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
                          );
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 50.0),
                              child: Container(
                                width: double.infinity,
                                height: 49.0,
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.buttonInfinityModel,
                                  updateCallback: () => setState(() {}),
                                  child: ButtonInfinityWidget(
                                    width: 458.0,
                                    height: 49.0,
                                    buttonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    text: 'Start',
                                    fontsize: 16,
                                    textcolor:
                                        FlutterFlowTheme.of(context).info,
                                    action: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            if (_model.pageViewCurrentIndex == 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 52.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).textAndStroke,
                  borderRadius: 10.0,
                  borderWidth: 1.0,
                  buttonSize: 42.0,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 25.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ),
            if (_model.pageViewCurrentIndex >= 1)
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15.0,
                    sigmaY: 15.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 102.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).mainThemeBlur,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 15.0, 0.0, 17.0),
                            child: wrapWithModel(
                              model: _model.buttonFixedSizeModel2,
                              updateCallback: () => setState(() {}),
                              child: ButtonFixedSizeWidget(
                                width: 130.0,
                                height: 38.0,
                                buttonColor:
                                    FlutterFlowTheme.of(context).primary,
                                text: 'Save and close',
                                fontsize: 14,
                                textcolor: Colors.white,
                                showLoadingIndicator: false,
                                action: () async {
                                  var eventsRecordReference =
                                      EventsRecord.collection.doc();
                                  await eventsRecordReference.set({
                                    ...createEventsRecordData(
                                      eventInfo: updateEventStruct(
                                        EventStruct(
                                          isOpen: _model.isOpen,
                                          title: _model.textController1.text,
                                          description:
                                              _model.textController2.text,
                                          images: _model.images,
                                          location:
                                              _model.placePickerValue.latLng,
                                          locationTitle:
                                              _model.placePickerValue.name,
                                          startDate: _model.datePicked1,
                                          startTime: _model.datePicked2,
                                          price: int.tryParse(_model
                                              .textController5.text
                                              .substring(
                                                  0,
                                                  _model.textController5.text
                                                          .length -
                                                      1)),
                                        ),
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                      user: currentUserReference,
                                      isFinished: true,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'participants': [currentUserReference],
                                      },
                                    ),
                                  });
                                  _model.eventCopy =
                                      EventsRecord.getDocumentFromData({
                                    ...createEventsRecordData(
                                      eventInfo: updateEventStruct(
                                        EventStruct(
                                          isOpen: _model.isOpen,
                                          title: _model.textController1.text,
                                          description:
                                              _model.textController2.text,
                                          images: _model.images,
                                          location:
                                              _model.placePickerValue.latLng,
                                          locationTitle:
                                              _model.placePickerValue.name,
                                          startDate: _model.datePicked1,
                                          startTime: _model.datePicked2,
                                          price: int.tryParse(_model
                                              .textController5.text
                                              .substring(
                                                  0,
                                                  _model.textController5.text
                                                          .length -
                                                      1)),
                                        ),
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                      user: currentUserReference,
                                      isFinished: true,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'participants': [currentUserReference],
                                      },
                                    ),
                                  }, eventsRecordReference);
                                  context.safePop();

                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.15,
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
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
    );
  }
}
