import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_password_model.dart';
export 'change_password_model.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  late ChangePasswordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordModel());

    _model.emailTextController ??=
        TextEditingController(text: currentUserEmail);
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: 30.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: Color(0xFFE4E4E4),
                  borderRadius: BorderRadius.circular(90.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Text(
                'Change Password',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'LTSuperior',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                'Have you forgotten your password?',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'LTSuperior',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color(0x33007AFF),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '1',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Write your email',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color(0x33007AFF),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '2',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Click the \"Get Link\" button',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color(0x33007AFF),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '3',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Follow the link that we will send to you by email',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color(0x33007AFF),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        '4',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Click the \"Get Link\" button',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.emailTextController,
                focusNode: _model.textFieldFocusNode,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Montserrat',
                        color: Color(0x5C000000),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'LTSuperior',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x82A3A3B3),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      color: Color(0xFF2F2F2F),
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
                maxLines: null,
                validator:
                    _model.emailTextControllerValidator.asValidator(context),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.emailTextController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Email required!',
                          ),
                        ),
                      );
                      return;
                    }
                    await authManager.resetPassword(
                      email: _model.emailTextController.text,
                      context: context,
                    );
                  },
                  text: 'Get a link',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'LTSuperior',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
