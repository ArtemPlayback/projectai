import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_member_model.dart';
export 'edit_member_model.dart';

class EditMemberWidget extends StatefulWidget {
  const EditMemberWidget({
    super.key,
    required this.user,
    required this.company,
    required this.index,
  });

  final UsersRecord? user;
  final ProjectsRecord? company;
  final int? index;

  @override
  State<EditMemberWidget> createState() => _EditMemberWidgetState();
}

class _EditMemberWidgetState extends State<EditMemberWidget> {
  late EditMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMemberModel());

    _model.textController ??= TextEditingController(
        text: widget.company?.teamMembers
            ?.where((e) => e.userReference == widget.user?.reference)
            .toList()
            ?.first
            ?.role);
    _model.textFieldFocusNode ??= FocusNode();

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
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(360.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              widget.user?.photoUrl,
                              'name',
                            ),
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.user?.displayName,
                                  'name',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  _model.textController.text == ''
                                      ? 'no role'
                                      : _model.textController.text,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'LTSuperior',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 10),
                        () => setState(() {}),
                      ),
                      autofocus: false,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'User role',
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).textAndStroke,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).textAndStroke,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).thirdText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).whiteBlur,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 0.0, 18.0, 0.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                      maxLines: 2,
                      minLines: 1,
                      maxLength: 80,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: wrapWithModel(
                      model: _model.buttonInfinityModel,
                      updateCallback: () => setState(() {}),
                      child: ButtonInfinityWidget(
                        width: 450.0,
                        height: 40.0,
                        buttonColor: FlutterFlowTheme.of(context).primary,
                        text: 'Save',
                        fontsize: 14,
                        textcolor: Colors.white,
                        action: () async {
                          _model.team = widget.company!.teamMembers
                              .toList()
                              .cast<TeamMemberStruct>();
                          _model.member = widget.company?.teamMembers
                              ?.where((e) =>
                                  e.userReference == widget.user?.reference)
                              .toList()
                              ?.first;
                          setState(() {});
                          _model.updateMemberStruct(
                            (e) => e..role = _model.textController.text,
                          );
                          _model.updateTeamAtIndex(
                            widget.index!,
                            (_) => _model.member!,
                          );
                          setState(() {});

                          await widget.company!.reference.update({
                            ...mapToFirestore(
                              {
                                'team': getTeamMemberListFirestoreData(
                                  _model.team,
                                ),
                              },
                            ),
                          });
                          Navigator.pop(context);
                        },
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
  }
}
