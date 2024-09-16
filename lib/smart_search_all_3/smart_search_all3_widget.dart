import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/emptysearch_widget.dart';
import '/components/search_item_preview_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/company_card/company_card_widget.dart';
import '/sign_in_foulder/new_project/event_card/event_card_widget.dart';
import '/sign_in_foulder/new_project/product_card/product_card_widget.dart';
import '/sign_in_foulder/new_project/user_card_new/user_card_new_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'smart_search_all3_model.dart';
export 'smart_search_all3_model.dart';

class SmartSearchAll3Widget extends StatefulWidget {
  const SmartSearchAll3Widget({super.key});

  @override
  State<SmartSearchAll3Widget> createState() => _SmartSearchAll3WidgetState();
}

class _SmartSearchAll3WidgetState extends State<SmartSearchAll3Widget> {
  late SmartSearchAll3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmartSearchAll3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.smartSearchSession = FFAppState().smartsearchtest;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Builder(
            builder: (context) {
              final smartSearchItems =
                  _model.smartSearchSession?.smartsearchItems?.toList() ?? [];

              return ListView.builder(
                padding: EdgeInsets.fromLTRB(
                  0,
                  130.0,
                  0,
                  200.0,
                ),
                primary: false,
                scrollDirection: Axis.vertical,
                itemCount: smartSearchItems.length,
                itemBuilder: (context, smartSearchItemsIndex) {
                  final smartSearchItemsItem =
                      smartSearchItems[smartSearchItemsIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 14.0, 14.0, 14.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => ClipRRect(
                                    borderRadius: BorderRadius.circular(360.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                                      ),
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                        ))
                                          Opacity(
                                            opacity: 0.8,
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                false
                                                    ? '${currentUserDisplayName} · ${dateTimeFormat("yMMMd", smartSearchItemsItem.when)} ${dateTimeFormat("Hm", smartSearchItemsItem.when)}'
                                                    : 'test',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            false
                                                ? smartSearchItemsItem.queryStr
                                                : 'hey',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'LTSuperior',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.25,
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 31.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.short_text,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Smart Search Response',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (false)
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final smartSearch =
                                    smartSearchItemsItem.searchResults.toList();

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(smartSearch.length,
                                            (smartSearchIndex) {
                                      final smartSearchItem =
                                          smartSearch[smartSearchIndex];
                                      return SearchItemPreviewWidget(
                                        key: Key(
                                            'Keyr4b_${smartSearchIndex}_of_${smartSearch.length}'),
                                        searchItem: smartSearchItem,
                                      );
                                    })
                                        .divide(SizedBox(width: 10.0))
                                        .addToStart(SizedBox(width: 20.0))
                                        .addToEnd(SizedBox(width: 20.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      if (false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 30.0),
                          child: custom_widgets.CustomMarkdown(
                            width: double.infinity,
                            height: 300.0,
                            text: smartSearchItemsItem.text,
                          ),
                        ),
                      if (false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final searchResult =
                                  smartSearchItemsItem.searchResults.toList();
                              if (searchResult.isEmpty) {
                                return EmptysearchWidget();
                              }

                              return ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  100.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchResult.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder: (context, searchResultIndex) {
                                  final searchResultItem =
                                      searchResult[searchResultIndex];
                                  return Builder(
                                    builder: (context) {
                                      if (searchResultItem.type == 'event') {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<List<EventsRecord>>(
                                              stream: queryEventsRecord(
                                                queryBuilder: (eventsRecord) =>
                                                    eventsRecord.where(
                                                  'custom_id',
                                                  isEqualTo: searchResultItem
                                                      .firebaseId,
                                                ),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<EventsRecord>
                                                    eventCardEventsRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final eventCardEventsRecord =
                                                    eventCardEventsRecordList
                                                            .isNotEmpty
                                                        ? eventCardEventsRecordList
                                                            .first
                                                        : null;

                                                return EventCardWidget(
                                                  key: Key(
                                                      'Keyjip_${searchResultIndex}_of_${searchResult.length}'),
                                                  eventDoc:
                                                      eventCardEventsRecord!,
                                                  explanation: searchResultItem
                                                      .explanation,
                                                  isFrom: 'smartsearch',
                                                  percent:
                                                      searchResultItem.percent,
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      } else if (searchResultItem.type ==
                                          'company') {
                                        return FutureBuilder<
                                            List<ProjectsRecord>>(
                                          future: queryProjectsRecordOnce(
                                            queryBuilder: (projectsRecord) =>
                                                projectsRecord.where(
                                              'custom_id',
                                              isEqualTo: searchResultItem
                                                          .firebaseId !=
                                                      ''
                                                  ? searchResultItem.firebaseId
                                                  : null,
                                              isNull: (searchResultItem
                                                              .firebaseId !=
                                                          ''
                                                      ? searchResultItem
                                                          .firebaseId
                                                      : null) ==
                                                  null,
                                            ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ProjectsRecord>
                                                companyCardProjectsRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final companyCardProjectsRecord =
                                                companyCardProjectsRecordList
                                                        .isNotEmpty
                                                    ? companyCardProjectsRecordList
                                                        .first
                                                    : null;

                                            return CompanyCardWidget(
                                              key: Key(
                                                  'Keyilo_${searchResultIndex}_of_${searchResult.length}'),
                                              percent: searchResultItem.percent
                                                  .toString(),
                                              expanation:
                                                  searchResultItem.explanation,
                                              company:
                                                  companyCardProjectsRecord!,
                                            );
                                          },
                                        );
                                      } else if (searchResultItem.type ==
                                          'people') {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<List<UsersRecord>>(
                                              future: queryUsersRecordOnce(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'uid',
                                                  isEqualTo: searchResultItem
                                                      .firebaseId,
                                                ),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    userCardNewUsersRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final userCardNewUsersRecord =
                                                    userCardNewUsersRecordList
                                                            .isNotEmpty
                                                        ? userCardNewUsersRecordList
                                                            .first
                                                        : null;

                                                return UserCardNewWidget(
                                                  key: Key(
                                                      'Keyri0_${searchResultIndex}_of_${searchResult.length}'),
                                                  user: userCardNewUsersRecord!,
                                                  explanation: searchResultItem
                                                      .explanation,
                                                  percent:
                                                      searchResultItem.percent,
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<List<ProductsRecord>>(
                                              future: queryProductsRecordOnce(
                                                queryBuilder:
                                                    (productsRecord) =>
                                                        productsRecord.where(
                                                  'custom_id',
                                                  isEqualTo: searchResultItem
                                                              .firebaseId !=
                                                          ''
                                                      ? searchResultItem
                                                          .firebaseId
                                                      : null,
                                                  isNull: (searchResultItem
                                                                  .firebaseId !=
                                                              ''
                                                          ? searchResultItem
                                                              .firebaseId
                                                          : null) ==
                                                      null,
                                                ),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ProductsRecord>
                                                    productCardProductsRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final productCardProductsRecord =
                                                    productCardProductsRecordList
                                                            .isNotEmpty
                                                        ? productCardProductsRecordList
                                                            .first
                                                        : null;

                                                return ProductCardWidget(
                                                  key: Key(
                                                      'Keyfos_${searchResultIndex}_of_${searchResult.length}'),
                                                  explanation: searchResultItem
                                                      .explanation,
                                                  isFrom: 'main',
                                                  product:
                                                      productCardProductsRecord!,
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
