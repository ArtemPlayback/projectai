import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/expandable_text_widget.dart';
import '/components/image_slider_widget.dart';
import '/components/map_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_fixed_size/button_fixed_size_widget.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_page_model.dart';
export 'product_page_model.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    super.key,
    required this.product,
    required this.isFrom,
  });

  final ProductsRecord? product;
  final String? isFrom;

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  late ProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.product?.ownerPerson != null) {
        _model.ownerUser =
            await UsersRecord.getDocumentOnce(widget.product!.ownerPerson!);
        _model.isOwnerUser = true;
        setState(() {});
      } else {
        _model.ownerCompany =
            await ProjectsRecord.getDocumentOnce(widget.product!.ownerCompany!);
        _model.isOwnerUser = false;
        setState(() {});
      }
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        final images = widget.product?.images?.toList() ?? [];
                        return Container(
                          width: double.infinity,
                          height: 380.0,
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage:
                                            max(0, min(0, images.length - 1))),
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
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Container(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  child: ImageSliderWidget(
                                                    images:
                                                        widget.product!.images,
                                                    initialindex: imagesIndex,
                                                    isThisYours: false,
                                                    product: widget.product,
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
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: max(
                                                0, min(0, images.length - 1))),
                                    count: images.length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!
                                          .animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 6.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 22.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 42.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.product?.title,
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
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          wrapWithModel(
                            model: _model.expandableTextModel,
                            updateCallback: () => setState(() {}),
                            child: ExpandableTextWidget(
                              parameter1: valueOrDefault<String>(
                                widget.product?.description,
                                'info',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 30.0, 20.0, 25.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.isOwnerUser) {
                            context.pushNamed(
                              'user_page',
                              queryParameters: {
                                'user': serializeParam(
                                  _model.ownerUser,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'user': _model.ownerUser,
                              },
                            );
                          } else {
                            context.pushNamed(
                              'company_page',
                              queryParameters: {
                                'company': serializeParam(
                                  _model.ownerCompany,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'company': _model.ownerCompany,
                              },
                            );
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FutureBuilder<UsersRecord>(
                              future: UsersRecord.getDocumentOnce(
                                  widget.product!.ownerPerson!),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final rowUsersRecord = snapshot.data!;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(360.0),
                                      child: Image.network(
                                        rowUsersRecord.photoUrl,
                                        width: 47.0,
                                        height: 47.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          11.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            rowUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'LTSuperior',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Text(
                                            'Product owner',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'LTSuperior',
                                                  color: Color(0x89000000),
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 3.0)),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 26.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (false == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
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
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        17.0, 0.0, 17.0, 0.0),
                                                child: Text(
                                                  '12%',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                      'The AI\'s response has successfully condensed the product information into a more structured and straightforward format. However, there\'s still room for improvement to ensure the content is as factual and engaging as possible. Here\'s what could be changed',
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
                          if (false == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9FA),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .textAndStroke,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ask AI about product',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.2,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Chatbot that can answer your questions faster than owner!',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            Color(0xBF1D1D20),
                                                        fontSize: 15.0,
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
                                                      .buttonFixedSizeModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: ButtonFixedSizeWidget(
                                                    width: 220.0,
                                                    height: 40.0,
                                                    buttonColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    text: 'Start chatting',
                                                    fontsize: 16,
                                                    textcolor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    showLoadingIndicator: false,
                                                    action: () async {},
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Rectangle_41654.jpg',
                                          width: 173.0,
                                          height: 189.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if ((widget.product?.colors != null &&
                                  (widget.product?.colors)!.isNotEmpty) ==
                              true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Colors',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final colors =
                                            widget.product?.colors?.toList() ??
                                                [];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(colors.length,
                                              (colorsIndex) {
                                            final colorsItem =
                                                colors[colorsIndex];
                                            return Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: colorsItem,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        360.0),
                                              ),
                                            );
                                          }).divide(SizedBox(width: 8.0)),
                                        );
                                      },
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
                          20.0, 30.0, 20.0, 20.0),
                      child: Builder(
                        builder: (context) {
                          final blocks =
                              widget.product?.productInfo?.toList() ?? [];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(blocks.length, (blocksIndex) {
                              final blocksItem = blocks[blocksIndex];
                              return Builder(
                                builder: (context) {
                                  if (blocksItem.type == 'text') {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              blocksItem.title,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    color: Color(0xF6C6C6D5),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                blocksItem.text,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else if (blocksItem.type == 'dots_list') {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              blocksItem.title,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final list =
                                                      blocksItem.list.toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: List.generate(
                                                        list.length,
                                                        (listIndex) {
                                                      final listItem =
                                                          list[listIndex];
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 5.0,
                                                            height: 5.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                listItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'LTSuperior',
                                                                      color: Color(
                                                                          0xBF1D1D20),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }).divide(
                                                        SizedBox(height: 6.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else if (blocksItem.type == 'options') {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          blocksItem.title,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final options =
                                                    blocksItem.options.toList();
                                                return Wrap(
                                                  spacing: 8.0,
                                                  runSpacing: 8.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      options.length,
                                                      (optionsIndex) {
                                                    final optionsItem =
                                                        options[optionsIndex];
                                                    return Container(
                                                      height: 33.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          17.0,
                                                                          0.0,
                                                                          17.0,
                                                                          0.0),
                                                              child: Text(
                                                                optionsItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'LTSuperior',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
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
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else if (blocksItem.type == 'location') {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          blocksItem.title,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            blocksItem.text,
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
                                        MapWidget(
                                          key: Key(
                                              'Keygfj_${blocksIndex}_of_${blocks.length}'),
                                          parameter1: blocksItem.location,
                                          address: blocksItem.address,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          blocksItem.title,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              );
                            }).divide(SizedBox(height: 30.0)),
                          );
                        },
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 100.0)),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10.0,
                        sigmaY: 10.0,
                      ),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 35.0,
                        fillColor: Color(0x34000000),
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          if (widget.isFrom == 'create') {
                            context.pushNamed('profile');
                          } else {
                            context.safePop();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10.0,
                        sigmaY: 10.0,
                      ),
                      child: Visibility(
                        visible: (widget.product?.ownerPerson ==
                                currentUserReference) ||
                            (currentUserReference == _model.ownerCompany?.user),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 10.0,
                          borderWidth: 1.0,
                          buttonSize: 35.0,
                          fillColor: Color(0x34000000),
                          icon: Icon(
                            Icons.keyboard_control,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              'product_settings',
                              queryParameters: {
                                'product': serializeParam(
                                  widget.product,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'product': widget.product,
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
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
                              color: FlutterFlowTheme.of(context).textAndStroke,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$${widget.product?.price?.toString()}',
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 3.0, 0.0, 0.0),
                                    child: Text(
                                      'per item',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
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
                                          FlutterFlowTheme.of(context).primary,
                                      text: (widget.product?.ownerPerson ==
                                                  currentUserReference) ||
                                              (currentUserReference ==
                                                  _model.ownerCompany?.user)
                                          ? 'Edit'
                                          : 'Message',
                                      fontsize: 16,
                                      textcolor:
                                          FlutterFlowTheme.of(context).info,
                                      showLoadingIndicator: false,
                                      action: () async {
                                        if ((widget.product?.ownerPerson ==
                                                currentUserReference) ||
                                            (currentUserReference ==
                                                _model.ownerCompany?.user)) {
                                          context.pushNamed(
                                            'product_settings',
                                            queryParameters: {
                                              'product': serializeParam(
                                                widget.product,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'product': widget.product,
                                            },
                                          );
                                        } else {
                                          if (widget.product?.ownerPerson !=
                                              null) {
                                            context.pushNamed(
                                              'chat_page',
                                              queryParameters: {
                                                'user': serializeParam(
                                                  _model.ownerUser,
                                                  ParamType.Document,
                                                ),
                                                'product': serializeParam(
                                                  widget.product,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'user': _model.ownerUser,
                                                'product': widget.product,
                                              },
                                            );
                                          } else {
                                            context.pushNamed(
                                              'chat_page',
                                              queryParameters: {
                                                'product': serializeParam(
                                                  widget.product,
                                                  ParamType.Document,
                                                ),
                                                'company': serializeParam(
                                                  _model.ownerCompany,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'product': widget.product,
                                                'company': _model.ownerCompany,
                                              },
                                            );
                                          }
                                        }
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
    );
  }
}
