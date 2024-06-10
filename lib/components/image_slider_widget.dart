import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'image_slider_model.dart';
export 'image_slider_model.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({
    super.key,
    required this.images,
    required this.initialindex,
    this.user,
    this.project,
    required this.isThisYours,
    this.product,
    this.event,
  });

  final List<String>? images;
  final int? initialindex;
  final UsersRecord? user;
  final ProjectsRecord? project;
  final bool? isThisYours;
  final ProductsRecord? product;
  final EventsRecord? event;

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  late ImageSliderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageSliderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.imagesPage = widget.images!.toList().cast<String>();
      setState(() {});
    });

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
        Navigator.pop(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15.0,
            sigmaY: 15.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xE6000000),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final images2 = _model.imagesPage.toList();
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: PageView.builder(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(
                                                  0,
                                                  min(
                                                      valueOrDefault<int>(
                                                        widget.initialindex,
                                                        0,
                                                      ),
                                                      images2.length - 1))),
                                      onPageChanged: (_) => setState(() {}),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images2.length,
                                      itemBuilder: (context, images2Index) {
                                        final images2Item =
                                            images2[images2Index];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 120.0, 0.0, 90.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      valueOrDefault<String>(
                                                        images2Item,
                                                        'https://i.redd.it/to1j3t4ys5o91.jpg',
                                                      ),
                                                      fit: BoxFit.contain,
                                                      alignment:
                                                          Alignment(0.0, 0.0),
                                                    ),
                                                    allowRotation: false,
                                                    tag: valueOrDefault<String>(
                                                      images2Item,
                                                      'https://i.redd.it/to1j3t4ys5o91.jpg' +
                                                          '$images2Index',
                                                    ),
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: valueOrDefault<String>(
                                                images2Item,
                                                'https://i.redd.it/to1j3t4ys5o91.jpg' +
                                                    '$images2Index',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    images2Item,
                                                    'https://i.redd.it/to1j3t4ys5o91.jpg',
                                                  ),
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.8,
                                                  fit: BoxFit.contain,
                                                  alignment:
                                                      Alignment(0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 16.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(
                                                    0,
                                                    min(
                                                        valueOrDefault<int>(
                                                          widget.initialindex,
                                                          0,
                                                        ),
                                                        images2.length - 1))),
                                        count: images2.length,
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
                                          expansionFactor: 3.0,
                                          spacing: 5.0,
                                          radius: 90.0,
                                          dotWidth: 8.0,
                                          dotHeight: 8.0,
                                          dotColor: Color(0x57FFFFFF),
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
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).textAndStroke,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 35.0,
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    if (widget.isThisYours ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 40.0, 20.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).textAndStroke,
                          borderRadius: 10.0,
                          borderWidth: 1.0,
                          buttonSize: 35.0,
                          icon: Icon(
                            FFIcons.kdelete2,
                            color: Colors.white,
                            size: 13.0,
                          ),
                          onPressed: () async {
                            if (widget.user != null) {
                              _model.removeAtIndexFromImagesPage(
                                  _model.pageViewCurrentIndex);
                              setState(() {});

                              await widget.user!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'images': _model.imagesPage,
                                  },
                                ),
                              });
                            } else if (widget.project != null) {
                              _model.removeAtIndexFromImagesPage(
                                  _model.pageViewCurrentIndex);
                              setState(() {});

                              await widget.project!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'images': _model.imagesPage,
                                  },
                                ),
                              });
                            } else if (widget.product != null) {
                              _model.removeAtIndexFromImagesPage(
                                  _model.pageViewCurrentIndex);
                              setState(() {});

                              await widget.product!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'images': _model.imagesPage,
                                  },
                                ),
                              });
                            } else {
                              _model.removeAtIndexFromImagesPage(
                                  _model.pageViewCurrentIndex);
                              setState(() {});

                              await widget.event!.reference
                                  .update(createEventsRecordData(
                                eventInfo: createEventStruct(
                                  fieldValues: {
                                    'images': _model.imagesPage,
                                  },
                                  clearUnsetFields: false,
                                ),
                              ));
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
