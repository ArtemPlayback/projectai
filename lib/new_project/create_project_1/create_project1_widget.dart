import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'create_project1_model.dart';
export 'create_project1_model.dart';

class CreateProject1Widget extends StatefulWidget {
  const CreateProject1Widget({super.key});

  @override
  State<CreateProject1Widget> createState() => _CreateProject1WidgetState();
}

class _CreateProject1WidgetState extends State<CreateProject1Widget> {
  late CreateProject1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProject1Model());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
                              31.0, 0.0, 90.0, 0.0),
                          child: Text(
                            'Create company with OMNIS',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  fontSize: 35.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
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
                            'Project\'s name',
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
                                      hintText: 'Project\'s title',
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
                            'Two words about project',
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
                              'Share your project in 15 words so people quickly understand what your company does',
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
                                      hintText: 'Short description',
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
                                              18.0, 15.0, 18.0, 15.0),
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
                                    minLines: 2,
                                    maxLength: 75,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ],
                              ),
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
                            'Project\'s description',
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
                              'Tell us about the advantages of your company - that\'s how people learn about what you do',
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
                              decoration: BoxDecoration(),
                              child: Stack(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                children: [
                                  TextFormField(
                                    controller: _model.textController3,
                                    focusNode: _model.textFieldFocusNode3,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Project\'s description',
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
                                              18.0, 15.0, 18.0, 15.0),
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
                                    maxLines: 10,
                                    minLines: 6,
                                    maxLength: 80,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    validator: _model.textController3Validator
                                        .asValidator(context),
                                  ),
                                ],
                              ),
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
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent:
                                                    _model.pageViewCurrentIndex >=
                                                            1
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 15.0, 20.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await _model.pageViewController
                                                    ?.previousPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              text: 'Back',
                                              options: FFButtonOptions(
                                                width: 110.0,
                                                height: 43.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 12.0, 10.0, 12.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0x00007AFF),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'LTSuperior',
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
                                                  color: Color(0x1B000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              showLoadingIndicator: false,
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
                                                text:
                                                    _model.pageViewCurrentIndex ==
                                                            2
                                                        ? 'Save'
                                                        : 'Next',
                                                fontsize: 14,
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
                                                    var projectsRecordReference =
                                                        ProjectsRecord
                                                            .collection
                                                            .doc();
                                                    await projectsRecordReference
                                                        .set({
                                                      ...createProjectsRecordData(
                                                        user:
                                                            currentUserReference,
                                                        title: _model
                                                            .textController1
                                                            .text,
                                                        projectInformation:
                                                            updateProjectInformationStruct(
                                                          ProjectInformationStruct(
                                                            description: _model
                                                                .textController2
                                                                .text,
                                                            shortDescription: _model
                                                                .textController2
                                                                .text,
                                                          ),
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        mainImage:
                                                            'https://firebasestorage.googleapis.com/v0/b/project-e33e5.appspot.com/o/placeholder%20company.png?alt=media&token=2808caf2-01cb-4434-9d4c-3f16d9ebfab5',
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'team': [
                                                            getTeamMemberFirestoreData(
                                                              updateTeamMemberStruct(
                                                                TeamMemberStruct(
                                                                  userReference:
                                                                      currentUserReference,
                                                                  role: 'Owner',
                                                                  description:
                                                                      'Owner of this company',
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              true,
                                                            )
                                                          ],
                                                        },
                                                      ),
                                                    });
                                                    _model.project =
                                                        ProjectsRecord
                                                            .getDocumentFromData({
                                                      ...createProjectsRecordData(
                                                        user:
                                                            currentUserReference,
                                                        title: _model
                                                            .textController1
                                                            .text,
                                                        projectInformation:
                                                            updateProjectInformationStruct(
                                                          ProjectInformationStruct(
                                                            description: _model
                                                                .textController2
                                                                .text,
                                                            shortDescription: _model
                                                                .textController2
                                                                .text,
                                                          ),
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        mainImage:
                                                            'https://firebasestorage.googleapis.com/v0/b/project-e33e5.appspot.com/o/placeholder%20company.png?alt=media&token=2808caf2-01cb-4434-9d4c-3f16d9ebfab5',
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'team': [
                                                            getTeamMemberFirestoreData(
                                                              updateTeamMemberStruct(
                                                                TeamMemberStruct(
                                                                  userReference:
                                                                      currentUserReference,
                                                                  role: 'Owner',
                                                                  description:
                                                                      'Owner of this company',
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              true,
                                                            )
                                                          ],
                                                        },
                                                      ),
                                                    }, projectsRecordReference);
                                                    FFAppState()
                                                        .clearProjectsProfileCache();
                                                    unawaited(
                                                      () async {
                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'projects':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model.project
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }(),
                                                    );

                                                    context.pushNamed(
                                                      'company_page',
                                                      queryParameters: {
                                                        'company':
                                                            serializeParam(
                                                          _model.project,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'company':
                                                            _model.project,
                                                      },
                                                    );
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
                                    width: 450.0,
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
                  borderColor: FlutterFlowTheme.of(context).thirdText,
                  borderRadius: 10.0,
                  borderWidth: 1.0,
                  buttonSize: 42.0,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).thirdText,
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
                    sigmaY: 2.0,
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
                                  context.safePop();
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
