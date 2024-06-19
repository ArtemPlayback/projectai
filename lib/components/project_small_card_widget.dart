import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/list_events_or_products_widget.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_small_card_model.dart';
export 'project_small_card_model.dart';

class ProjectSmallCardWidget extends StatefulWidget {
  const ProjectSmallCardWidget({
    super.key,
    required this.companyRef,
    this.parameter2,
  });

  final ProjectsRecord? companyRef;
  final String? parameter2;

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
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.companyRef!.mainImage,
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
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
                            boolean:
                                (currentUserDocument?.saved?.toList() ?? [])
                                        .where((e) =>
                                            e.company ==
                                            widget.companyRef?.reference)
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
                                                company: widget
                                                    .companyRef?.reference,
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
                                                company: widget
                                                    .companyRef?.reference,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.companyRef?.title,
                    'fd',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'LTSuperior',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
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
                      valueOrDefault<String>(
                        widget.parameter2,
                        'd',
                      ),
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
                    FutureBuilder<int>(
                      future: queryProductsRecordCount(
                        queryBuilder: (productsRecord) => productsRecord.where(
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
                        int containerCount = snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: containerCount != 0,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x6D000000),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        child: ListEventsOrProductsWidget(
                                          type: 'Products',
                                          company: widget.companyRef,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
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
                                        color:
                                            FlutterFlowTheme.of(context).orange,
                                        size: 13.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '${containerCount.toString()} products',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    FutureBuilder<int>(
                      future: queryEventsRecordCount(
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
                        int containerCount = snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: containerCount != 0,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x6D000000),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        child: ListEventsOrProductsWidget(
                                          type: 'Events',
                                          company: widget.companyRef,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
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
                                        color:
                                            FlutterFlowTheme.of(context).pink,
                                        size: 13.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '${containerCount.toString()} events',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                              ),
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
