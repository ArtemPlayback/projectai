import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_card_model.dart';
export 'event_card_model.dart';

class EventCardWidget extends StatefulWidget {
  const EventCardWidget({
    super.key,
    required this.eventDoc,
    this.explanation,
    required this.isFrom,
  });

  final EventsRecord? eventDoc;
  final String? explanation;
  final String? isFrom;

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  late EventCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventCardModel());

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
          'event_page',
          queryParameters: {
            'events': serializeParam(
              widget.eventDoc,
              ParamType.Document,
            ),
            'isFrom': serializeParam(
              widget.isFrom,
              ParamType.String,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'events': widget.eventDoc,
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
              Builder(
                builder: (context) {
                  final images =
                      widget.eventDoc?.eventInfo?.images?.toList() ?? [];
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
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage:
                                          max(0, min(0, images.length - 1))),
                              count: images.length,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 23.0, 20.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.eventDoc?.eventInfo?.title,
                    'title',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'LTSuperior',
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.explanation,
                      'c',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 18.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.eventDoc!.reference.delete();
                      },
                      child: Icon(
                        Icons.timelapse_sharp,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 22.0,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        '${dateTimeFormat('MMMMEEEEd', widget.eventDoc?.eventInfo?.startDate)}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 9.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 1.0),
                      child: FaIcon(
                        FontAwesomeIcons.locationArrow,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(9.0, 1.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.eventDoc?.eventInfo?.locationTitle,
                          'ч',
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 31.0, 20.0, 21.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 64.0,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 30.0, 0.0),
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Container(
                                          width: 32.0,
                                          height: 32.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://picsum.photos/seed/412/600',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 14.0, 0.0),
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Container(
                                          width: 32.0,
                                          height: 32.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://picsum.photos/seed/412/600',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      width: 32.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          'https://picsum.photos/seed/412/600',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '11.4k',
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
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'event_page',
                          queryParameters: {
                            'events': serializeParam(
                              widget.eventDoc,
                              ParamType.Document,
                            ),
                            'isFrom': serializeParam(
                              widget.isFrom,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'events': widget.eventDoc,
                          },
                        );
                      },
                      text: 'See more',
                      options: FFButtonOptions(
                        width: 202.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'LTSuperior',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
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
  }
}
