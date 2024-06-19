import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_model.dart';
export 'product_card_model.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    this.explanation,
    required this.isFrom,
  });

  final ProductsRecord? product;
  final String? explanation;
  final String? isFrom;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late ProductCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'product_page',
          queryParameters: {
            'product': serializeParam(
              widget.product,
              ParamType.Document,
            ),
            'isFrom': serializeParam(
              'profile',
              ParamType.String,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'product': widget.product,
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Builder(
                    builder: (context) {
                      final images = widget.product?.images?.toList() ?? [];
                      return Container(
                        width: double.infinity,
                        height: 280.0,
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
                                return ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image.network(
                                    imagesItem,
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
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
                                  effect: smooth_page_indicator.SlideEffect(
                                    spacing: 7.0,
                                    radius: 16.0,
                                    dotWidth: 8.0,
                                    dotHeight: 8.0,
                                    dotColor: Color(0x4CFFFFFF),
                                    activeDotColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
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
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => wrapWithModel(
                          model: _model.toggleModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: ToggleWidget(
                            boolean: (currentUserDocument?.saved?.toList() ??
                                        [])
                                    .where((e) =>
                                        e.products == widget.product?.reference)
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
                                                products:
                                                    widget.product?.reference,
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
                                                products:
                                                    widget.product?.reference,
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
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.product?.title,
                          'title',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 17.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            child: Text(
                              '\$${widget.product?.price?.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 6.0, 20.0, 20.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.explanation != null && widget.explanation != ''
                          ? widget.explanation
                          : widget.product?.description,
                      'zcx',
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
