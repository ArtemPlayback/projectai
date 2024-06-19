import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/delete_team_member_widget.dart';
import '/components/edit_member_widget.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'usercard_small_model.dart';
export 'usercard_small_model.dart';

class UsercardSmallWidget extends StatefulWidget {
  const UsercardSmallWidget({
    super.key,
    required this.user,
    this.secondText,
    bool? teamEdit,
    this.actionEdit,
    this.company,
    this.index,
  }) : this.teamEdit = teamEdit ?? false;

  final UsersRecord? user;
  final String? secondText;
  final bool teamEdit;
  final Future Function()? actionEdit;
  final ProjectsRecord? company;
  final int? index;

  @override
  State<UsercardSmallWidget> createState() => _UsercardSmallWidgetState();
}

class _UsercardSmallWidgetState extends State<UsercardSmallWidget> {
  late UsercardSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsercardSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.user!.photoUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x2C000000), Color(0x97000000)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 25.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.user?.displayName,
                          'Name',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: Colors.white,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                      Opacity(
                        opacity: 0.8,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.secondText != null &&
                                      widget.secondText != ''
                                  ? widget.secondText
                                  : valueOrDefault<String>(
                                      widget.user?.description,
                                      'description',
                                    ),
                              'text',
                            ),
                            maxLines: 3,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  color: FlutterFlowTheme.of(context).alternate,
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
            ),
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Builder(
                builder: (context) {
                  if (!widget.teamEdit) {
                    return Padding(
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
                                            e.people == widget.user?.reference)
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
                                                people: widget.user?.reference,
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
                                                people: widget.user?.reference,
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
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 15.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 7.0,
                                sigmaY: 7.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x9AFF3B30),
                                ),
                                child: Builder(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderRadius: 10.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      FFIcons.kdelete2,
                                      color: Colors.white,
                                      size: 15.0,
                                    ),
                                    onPressed: () async {
                                      await showDialog(
                                        barrierColor: Color(0x69000000),
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: Container(
                                              height: 350.0,
                                              width: 350.0,
                                              child: DeleteTeamMemberWidget(
                                                company:
                                                    widget.company!.reference,
                                                user: widget.user!.reference,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 15.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 7.0,
                                sigmaY: 7.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x67000000),
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Color(0x31C6C6D5),
                                  borderRadius: 10.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    FFIcons.keditPencil01,
                                    color: Colors.white,
                                    size: 15.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x73000000),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: 290.0,
                                            child: EditMemberWidget(
                                              user: widget.user!,
                                              company: widget.company!,
                                              index: widget.index!,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
