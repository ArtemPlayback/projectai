import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_card_small_model.dart';
export 'event_card_small_model.dart';

class EventCardSmallWidget extends StatefulWidget {
  const EventCardSmallWidget({
    super.key,
    required this.event,
  });

  final EventsRecord? event;

  @override
  State<EventCardSmallWidget> createState() => _EventCardSmallWidgetState();
}

class _EventCardSmallWidgetState extends State<EventCardSmallWidget> {
  late EventCardSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventCardSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional(1.0, -1.0),
          child: Stack(
            alignment: AlignmentDirectional(1.0, -1.0),
            children: [
              Builder(
                builder: (context) {
                  final images =
                      widget.event?.eventInfo?.images?.toList() ?? [];
                  return Container(
                    width: 300.0,
                    height: 215.0,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _model.pageViewController ??= PageController(
                          initialPage: max(0, min(0, images.length - 1))),
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, imagesIndex) {
                        final imagesItem = images[imagesIndex];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              imagesItem,
                              'https://as1.ftcdn.net/v2/jpg/05/85/45/22/1000_F_585452272_Ci6U9qLUPiqiLF15Zk5e4x8a0slzhHgV.jpg',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.toggleModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: ToggleWidget(
                        boolean: (currentUserDocument?.saved?.toList() ?? [])
                                .where(
                                    (e) => e.events == widget.event?.reference)
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
                                            events: widget.event?.reference,
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
                                    'saved': FieldValue.arrayUnion([
                                      getSavedFirestoreData(
                                        updateSavedStruct(
                                          SavedStruct(
                                            events: widget.event?.reference,
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
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.event?.eventInfo?.title,
              'Title',
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 9.0, 0.0),
                child: FaIcon(
                  FontAwesomeIcons.locationArrow,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 18.0,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.event?.eventInfo?.locationTitle,
                    'Title',
                  ),
                  textAlign: TextAlign.start,
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
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                child: Icon(
                  Icons.timelapse_sharp,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 19.0,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  '${valueOrDefault<String>(
                    dateTimeFormat('yMMMd', widget.event?.eventInfo?.startDate),
                    'Title',
                  )} ${valueOrDefault<String>(
                    dateTimeFormat('Hm', widget.event?.eventInfo?.startTime),
                    'Title',
                  )}',
                  textAlign: TextAlign.start,
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
      ],
    );
  }
}
