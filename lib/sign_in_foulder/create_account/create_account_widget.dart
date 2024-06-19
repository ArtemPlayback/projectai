import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/button_fixed_size/button_fixed_size_widget.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'create_account_model.dart';
export 'create_account_model.dart';

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({super.key});

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  late CreateAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAccountModel());

    _model.emailTextController ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.confirmPasswordTextController ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: PageView(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                onPageChanged: (_) => setState(() {}),
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign up',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 0.0),
                            child: Text(
                              'Write your email as login and your full name (it will appear in your profile)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Form(
                            key: _model.formKey2,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Container(
                                    height: 43.0,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      children: [
                                        TextFormField(
                                          controller:
                                              _model.emailTextController,
                                          focusNode: _model.textFieldFocusNode1,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Email',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textAndStroke,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .whiteBlur,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 0.0, 18.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                          maxLines: 2,
                                          minLines: 1,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: _model
                                              .emailTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    height: 43.0,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      children: [
                                        TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode2,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Name',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'LTSuperior',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textAndStroke,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textAndStroke,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .whiteBlur,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 0.0, 18.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                          keyboardType: TextInputType.name,
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 146.0))
                            .addToEnd(SizedBox(height: 180.0)),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Confirm your email',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 7.0, 20.0, 0.0),
                          child: Text(
                            'We\'ve sent 6-digit code on your email to confirm your login',
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
                        Form(
                          key: _model.formKey1,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: PinCodeTextField(
                              autoDisposeControllers: false,
                              appContext: context,
                              length: 6,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              enableActiveFill: false,
                              autoFocus: true,
                              enablePinAutofill: false,
                              errorTextSpace: 16.0,
                              showCursor: true,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              pinTheme: PinTheme(
                                fieldHeight: 48.0,
                                fieldWidth: 48.0,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                shape: PinCodeFieldShape.box,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).textAndStroke,
                                selectedColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeFillColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                inactiveFillColor:
                                    FlutterFlowTheme.of(context).textAndStroke,
                                selectedFillColor:
                                    FlutterFlowTheme.of(context).primary,
                              ),
                              controller: _model.pinCodeController,
                              onChanged: (_) {},
                              onCompleted: (_) async {
                                if (_model.pinCodeController!.text ==
                                    _model.verificationCode) {
                                  await _model.pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Wrong Code',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                              validator: _model.pinCodeControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (_model.timerMilliseconds == 45000) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await MakeHookCall.call(
                                      email: _model.emailTextController.text,
                                      verificationCode: _model.verificationCode,
                                    );

                                    _model.timerController.onStartTimer();
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.8,
                                        child: Text(
                                          'Didn\'t request the code?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Send again',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
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
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Resend code in ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowTimer(
                                        initialTime: _model.timerInitialTimeMs,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller: _model.timerController,
                                        updateStateInterval:
                                            Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) setState(() {});
                                        },
                                        onEnded: () async {
                                          _model.timerController.onResetTimer();
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ]
                          .addToStart(SizedBox(height: 146.0))
                          .addToEnd(SizedBox(height: 150.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.0, 0.0, 0.0),
                            child: Text(
                              'Create strong password (A-Z, 0-9 and special symbols)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    color: Color(0xA91D1D20),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: Container(
                              height: 43.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                children: [
                                  TextFormField(
                                    controller: _model.passwordTextController,
                                    focusNode: _model.textFieldFocusNode3,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.next,
                                    obscureText: !_model.passwordVisibility1,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .textAndStroke,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .textAndStroke,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .thirdText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .whiteBlur,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              18.0, 0.0, 18.0, 0.0),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model.passwordVisibility1 =
                                              !_model.passwordVisibility1,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.passwordVisibility1
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _model
                                        .passwordTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              height: 43.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                children: [
                                  TextFormField(
                                    controller:
                                        _model.confirmPasswordTextController,
                                    focusNode: _model.textFieldFocusNode4,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.next,
                                    obscureText: !_model.passwordVisibility2,
                                    decoration: InputDecoration(
                                      hintText: 'Confirm password',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .textAndStroke,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .textAndStroke,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .thirdText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .whiteBlur,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              18.0, 0.0, 18.0, 0.0),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model.passwordVisibility2 =
                                              !_model.passwordVisibility2,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.passwordVisibility2
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _model
                                        .confirmPasswordTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 146.0))
                            .addToEnd(SizedBox(height: 180.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15.0,
                    sigmaY: 15.0,
                  ),
                  child: Container(
                    height: 110.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).mainThemeBlur,
                    ),
                    child: Builder(
                      builder: (context) {
                        if (_model.pageViewCurrentIndex != 0) {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: 110.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(360.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            LinearPercentIndicator(
                                              percent:
                                                  _model.pageViewCurrentIndex >=
                                                          0
                                                      ? 1.0
                                                      : 0.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.3,
                                              lineHeight: 7.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  Color(0x82A3A3B3),
                                              padding: EdgeInsets.zero,
                                            ),
                                            Container(
                                              width: 4.0,
                                              height: 7.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent:
                                                    _model.pageViewCurrentIndex >=
                                                            1
                                                        ? 1.0
                                                        : 0.0,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.29,
                                                lineHeight: 7.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0x82A3A3B3),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                            Container(
                                              width: 4.0,
                                              height: 7.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                percent:
                                                    _model.pageViewCurrentIndex >=
                                                            2
                                                        ? 1.0
                                                        : 0.0,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.3,
                                                lineHeight: 7.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    Color(0x82A3A3B3),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (_model.pageViewCurrentIndex != 0)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 20.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (_model
                                                          .pageViewCurrentIndex ==
                                                      1) {
                                                    await _model
                                                        .pageViewController
                                                        ?.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  } else {
                                                    await _model
                                                        .pageViewController
                                                        ?.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  }
                                                },
                                                text: 'Back',
                                                options: FFButtonOptions(
                                                  width: 120.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 12.0,
                                                          10.0, 12.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00C6C6D5),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textAndStroke,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model:
                                                  _model.buttonFixedSizeModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: ButtonFixedSizeWidget(
                                                width: 150.0,
                                                height: 43.0,
                                                buttonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                text: 'Next',
                                                fontsize: 16,
                                                textcolor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                showLoadingIndicator: false,
                                                action: () async {
                                                  if (_model
                                                          .pageViewCurrentIndex ==
                                                      0) {
                                                    if (_model.formKey2
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey2
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    _model.tst = '1';
                                                    setState(() {});
                                                    if (!(_model.verificationCode !=
                                                            null &&
                                                        _model.verificationCode !=
                                                            '')) {
                                                      _model.verificationCode =
                                                          random_data
                                                              .randomString(
                                                        6,
                                                        6,
                                                        false,
                                                        false,
                                                        true,
                                                      );
                                                      setState(() {});
                                                    }
                                                    await MakeHookCall.call(
                                                      email: _model
                                                          .emailTextController
                                                          .text,
                                                      verificationCode: _model
                                                          .verificationCode,
                                                    );

                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  } else if (_model
                                                          .pageViewCurrentIndex ==
                                                      1) {
                                                    if (_model
                                                            .pinCodeController!
                                                            .text ==
                                                        _model
                                                            .verificationCode) {
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Wrong Code',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.0,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    }
                                                  } else if (_model
                                                          .pageViewCurrentIndex ==
                                                      2) {
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    if (_model
                                                            .passwordTextController
                                                            .text !=
                                                        _model
                                                            .confirmPasswordTextController
                                                            .text) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Passwords don\'t match!',
                                                          ),
                                                        ),
                                                      );
                                                      return;
                                                    }

                                                    final user = await authManager
                                                        .createAccountWithEmail(
                                                      context,
                                                      _model.emailTextController
                                                          .text,
                                                      _model
                                                          .passwordTextController
                                                          .text,
                                                    );
                                                    if (user == null) {
                                                      return;
                                                    }

                                                    await UsersRecord.collection
                                                        .doc(user.uid)
                                                        .update(
                                                            createUsersRecordData(
                                                          displayName: _model
                                                              .textController1
                                                              .text,
                                                          pushNotifications:
                                                              true,
                                                          photoUrl:
                                                              'https://t4.ftcdn.net/jpg/02/17/34/67/360_F_217346796_TSg5VcYjsFxZtIDK6Qdctg3yqAapG7Xa.jpg',
                                                        ));

                                                    var chatsRecordReference =
                                                        ChatsRecord.collection
                                                            .doc();
                                                    await chatsRecordReference
                                                        .set({
                                                      ...createChatsRecordData(
                                                        chatType:
                                                            'notifications',
                                                        lastMessageTime:
                                                            getCurrentTimestamp,
                                                        type: 'User',
                                                        notificationOwner:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'notifications': [
                                                            getNotificationsFirestoreData(
                                                              updateNotificationsStruct(
                                                                NotificationsStruct(
                                                                  text:
                                                                      'This is where notifications will appear',
                                                                  id: random_data
                                                                      .randomString(
                                                                    10,
                                                                    12,
                                                                    true,
                                                                    false,
                                                                    true,
                                                                  ),
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              true,
                                                            )
                                                          ],
                                                          'users': [
                                                            currentUserReference
                                                          ],
                                                        },
                                                      ),
                                                    });
                                                    _model.chat = ChatsRecord
                                                        .getDocumentFromData({
                                                      ...createChatsRecordData(
                                                        chatType:
                                                            'notifications',
                                                        lastMessageTime:
                                                            getCurrentTimestamp,
                                                        type: 'User',
                                                        notificationOwner:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'notifications': [
                                                            getNotificationsFirestoreData(
                                                              updateNotificationsStruct(
                                                                NotificationsStruct(
                                                                  text:
                                                                      'This is where notifications will appear',
                                                                  id: random_data
                                                                      .randomString(
                                                                    10,
                                                                    12,
                                                                    true,
                                                                    false,
                                                                    true,
                                                                  ),
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              true,
                                                            )
                                                          ],
                                                          'users': [
                                                            currentUserReference
                                                          ],
                                                        },
                                                      ),
                                                    }, chatsRecordReference);

                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      notificationChat: _model
                                                          .chat?.reference,
                                                    ));

                                                    context.pushNamedAuth(
                                                        'smart_search_all',
                                                        context.mounted);
                                                  } else {
                                                    _model.tst = '3';
                                                    setState(() {});
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  LinearPercentIndicator(
                                    percent: _model.pageViewCurrentIndex >= 0
                                        ? 1.0
                                        : 0.0,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.3,
                                    lineHeight: 7.0,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    progressColor:
                                        FlutterFlowTheme.of(context).primary,
                                    backgroundColor: Color(0x82A3A3B3),
                                    padding: EdgeInsets.zero,
                                  ),
                                  Container(
                                    width: 4.0,
                                    height: 7.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      percent: _model.pageViewCurrentIndex >= 1
                                          ? 1.0
                                          : 0.0,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.29,
                                      lineHeight: 7.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).primary,
                                      backgroundColor: Color(0x82A3A3B3),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Container(
                                    width: 4.0,
                                    height: 7.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      percent: _model.pageViewCurrentIndex >= 2
                                          ? 1.0
                                          : 0.0,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      lineHeight: 7.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).primary,
                                      backgroundColor: Color(0x82A3A3B3),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 14.0, 30.0, 45.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 49.0,
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.buttonInfinityModel,
                                      updateCallback: () => setState(() {}),
                                      child: ButtonInfinityWidget(
                                        width: 450.0,
                                        height: 49.0,
                                        buttonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        text: 'Start',
                                        fontsize: 16,
                                        textcolor:
                                            FlutterFlowTheme.of(context).info,
                                        action: () async {
                                          if (_model.pageViewCurrentIndex ==
                                              0) {
                                            _model.tst = '1';
                                            setState(() {});
                                            if (!(_model.verificationCode !=
                                                    null &&
                                                _model.verificationCode !=
                                                    '')) {
                                              _model.verificationCode =
                                                  random_data.randomString(
                                                6,
                                                6,
                                                false,
                                                false,
                                                true,
                                              );
                                              setState(() {});
                                            }
                                            await MakeHookCall.call(
                                              email: _model
                                                  .emailTextController.text,
                                              verificationCode:
                                                  _model.verificationCode,
                                            );

                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          } else if (_model
                                                  .pageViewCurrentIndex ==
                                              2) {
                                            _model.tst = '2';
                                            setState(() {});
                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            _model.tst = '3';
                                            setState(() {});
                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          }
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
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 52.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).thirdText,
                borderRadius: 10.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).thirdText,
                  size: 25.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
