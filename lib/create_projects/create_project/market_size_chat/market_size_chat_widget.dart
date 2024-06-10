import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'market_size_chat_model.dart';
export 'market_size_chat_model.dart';

class MarketSizeChatWidget extends StatefulWidget {
  const MarketSizeChatWidget({
    super.key,
    this.project,
    this.textField,
    required this.comeFrom,
    required this.isUpdate,
  });

  final ProjectsRecord? project;
  final String? textField;
  final String? comeFrom;
  final bool? isUpdate;

  @override
  State<MarketSizeChatWidget> createState() => _MarketSizeChatWidgetState();
}

class _MarketSizeChatWidgetState extends State<MarketSizeChatWidget>
    with TickerProviderStateMixin {
  late MarketSizeChatModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketSizeChatModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.comeFrom == 'market size') {
        if (widget.textField != null && widget.textField != '') {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Market Size\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: 'Your market size: ',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: widget.textField,
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'How would you like to adjust your market size? Share your thoughts, and I\'ll follow up with a few questions to understand your project better.',
          ));
          setState(() {});
        } else {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Market Size\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'I will ask you several questions so I can assist in calculating the market size for your product or service. Please, wait until I generate questions',
          ));
          setState(() {});
          _model.marketSizeOld = await MarketSizeCall.call(
            question: functions.stringToAPI(
                'Project\'s title: ${widget.project?.title}, project\'s description:${widget.project?.projectInformation?.description}, existing market size: ${widget.textField}'),
          );
          if ((_model.marketSizeOld?.succeeded ?? true)) {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: getJsonField(
                (_model.marketSizeOld?.jsonBody ?? ''),
                r'''$.text''',
              ).toString().toString(),
            ));
            setState(() {});
          } else {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: 'Something went wrong. Please, try again later.',
            ));
            setState(() {});
          }
        }
      } else if (widget.comeFrom == 'monetization') {
        if (widget.textField != null && widget.textField != '') {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Monetization\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: 'Your Monetization: ',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: widget.textField,
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'How would you like to adjust your Monetization? Share your thoughts, and I\'ll follow up with a few questions to understand your project better.',
          ));
          setState(() {});
        } else {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Monetization\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'I will ask you several questions so I can assist in calculating the monetization for your product or service. Please, wait until I generate questions',
          ));
          setState(() {});
          _model.monetizationOld = await MonetizationCall.call(
            question: functions.stringToAPI(
                'Project\'s title: ${widget.project?.title}, project\'s description:${widget.project?.projectInformation?.description}, existing monetization: ${widget.textField}'),
          );
          if ((_model.monetizationOld?.succeeded ?? true)) {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: getJsonField(
                (_model.monetizationOld?.jsonBody ?? ''),
                r'''$.text''',
              ).toString().toString(),
            ));
            setState(() {});
          } else {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: 'Something went wrong. Please, try again later.',
            ));
            setState(() {});
          }
        }
      } else if (widget.comeFrom == 'marketing plan') {
        if (widget.textField != null && widget.textField != '') {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Marketing plan\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: 'Your Marketing plan: ',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: widget.textField,
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'How would you like to adjust your Marketing plan? Share your thoughts, and I\'ll follow up with a few questions to understand your project better.',
          ));
          setState(() {});
        } else {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Marketing plan\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'I will ask you several questions so I can assist in calculating the market size for your product or service. Please, wait until I generate questions',
          ));
          setState(() {});
          _model.marketingPlanOld = await MarketingPlanCall.call(
            question: functions.stringToAPI(
                'Project\'s title: ${widget.project?.title}, project\'s description:${widget.project?.projectInformation?.description}, existing marketing plan: ${widget.textField}'),
          );
          if ((_model.marketingPlanOld?.succeeded ?? true)) {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: getJsonField(
                (_model.marketingPlanOld?.jsonBody ?? ''),
                r'''$.text''',
              ).toString().toString(),
            ));
            setState(() {});
          } else {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: 'Something went wrong. Please, try again later.',
            ));
            setState(() {});
          }
        }
      } else if (widget.comeFrom == 'financial plan') {
        if (widget.textField != null && widget.textField != '') {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Financial plan\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: 'Your Financial plan: ',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: widget.textField,
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'How would you like to adjust your Financial plan? Share your thoughts, and I\'ll follow up with a few questions to understand your project better.',
          ));
          setState(() {});
        } else {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Financial plan\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'I will ask you several questions so I can assist in calculating the market size for your product or service. Please, wait until I generate questions',
          ));
          setState(() {});
          _model.financialplanold = await FinancialPlanCall.call(
            question: functions.stringToAPI(
                'Project\'s title: ${widget.project?.title}, project\'s description:${widget.project?.projectInformation?.description}, existing financial plan:${widget.textField}'),
          );
          if ((_model.financialplanold?.succeeded ?? true)) {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: getJsonField(
                (_model.financialplanold?.jsonBody ?? ''),
                r'''$.text''',
              ).toString().toString(),
            ));
            setState(() {});
          } else {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: 'Something went wrong. Please, try again later.',
            ));
            setState(() {});
          }
        }
      } else {
        if (widget.textField != null && widget.textField != '') {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Production plan\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: 'Your Production Plan:  ',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text: widget.textField,
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'How would you like to adjust your production plan? Share your thoughts, and I\'ll follow up with a few questions to understand your project better.',
          ));
          setState(() {});
        } else {
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'Hi, I am your personal business-assistant. I will help you in writing \"Production plan\"',
          ));
          setState(() {});
          _model.addToChat(ChatStruct(
            who: 'AI',
            text:
                'I will ask you several questions so I can assist in calculating the market size for your product or service. Please, wait until I generate questions',
          ));
          setState(() {});
          _model.productionplanold = await ProductionPlanCall.call(
            question: functions.stringToAPI(
                'Project\'s title: ${widget.project?.title}, project\'s description:${widget.project?.projectInformation?.description}, existing production plan: ${widget.textField}'),
          );
          if ((_model.productionplanold?.succeeded ?? true)) {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: getJsonField(
                (_model.productionplanold?.jsonBody ?? ''),
                r'''$.text''',
              ).toString().toString(),
            ));
            setState(() {});
          } else {
            _model.addToChat(ChatStruct(
              who: 'AI',
              text: 'Something went wrong. Please, try again later.',
            ));
            setState(() {});
          }
        }
      }

      await Future.delayed(const Duration(milliseconds: 100));
      await _model.columnController?.animateTo(
        _model.columnController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 140.0.ms,
            begin: Offset(0.0, -1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

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
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEFEFEF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional(0.0, 1.0),
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Builder(
                builder: (context) {
                  final messages = _model.chat.toList();
                  return SingleChildScrollView(
                    primary: false,
                    controller: _model.columnController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(messages.length, (messagesIndex) {
                        final messagesItem = messages[messagesIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (messagesItem.who == 'AI')
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Clipboard.setData(ClipboardData(
                                            text: messagesItem.text));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Message copied successfully',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.85,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(14.0),
                                          child: SelectionArea(
                                              child: Text(
                                            messagesItem.text,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (messagesItem.who == 'User')
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.85,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(8.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Text(
                                          messagesItem.text,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).addToEnd(SizedBox(height: 80.0)),
                    ),
                  );
                },
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
                    decoration: BoxDecoration(
                      color: Color(0xE8EFEFEF),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 10),
                                    () async {
                                      _model.message =
                                          _model.textController.text;
                                      setState(() {});
                                    },
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'LTSuperior',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    hintText: 'Enter your request',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 5,
                                  minLines: 1,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            if (_model.message != null && _model.message != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 4.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    FFIcons.kchat,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 18.0,
                                  ),
                                  onPressed: () async {
                                    if (widget.comeFrom == 'market size') {
                                      setState(() {
                                        _model.textController?.clear();
                                      });
                                      _model.addToChat(ChatStruct(
                                        who: 'User',
                                        text: _model.message,
                                      ));
                                      setState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      await _model.columnController?.animateTo(
                                        _model.columnController!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 10),
                                        curve: Curves.ease,
                                      );
                                      if (widget.textField != null &&
                                          widget.textField != '') {
                                        if (_model.chat
                                                .where((e) => e.who == 'User')
                                                .toList()
                                                .length ==
                                            0) {
                                          _model.marketSizeOld35 =
                                              await MarketSizeCall.call(
                                            question: functions.stringToAPI(
                                                'Project\'s title: ${widget.project?.title}, project\'s description:${widget.project?.projectInformation?.description}, existing market size: ${widget.textField}, user\'s thought about existing market size: ${_model.message}'),
                                          );
                                          if ((_model
                                                  .marketSizeOld35?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.marketSizeOld35
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        } else {
                                          _model.marketSizOld56 =
                                              await MarketSizeCall.call(
                                            question: functions
                                                .stringToAPI(_model.message),
                                          );
                                          if ((_model
                                                  .marketSizOld56?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.marketSizOld56
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            await _model.columnController
                                                ?.animateTo(
                                              _model.columnController!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 10),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        }
                                      } else {
                                        _model.marketSiszeOld68 =
                                            await MarketSizeCall.call(
                                          question: functions
                                              .stringToAPI(_model.message),
                                        );
                                        if ((_model
                                                .marketSiszeOld68?.succeeded ??
                                            true)) {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text: getJsonField(
                                              (_model.marketSiszeOld68
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.text''',
                                            ).toString(),
                                          ));
                                          setState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          await _model.columnController
                                              ?.animateTo(
                                            _model.columnController!.position
                                                .maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 10),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text:
                                                'Something went wrong. Please, try again later.',
                                          ));
                                          setState(() {});
                                        }
                                      }
                                    } else if (widget.comeFrom ==
                                        'monetization') {
                                      setState(() {
                                        _model.textController?.clear();
                                      });
                                      _model.addToChat(ChatStruct(
                                        who: 'User',
                                        text: _model.message,
                                      ));
                                      setState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      await _model.columnController?.animateTo(
                                        _model.columnController!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 10),
                                        curve: Curves.ease,
                                      );
                                      if (widget.textField != null &&
                                          widget.textField != '') {
                                        if (_model.chat
                                                .where((e) => e.who == 'User')
                                                .toList()
                                                .length ==
                                            0) {
                                          _model.monetizationChat =
                                              await MonetizationCall.call(
                                            question: functions.stringToAPI(
                                                'Project\'s title: ${widget.project?.title}, project\'s description:${widget.project?.projectInformation?.description}, existing market size: ${widget.textField}, user\'s thought about existing market size: ${_model.message}'),
                                          );
                                          if ((_model.monetizationChat
                                                  ?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.monetizationChat
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        } else {
                                          _model.monetizationChat4 =
                                              await MonetizationCall.call(
                                            question: functions
                                                .stringToAPI(_model.message),
                                          );
                                          if ((_model.monetizationChat4
                                                  ?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.monetizationChat4
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            await _model.columnController
                                                ?.animateTo(
                                              _model.columnController!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 10),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        }
                                      } else {
                                        _model.monetizationChat5 =
                                            await MonetizationCall.call(
                                          question: functions
                                              .stringToAPI(_model.message),
                                        );
                                        if ((_model
                                                .monetizationChat5?.succeeded ??
                                            true)) {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text: getJsonField(
                                              (_model.monetizationChat5
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.text''',
                                            ).toString(),
                                          ));
                                          setState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          await _model.columnController
                                              ?.animateTo(
                                            _model.columnController!.position
                                                .maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 10),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text:
                                                'Something went wrong. Please, try again later.',
                                          ));
                                          setState(() {});
                                        }
                                      }
                                    } else if (widget.comeFrom ==
                                        'marketing plan') {
                                      setState(() {
                                        _model.textController?.clear();
                                      });
                                      _model.addToChat(ChatStruct(
                                        who: 'User',
                                        text: _model.message,
                                      ));
                                      setState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      await _model.columnController?.animateTo(
                                        _model.columnController!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 10),
                                        curve: Curves.ease,
                                      );
                                      if (widget.textField != null &&
                                          widget.textField != '') {
                                        if (_model.chat
                                                .where((e) => e.who == 'User')
                                                .toList()
                                                .length ==
                                            0) {
                                          _model.marketingplan4 =
                                              await MarketingPlanCall.call(
                                            question: functions
                                                .stringToAPI(_model.message),
                                          );
                                          if ((_model
                                                  .marketingplan4?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.marketingplan4
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        } else {
                                          _model.marketingplan5 =
                                              await MarketingPlanCall.call(
                                            question: functions
                                                .stringToAPI(_model.message),
                                          );
                                          if ((_model
                                                  .marketingplan5?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.marketingplan5
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            await _model.columnController
                                                ?.animateTo(
                                              _model.columnController!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 10),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        }
                                      } else {
                                        _model.marketingplan6 =
                                            await MarketingPlanCall.call(
                                          question: functions
                                              .stringToAPI(_model.message),
                                        );
                                        if ((_model.marketingplan6?.succeeded ??
                                            true)) {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text: getJsonField(
                                              (_model.marketingplan6
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.text''',
                                            ).toString(),
                                          ));
                                          setState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          await _model.columnController
                                              ?.animateTo(
                                            _model.columnController!.position
                                                .maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 10),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text:
                                                'Something went wrong. Please, try again later.',
                                          ));
                                          setState(() {});
                                        }
                                      }
                                    } else if (widget.comeFrom ==
                                        'financial plan') {
                                      setState(() {
                                        _model.textController?.clear();
                                      });
                                      _model.addToChat(ChatStruct(
                                        who: 'User',
                                        text: _model.message,
                                      ));
                                      setState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      await _model.columnController?.animateTo(
                                        _model.columnController!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 10),
                                        curve: Curves.ease,
                                      );
                                      if (widget.textField != null &&
                                          widget.textField != '') {
                                        if (_model.chat
                                                .where((e) => e.who == 'User')
                                                .toList()
                                                .length ==
                                            0) {
                                          _model.financialplan3 =
                                              await FinancialPlanCall.call(
                                            question: functions
                                                .stringToAPI(_model.message),
                                          );
                                          if ((_model
                                                  .financialplan3?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.financialplan3
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        } else {
                                          _model.financialplan4 =
                                              await FinancialPlanCall.call(
                                            question: functions
                                                .stringToAPI(_model.message),
                                          );
                                          if ((_model
                                                  .financialplan4?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.financialplan4
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            await _model.columnController
                                                ?.animateTo(
                                              _model.columnController!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 10),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        }
                                      } else {
                                        _model.financialplan5 =
                                            await FinancialPlanCall.call(
                                          question: functions
                                              .stringToAPI(_model.message),
                                        );
                                        if ((_model.financialplan5?.succeeded ??
                                            true)) {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text: getJsonField(
                                              (_model.financialplan5
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.text''',
                                            ).toString(),
                                          ));
                                          setState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          await _model.columnController
                                              ?.animateTo(
                                            _model.columnController!.position
                                                .maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 10),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text:
                                                'Something went wrong. Please, try again later.',
                                          ));
                                          setState(() {});
                                        }
                                      }
                                    } else {
                                      setState(() {
                                        _model.textController?.clear();
                                      });
                                      _model.addToChat(ChatStruct(
                                        who: 'User',
                                        text: _model.message,
                                      ));
                                      setState(() {});
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      await _model.columnController?.animateTo(
                                        _model.columnController!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 10),
                                        curve: Curves.ease,
                                      );
                                      if (widget.textField != null &&
                                          widget.textField != '') {
                                        if (_model.chat
                                                .where((e) => e.who == 'User')
                                                .toList()
                                                .length ==
                                            0) {
                                          _model.productionPlan3 =
                                              await ProductionPlanCall.call(
                                            question: functions
                                                .stringToAPI(_model.message),
                                          );
                                          if ((_model
                                                  .productionPlan3?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.productionPlan3
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        } else {
                                          _model.productionPlan4 =
                                              await ProductionPlanCall.call(
                                            question: functions
                                                .stringToAPI(_model.message),
                                          );
                                          if ((_model
                                                  .productionPlan4?.succeeded ??
                                              true)) {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text: getJsonField(
                                                (_model.productionPlan4
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.text''',
                                              ).toString(),
                                            ));
                                            setState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            await _model.columnController
                                                ?.animateTo(
                                              _model.columnController!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 10),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            _model.addToChat(ChatStruct(
                                              who: 'AI',
                                              text:
                                                  'Something went wrong. Please, try again later.',
                                            ));
                                            setState(() {});
                                          }
                                        }
                                      } else {
                                        _model.productionPlan5 =
                                            await ProductionPlanCall.call(
                                          question: functions
                                              .stringToAPI(_model.message),
                                        );
                                        if ((_model
                                                .productionPlan5?.succeeded ??
                                            true)) {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text: getJsonField(
                                              (_model.productionPlan5
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.text''',
                                            ).toString(),
                                          ));
                                          setState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          await _model.columnController
                                              ?.animateTo(
                                            _model.columnController!.position
                                                .maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 10),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          _model.addToChat(ChatStruct(
                                            who: 'AI',
                                            text:
                                                'Something went wrong. Please, try again later.',
                                          ));
                                          setState(() {});
                                        }
                                      }
                                    }

                                    setState(() {});
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'iconButtonOnPageLoadAnimation']!),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEFEFEF),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'Close',
                            options: FFButtonOptions(
                              width: 80.0,
                              height: 40.0,
                              padding: EdgeInsets.all(0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x00F7E445),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0x02000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (widget.comeFrom == 'market size') {
                                await widget.project!.reference
                                    .update(createProjectsRecordData(
                                  businessPlan: createProjectBusinessPlanStruct(
                                    marketSize: _model.chat.last.text,
                                    clearUnsetFields: false,
                                  ),
                                ));
                                _model.marketSize =
                                    await ProjectsRecord.getDocumentOnce(
                                        widget.project!.reference);

                                context.pushNamed(
                                  'createBusinessPlan',
                                  queryParameters: {
                                    'project': serializeParam(
                                      _model.marketSize,
                                      ParamType.Document,
                                    ),
                                    'initialPage': serializeParam(
                                      0,
                                      ParamType.int,
                                    ),
                                    'isUpdate': serializeParam(
                                      widget.isUpdate,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'project': _model.marketSize,
                                  },
                                );
                              } else if (widget.comeFrom == 'monetization') {
                                await widget.project!.reference
                                    .update(createProjectsRecordData(
                                  businessPlan: createProjectBusinessPlanStruct(
                                    monetization: _model.chat.last.text,
                                    clearUnsetFields: false,
                                  ),
                                ));
                                _model.marketSize2 =
                                    await ProjectsRecord.getDocumentOnce(
                                        widget.project!.reference);

                                context.pushNamed(
                                  'createBusinessPlan',
                                  queryParameters: {
                                    'project': serializeParam(
                                      _model.marketSize2,
                                      ParamType.Document,
                                    ),
                                    'initialPage': serializeParam(
                                      1,
                                      ParamType.int,
                                    ),
                                    'isUpdate': serializeParam(
                                      widget.isUpdate,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'project': _model.marketSize2,
                                  },
                                );
                              } else if (widget.comeFrom == 'marketing plan') {
                                await widget.project!.reference
                                    .update(createProjectsRecordData(
                                  businessPlan: createProjectBusinessPlanStruct(
                                    marketingPlan: _model.chat.last.text,
                                    clearUnsetFields: false,
                                  ),
                                ));
                                _model.marketSize3 =
                                    await ProjectsRecord.getDocumentOnce(
                                        widget.project!.reference);

                                context.pushNamed(
                                  'createBusinessPlan',
                                  queryParameters: {
                                    'project': serializeParam(
                                      _model.marketSize3,
                                      ParamType.Document,
                                    ),
                                    'initialPage': serializeParam(
                                      2,
                                      ParamType.int,
                                    ),
                                    'isUpdate': serializeParam(
                                      widget.isUpdate,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'project': _model.marketSize3,
                                  },
                                );
                              } else if (widget.comeFrom == 'financial plan') {
                                await widget.project!.reference
                                    .update(createProjectsRecordData(
                                  businessPlan: createProjectBusinessPlanStruct(
                                    financialPlan: _model.chat.last.text,
                                    clearUnsetFields: false,
                                  ),
                                ));
                                _model.marketSize4 =
                                    await ProjectsRecord.getDocumentOnce(
                                        widget.project!.reference);

                                context.pushNamed(
                                  'createBusinessPlan',
                                  queryParameters: {
                                    'project': serializeParam(
                                      _model.marketSize4,
                                      ParamType.Document,
                                    ),
                                    'initialPage': serializeParam(
                                      3,
                                      ParamType.int,
                                    ),
                                    'isUpdate': serializeParam(
                                      widget.isUpdate,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'project': _model.marketSize4,
                                  },
                                );
                              } else {
                                await widget.project!.reference
                                    .update(createProjectsRecordData(
                                  businessPlan: createProjectBusinessPlanStruct(
                                    productionPlan: _model.chat.last.text,
                                    clearUnsetFields: false,
                                  ),
                                ));
                                _model.marketSize5 =
                                    await ProjectsRecord.getDocumentOnce(
                                        widget.project!.reference);

                                context.pushNamed(
                                  'createBusinessPlan',
                                  queryParameters: {
                                    'project': serializeParam(
                                      _model.marketSize5,
                                      ParamType.Document,
                                    ),
                                    'initialPage': serializeParam(
                                      4,
                                      ParamType.int,
                                    ),
                                    'isUpdate': serializeParam(
                                      widget.isUpdate,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'project': _model.marketSize5,
                                  },
                                );
                              }

                              setState(() {});
                            },
                            text: 'Save',
                            options: FFButtonOptions(
                              width: 80.0,
                              height: 40.0,
                              padding: EdgeInsets.all(0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x00F7E445),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0x02000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: Color(0x24000000),
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
    );
  }
}
