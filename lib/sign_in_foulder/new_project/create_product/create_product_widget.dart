import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/form_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'create_product_model.dart';
export 'create_product_model.dart';

class CreateProductWidget extends StatefulWidget {
  const CreateProductWidget({
    super.key,
    this.company,
  });

  final ProjectsRecord? company;

  @override
  State<CreateProductWidget> createState() => _CreateProductWidgetState();
}

class _CreateProductWidgetState extends State<CreateProductWidget>
    with TickerProviderStateMixin {
  late CreateProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProductModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.customID = random_data.randomString(
        12,
        12,
        true,
        false,
        true,
      );
      setState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: '\$');
    _model.textFieldFocusNode3 ??= FocusNode();

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
    context.watch<FFAppState>();

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
                  Visibility(
                    visible: !kDebugMode,
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                31.0, 0.0, 120.0, 0.0),
                            child: Text(
                              'Publish your product ',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13.0, 0.0, 22.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tell us about the product',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.2,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  'Provide the key details, such as title, description and price',
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
                                    'assets/images/dimageenko_Sleek_illustration_of_a_person_with_VR_headset_on_ge_29645712-8714-49e0-9c83-576b5e18f45a.png',
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
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  31.0, 15.0, 0.0, 25.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    13.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Our AI will help you',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Our AI will ask you a few questions to gather additional information about the product',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                      'assets/images/dimageenko_Simple_illustration_of_a_friendly_AI_avatar_on_a_pur_8b5798e1-d149-452b-85e1-437ad86bf07e.png',
                                      width: 120.0,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(-1.0, 0.0),
                                    ),
                                  ),
                                ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13.0, 0.0, 22.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Lay the cards on the table',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  'The more you describe your product, the better it is for its promotion in smart search',
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
                                    'assets/images/image_63.png',
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
                  ),
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
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
                                    'Images is the key for attractiveness of your product. Add at least 5 images. You can add or delete them later',
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
                                          final imageslist =
                                              _model.images.toList();
                                          return ReorderableListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: imageslist.length,
                                            itemBuilder:
                                                (context, imageslistIndex) {
                                              final imageslistItem =
                                                  imageslist[imageslistIndex];
                                              return Container(
                                                key: ValueKey(
                                                    "ListView_kci6k88w" +
                                                        '_' +
                                                        imageslistIndex
                                                            .toString()),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child: Image.network(
                                                          imageslistItem,
                                                          width:
                                                              double.infinity,
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
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 0.0,
                                                              buttonSize: 30.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              icon: Icon(
                                                                Icons
                                                                    .close_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 12.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
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
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
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
                                            _model.uploadedFileUrls =
                                                downloadUrls;
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .textAndStroke,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 45.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.add_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 28.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Add new images',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
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
                              ].addToStart(SizedBox(height: 146.0)),
                            ),
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 150.0)),
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
                            'Tell us about your product',
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
                              'Remember: the more you tell us, the better for product\'s promotion',
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
                                      hintText: 'Product title',
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
                                0.0, 13.0, 0.0, 0.0),
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
                                      hintText: 'Product description',
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
                                    maxLines: 8,
                                    maxLength: 3000,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
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
                                        'Price',
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
                                      0.0, 15.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController3,
                                    focusNode: _model.textFieldFocusNode3,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController3',
                                      Duration(milliseconds: 1),
                                      () async {
                                        setState(() {
                                          _model.textController3?.text =
                                              functions.newCustomFunction(
                                                  _model.textController3.text);
                                          _model.textController3?.selection =
                                              TextSelection.collapsed(
                                                  offset: _model
                                                      .textController3!
                                                      .text
                                                      .length);
                                        });
                                      },
                                    ),
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Product price',
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
                                    keyboardType: TextInputType.number,
                                    validator: _model.textController3Validator
                                        .asValidator(context),
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional(0.0, 0.7),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Lottie.network(
                              'https://lottie.host/3ef6e011-d3b7-4302-bfa7-b8aff4341487/FT4UOUhvQH.json',
                              width: 420.0,
                              height: 420.0,
                              fit: BoxFit.cover,
                              animate: true,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Text(
                              'AI is creating questions...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                            'Tell us about your product',
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
                              'Remember: the more you tell us, the better for product\'s promotion',
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
                                0.0, 13.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final questionsForm = _model.questions.toList();
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(questionsForm.length,
                                      (questionsFormIndex) {
                                    final questionsFormItem =
                                        questionsForm[questionsFormIndex];
                                    return FormItemWidget(
                                      key: Key(
                                          'Keyejj_${questionsFormIndex}_of_${questionsForm.length}'),
                                      index: questionsFormIndex,
                                      question: QuestionsStruct.maybeFromMap(
                                          questionsFormItem)!,
                                      updatePagestate: () async {
                                        _model.questions = FFAppState()
                                            .questions
                                            .map((e) => e.toMap())
                                            .toList()
                                            .cast<dynamic>();
                                        setState(() {});
                                      },
                                    );
                                  }).divide(SizedBox(height: 40.0)),
                                );
                              },
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
                          return Visibility(
                            visible: _model.pageViewCurrentIndex != 3,
                            child: Align(
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
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.233,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                          0.2,
                                                  lineHeight: 7.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                          0.2,
                                                  lineHeight: 7.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              Expanded(
                                                child: LinearPercentIndicator(
                                                  percent:
                                                      _model.pageViewCurrentIndex >=
                                                              4
                                                          ? 1.0
                                                          : 0.0,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.233,
                                                  lineHeight: 7.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          if (_model.pageViewCurrentIndex != 0)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 15.0, 20.0, 0.0),
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
                                                    width: 130.0,
                                                    height: 43.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                12.0,
                                                                10.0,
                                                                12.0),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  showLoadingIndicator: false,
                                                ),
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .buttonFixedSizeModel1,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: ButtonFixedSizeWidget(
                                                  width: 150.0,
                                                  height: 43.0,
                                                  buttonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  text: 'Next',
                                                  fontsize: 16,
                                                  textcolor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  showLoadingIndicator: false,
                                                  action: () async {
                                                    if (_model
                                                            .pageViewCurrentIndex ==
                                                        2) {
                                                      unawaited(
                                                        () async {
                                                          await _model
                                                              .pageViewController
                                                              ?.nextPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        }(),
                                                      );
                                                      _model.apiResultm5h =
                                                          await CreateProductsGroup
                                                              .createQuestionsCall
                                                              .call(
                                                        question: functions
                                                            .stringToAPI(
                                                                'product title: ${_model.textController1.text}, product description: ${_model.textController2.text}, product\'s price: ${_model.textController3.text}'),
                                                      );

                                                      if ((_model.apiResultm5h
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.response =
                                                            getJsonField(
                                                          (_model.apiResultm5h
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.text''',
                                                        ).toString();
                                                        setState(() {});
                                                        _model.questions =
                                                            functions
                                                                .cleanJson(
                                                                    getJsonField(
                                                                  (_model.apiResultm5h
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.text''',
                                                                ).toString())
                                                                .toList()
                                                                .cast<
                                                                    dynamic>();
                                                        setState(() {});
                                                        FFAppState().questions = _model
                                                            .questions
                                                            .map((e) =>
                                                                QuestionsStruct
                                                                    .maybeFromMap(
                                                                        e))
                                                            .withoutNulls
                                                            .toList()
                                                            .cast<
                                                                QuestionsStruct>();
                                                        setState(() {});
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      }
                                                    } else if (_model
                                                            .pageViewCurrentIndex ==
                                                        4) {
                                                      if (FFAppState()
                                                              .questions
                                                              .where((e) =>
                                                                  e.type ==
                                                                  'color')
                                                              .toList()
                                                              .length >
                                                          0) {
                                                        FFAppState()
                                                            .removeFromQuestions(
                                                                FFAppState()
                                                                    .questions
                                                                    .where((e) =>
                                                                        e.type ==
                                                                        'color')
                                                                    .toList()
                                                                    .first);
                                                        setState(() {});
                                                      }

                                                      var productsRecordReference =
                                                          ProductsRecord
                                                              .collection
                                                              .doc();
                                                      await productsRecordReference
                                                          .set({
                                                        ...createProductsRecordData(
                                                          title: _model
                                                              .textController1
                                                              .text,
                                                          description: _model
                                                              .textController2
                                                              .text,
                                                          price: int.tryParse(
                                                              _model
                                                                  .textController3
                                                                  .text
                                                                  .substring(
                                                                      1)),
                                                          ownerPerson:
                                                              currentUserReference,
                                                          customId:
                                                              _model.customID,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'images': _model
                                                                    .images
                                                                    .isNotEmpty
                                                                ? _model.images
                                                                : _model
                                                                    .fakeImages,
                                                            'Colors':
                                                                FFAppState()
                                                                    .colors,
                                                          },
                                                        ),
                                                      });
                                                      _model.createdProduct =
                                                          ProductsRecord
                                                              .getDocumentFromData({
                                                        ...createProductsRecordData(
                                                          title: _model
                                                              .textController1
                                                              .text,
                                                          description: _model
                                                              .textController2
                                                              .text,
                                                          price: int.tryParse(
                                                              _model
                                                                  .textController3
                                                                  .text
                                                                  .substring(
                                                                      1)),
                                                          ownerPerson:
                                                              currentUserReference,
                                                          customId:
                                                              _model.customID,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'images': _model
                                                                    .images
                                                                    .isNotEmpty
                                                                ? _model.images
                                                                : _model
                                                                    .fakeImages,
                                                            'Colors':
                                                                FFAppState()
                                                                    .colors,
                                                          },
                                                        ),
                                                      }, productsRecordReference);
                                                      FFAppState()
                                                          .clearProjectsProfileCache();
                                                      unawaited(
                                                        () async {
                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'products':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  _model
                                                                      .createdProduct
                                                                      ?.reference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }(),
                                                      );
                                                      _model.questions =
                                                          FFAppState()
                                                              .questions
                                                              .map((e) =>
                                                                  e.toMap())
                                                              .toList()
                                                              .cast<dynamic>();
                                                      setState(() {});
                                                      _model.questions = functions
                                                          .removeKeysFromJsonList(
                                                              _model.questions
                                                                  .toList())
                                                          .toList()
                                                          .cast<dynamic>();
                                                      setState(() {});
                                                      FFAppState().colors = [];
                                                      FFAppState().questions =
                                                          [];
                                                      setState(() {});

                                                      context.pushNamed(
                                                        'create_product_loading',
                                                        queryParameters: {
                                                          'document':
                                                              serializeParam(
                                                            _model
                                                                .createdProduct,
                                                            ParamType.Document,
                                                          ),
                                                          'answers':
                                                              serializeParam(
                                                            _model.questions,
                                                            ParamType.JSON,
                                                            isList: true,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'document': _model
                                                              .createdProduct,
                                                        },
                                                      );
                                                    } else {
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
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
                                    width: 529.0,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 52.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Visibility(
                    visible: _model.pageViewCurrentIndex == 0,
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).thirdText,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      buttonSize: 42.0,
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
                ),
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
                                width: 140.0,
                                height: 40.0,
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
