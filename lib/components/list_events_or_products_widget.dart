import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_project/company_card/company_card_widget.dart';
import '/new_project/event_card/event_card_widget.dart';
import '/new_project/product_card/product_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_events_or_products_model.dart';
export 'list_events_or_products_model.dart';

class ListEventsOrProductsWidget extends StatefulWidget {
  const ListEventsOrProductsWidget({
    super.key,
    this.user,
    this.company,
    required this.type,
  });

  final DocumentReference? user;
  final ProjectsRecord? company;
  final String? type;

  @override
  State<ListEventsOrProductsWidget> createState() =>
      _ListEventsOrProductsWidgetState();
}

class _ListEventsOrProductsWidgetState
    extends State<ListEventsOrProductsWidget> {
  late ListEventsOrProductsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListEventsOrProductsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Events ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (widget.type == 'Events') {
                      return Builder(
                        builder: (context) {
                          if (widget.user != null) {
                            return FutureBuilder<List<EventsRecord>>(
                              future: queryEventsRecordOnce(
                                queryBuilder: (eventsRecord) =>
                                    eventsRecord.where(
                                  'user',
                                  isEqualTo: widget.user,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<EventsRecord> listViewEventsRecordList =
                                    snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewEventsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 8.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEventsRecord =
                                        listViewEventsRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: EventCardWidget(
                                        key: Key(
                                            'Keysgc_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                        isFrom: 'list',
                                        eventDoc: listViewEventsRecord,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          } else {
                            return FutureBuilder<List<EventsRecord>>(
                              future: queryEventsRecordOnce(
                                queryBuilder: (eventsRecord) =>
                                    eventsRecord.where(
                                  'project',
                                  isEqualTo: widget.company?.reference,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<EventsRecord> listViewEventsRecordList =
                                    snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewEventsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 8.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewEventsRecord =
                                        listViewEventsRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: EventCardWidget(
                                        key: Key(
                                            'Keyfai_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                        isFrom: 'list',
                                        eventDoc: listViewEventsRecord,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                        },
                      );
                    } else if (widget.type == 'Products') {
                      return Builder(
                        builder: (context) {
                          if (widget.user != null) {
                            return FutureBuilder<List<ProductsRecord>>(
                              future: queryProductsRecordOnce(
                                queryBuilder: (productsRecord) =>
                                    productsRecord.where(
                                  'owner_person',
                                  isEqualTo: widget.user,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ProductsRecord>
                                    listViewProductsRecordList = snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewProductsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 8.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewProductsRecord =
                                        listViewProductsRecordList[
                                            listViewIndex];
                                    return ProductCardWidget(
                                      key: Key(
                                          'Key2do_${listViewIndex}_of_${listViewProductsRecordList.length}'),
                                      isFrom: 'list',
                                      product: listViewProductsRecord,
                                    );
                                  },
                                );
                              },
                            );
                          } else {
                            return FutureBuilder<List<ProductsRecord>>(
                              future: queryProductsRecordOnce(
                                queryBuilder: (productsRecord) =>
                                    productsRecord.where(
                                  'owner_company',
                                  isEqualTo: widget.company?.reference,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ProductsRecord>
                                    listViewProductsRecordList = snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewProductsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 8.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewProductsRecord =
                                        listViewProductsRecordList[
                                            listViewIndex];
                                    return ProductCardWidget(
                                      key: Key(
                                          'Keylh8_${listViewIndex}_of_${listViewProductsRecordList.length}'),
                                      isFrom: 'list',
                                      product: listViewProductsRecord,
                                    );
                                  },
                                );
                              },
                            );
                          }
                        },
                      );
                    } else {
                      return FutureBuilder<List<ProjectsRecord>>(
                        future: queryProjectsRecordOnce(
                          queryBuilder: (projectsRecord) =>
                              projectsRecord.where(
                            'user',
                            isEqualTo: widget.user,
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
                          List<ProjectsRecord> listViewProjectsRecordList =
                              snapshot.data!;
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewProjectsRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewProjectsRecord =
                                  listViewProjectsRecordList[listViewIndex];
                              return CompanyCardWidget(
                                key: Key(
                                    'Key1ok_${listViewIndex}_of_${listViewProjectsRecordList.length}'),
                                company: listViewProjectsRecord,
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ].divide(SizedBox(height: 60.0)),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.type,
                      'Events',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).textAndStroke,
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
