import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_small_card_model.dart';
export 'project_small_card_model.dart';

class ProjectSmallCardWidget extends StatefulWidget {
  const ProjectSmallCardWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    required this.companyRef,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final ProjectsRecord? companyRef;

  @override
  State<ProjectSmallCardWidget> createState() => _ProjectSmallCardWidgetState();
}

class _ProjectSmallCardWidgetState extends State<ProjectSmallCardWidget> {
  late ProjectSmallCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectSmallCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'company_page',
            queryParameters: {
              'company': serializeParam(
                widget.companyRef,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'company': widget.companyRef,
            },
          );
        },
        child: Container(
          width: 302.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.parameter1!,
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  widget.parameter2!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'LTSuperior',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 10.0, 0.0),
                    child: Text(
                      widget.parameter3!,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.companyRef?.products != null &&
                        (widget.companyRef?.products)!.isNotEmpty)
                      FutureBuilder<List<ProductsRecord>>(
                        future: queryProductsRecordOnce(
                          queryBuilder: (productsRecord) =>
                              productsRecord.where(
                            'owner_company',
                            isEqualTo: widget.companyRef?.reference,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ProductsRecord> containerProductsRecordList =
                              snapshot.data!;
                          return Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).orange,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kshopW,
                                    color: FlutterFlowTheme.of(context).orange,
                                    size: 13.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '${containerProductsRecordList.length.toString()} products',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .orange,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    if (widget.companyRef?.events != null &&
                        (widget.companyRef?.events)!.isNotEmpty)
                      FutureBuilder<List<EventsRecord>>(
                        future: queryEventsRecordOnce(
                          queryBuilder: (eventsRecord) => eventsRecord.where(
                            'project',
                            isEqualTo: widget.companyRef?.reference,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<EventsRecord> containerEventsRecordList =
                              snapshot.data!;
                          return Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).pink,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kshopW,
                                    color: FlutterFlowTheme.of(context).pink,
                                    size: 13.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '${containerEventsRecordList.length.toString()} events',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .pink,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  ].divide(SizedBox(width: 6.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
