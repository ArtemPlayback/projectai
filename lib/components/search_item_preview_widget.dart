import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_item_preview_model.dart';
export 'search_item_preview_model.dart';

class SearchItemPreviewWidget extends StatefulWidget {
  const SearchItemPreviewWidget({
    super.key,
    required this.searchItem,
  });

  final SearchItemStruct? searchItem;

  @override
  State<SearchItemPreviewWidget> createState() =>
      _SearchItemPreviewWidgetState();
}

class _SearchItemPreviewWidgetState extends State<SearchItemPreviewWidget> {
  late SearchItemPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchItemPreviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget!.searchItem?.type == SearchItemType.event.name) {
          return FutureBuilder<List<EventsRecord>>(
            future: _model.eventComponent(
              uniqueQueryKey: valueOrDefault<String>(
                widget!.searchItem?.firebaseId,
                'wem,wemr',
              ),
              requestFn: () => queryEventsRecordOnce(
                queryBuilder: (eventsRecord) => eventsRecord.where(
                  'custom_id',
                  isEqualTo: widget!.searchItem?.firebaseId,
                ),
                singleRecord: true,
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
              List<EventsRecord> containerEventsRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerEventsRecord = containerEventsRecordList.isNotEmpty
                  ? containerEventsRecordList.first
                  : null;

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
                        containerEventsRecord,
                        ParamType.Document,
                      ),
                      'isFrom': serializeParam(
                        'smartsearch',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'events': containerEventsRecord,
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).textAndStroke,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 14.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(360.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              containerEventsRecord?.eventInfo?.images?.first,
                              'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                            ),
                            width: 45.0,
                            height: 45.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                              ))
                                Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                    valueOrDefault<String>(
                                      containerEventsRecord?.eventInfo?.title,
                                      'Event Title',
                                    ).maybeHandleOverflow(
                                      maxChars: 15,
                                      replacement: '…',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.searchItem?.type,
                                  'type',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      color:
                                          FlutterFlowTheme.of(context).darkBlur,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
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
            },
          );
        } else if (widget!.searchItem?.type == SearchItemType.product.name) {
          return FutureBuilder<List<ProductsRecord>>(
            future: _model.productComponent(
              uniqueQueryKey: valueOrDefault<String>(
                widget!.searchItem?.firebaseId,
                'sdfsdfsew',
              ),
              requestFn: () => queryProductsRecordOnce(
                queryBuilder: (productsRecord) => productsRecord.where(
                  'custom_id',
                  isEqualTo: widget!.searchItem?.firebaseId,
                ),
                singleRecord: true,
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
              List<ProductsRecord> containerProductsRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerProductsRecord =
                  containerProductsRecordList.isNotEmpty
                      ? containerProductsRecordList.first
                      : null;

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
                        containerProductsRecord,
                        ParamType.Document,
                      ),
                      'isFrom': serializeParam(
                        'smart search',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'product': containerProductsRecord,
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).textAndStroke,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 14.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(360.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              containerProductsRecord?.images?.first,
                              'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                            ),
                            width: 45.0,
                            height: 45.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                              ))
                                Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                    valueOrDefault<String>(
                                      containerProductsRecord?.title,
                                      'Product Title',
                                    ).maybeHandleOverflow(
                                      maxChars: 15,
                                      replacement: '…',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.searchItem?.type,
                                  'type',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      color:
                                          FlutterFlowTheme.of(context).darkBlur,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
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
            },
          );
        } else if (widget!.searchItem?.type == SearchItemType.company.name) {
          return FutureBuilder<List<ProjectsRecord>>(
            future: _model.companyComponent(
              uniqueQueryKey: valueOrDefault<String>(
                widget!.searchItem?.firebaseId,
                'dfg',
              ),
              requestFn: () => queryProjectsRecordOnce(
                queryBuilder: (projectsRecord) => projectsRecord.where(
                  'custom_id',
                  isEqualTo: widget!.searchItem?.firebaseId,
                ),
                singleRecord: true,
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
              List<ProjectsRecord> containerProjectsRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerProjectsRecord =
                  containerProjectsRecordList.isNotEmpty
                      ? containerProjectsRecordList.first
                      : null;

              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'company_page',
                    queryParameters: {
                      'company': serializeParam(
                        containerProjectsRecord,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'company': containerProjectsRecord,
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).textAndStroke,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 14.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(360.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              containerProjectsRecord?.mainImage,
                              'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                            ),
                            width: 45.0,
                            height: 45.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                              ))
                                Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                    valueOrDefault<String>(
                                      containerProjectsRecord?.title,
                                      'Company Title',
                                    ).maybeHandleOverflow(
                                      maxChars: 15,
                                      replacement: '…',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.searchItem?.type,
                                  'type',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      color:
                                          FlutterFlowTheme.of(context).darkBlur,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
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
            },
          );
        } else {
          return FutureBuilder<List<UsersRecord>>(
            future: FFAppState().userComponent(
              uniqueQueryKey: valueOrDefault<String>(
                widget!.searchItem?.firebaseId,
                'dfg',
              ),
              requestFn: () => queryUsersRecordOnce(
                queryBuilder: (usersRecord) => usersRecord.where(
                  'uid',
                  isEqualTo: widget!.searchItem?.firebaseId,
                ),
                singleRecord: true,
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
              List<UsersRecord> containerUsersRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerUsersRecord = containerUsersRecordList.isNotEmpty
                  ? containerUsersRecordList.first
                  : null;

              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'user_page',
                    queryParameters: {
                      'user': serializeParam(
                        containerUsersRecord,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'user': containerUsersRecord,
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).textAndStroke,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 14.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(360.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              containerUsersRecord?.photoUrl,
                              'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                            ),
                            width: 45.0,
                            height: 45.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                              ))
                                Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                    valueOrDefault<String>(
                                      containerUsersRecord?.displayName,
                                      'Name',
                                    ).maybeHandleOverflow(
                                      maxChars: 10,
                                      replacement: '…',
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget!.searchItem?.type,
                                    'type',
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'LTSuperior',
                                        color: FlutterFlowTheme.of(context)
                                            .darkBlur,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
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
            },
          );
        }
      },
    );
  }
}
