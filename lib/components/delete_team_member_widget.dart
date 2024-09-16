import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_team_member_model.dart';
export 'delete_team_member_model.dart';

class DeleteTeamMemberWidget extends StatefulWidget {
  const DeleteTeamMemberWidget({
    super.key,
    required this.company,
    required this.user,
    required this.teamMembers2,
  });

  final DocumentReference? company;
  final DocumentReference? user;
  final List<TeamMemberStruct>? teamMembers2;

  @override
  State<DeleteTeamMemberWidget> createState() => _DeleteTeamMemberWidgetState();
}

class _DeleteTeamMemberWidgetState extends State<DeleteTeamMemberWidget> {
  late DeleteTeamMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteTeamMemberModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.teamMembers =
          widget!.teamMembers2!.toList().cast<TeamMemberStruct>();
      _model.updatePage(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 24.0, 30.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: Color(0x8BECECEE),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FFIcons.kfluentPersonDelete24Regular,
                    color: Color(0xFFFF3B30),
                    size: 40.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 6.0),
                  child: Text(
                    'Delete team member?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                  child: Text(
                    'This action cannot be undone, but you can add member again',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.teamMembers = widget!.teamMembers2!
                              .toList()
                              .cast<TeamMemberStruct>();
                          safeSetState(() {});
                          _model.removeAtIndexFromTeamMembers(
                              functions.findMemberIndexInList(
                                  widget!.user!, _model.teamMembers.toList()));
                          _model.updatePage(() {});
                          unawaited(
                            () async {
                              await widget!.company!.update({
                                ...mapToFirestore(
                                  {
                                    'team_members':
                                        getTeamMemberListFirestoreData(
                                      _model.teamMembers,
                                    ),
                                  },
                                ),
                              });
                            }(),
                          );
                          Navigator.pop(context);
                        },
                        text: 'Delete',
                        options: FFButtonOptions(
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          color: Color(0xFFFF3B30),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'LTSuperior',
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              37.0, 0.0, 37.0, 0.0),
                          color: Color(0x02007AFF),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'LTSuperior',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).textAndStroke,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 6.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
