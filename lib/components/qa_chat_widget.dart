import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qa_chat_model.dart';
export 'qa_chat_model.dart';

class QaChatWidget extends StatefulWidget {
  const QaChatWidget({
    super.key,
    required this.event,
  });

  final EventsRecord? event;

  @override
  State<QaChatWidget> createState() => _QaChatWidgetState();
}

class _QaChatWidgetState extends State<QaChatWidget>
    with TickerProviderStateMixin {
  late QaChatModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QaChatModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.eventchat = await queryAiChatsRecordOnce(
        queryBuilder: (aiChatsRecord) => aiChatsRecord
            .where(
              'event',
              isEqualTo: widget.event?.reference,
            )
            .where(
              'user',
              isEqualTo: currentUserReference,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.docref = _model.eventchat?.reference;
      setState(() {});
      if (_model.eventchat?.reference != null) {
        _model.chatmessages =
            _model.eventchat!.messages.toList().cast<ChatMessagesStruct>();
        setState(() {});
      } else {
        _model.addToChatmessages(ChatMessagesStruct(
          text: 'Zdarova',
          type: 'AI',
        ));
        setState(() {});

        var aiChatsRecordReference = AiChatsRecord.collection.doc();
        await aiChatsRecordReference.set({
          ...createAiChatsRecordData(
            user: currentUserReference,
            event: widget.event?.reference,
          ),
          ...mapToFirestore(
            {
              'messages': getChatMessagesListFirestoreData(
                _model.chatmessages,
              ),
            },
          ),
        });
        _model.aichat2 = AiChatsRecord.getDocumentFromData({
          ...createAiChatsRecordData(
            user: currentUserReference,
            event: widget.event?.reference,
          ),
          ...mapToFirestore(
            {
              'messages': getChatMessagesListFirestoreData(
                _model.chatmessages,
              ),
            },
          ),
        }, aiChatsRecordReference);
        _model.docref = _model.aichat2?.reference;
        setState(() {});
      }
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
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    final messages = _model.chatmessages.toList();
                    return SingleChildScrollView(
                      primary: false,
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(messages.length, (messagesIndex) {
                          final messagesItem = messages[messagesIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (messagesItem.type == 'AI')
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 6.0),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.85,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF6F6F6),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(2.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 10.0, 8.0, 10.0),
                                                child: Text(
                                                  messagesItem.text,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 6.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      'jm', messagesItem.when!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .a3a3b3,
                                                        fontSize: 9.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((messagesItem.from ==
                                        currentUserReference) &&
                                    (messagesItem.type == 'text'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 6.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          if (messagesItem.type == 'User')
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.85,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF007AFF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(2.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    10.0,
                                                                    8.0,
                                                                    10.0),
                                                        child: Text(
                                                          messagesItem.text,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    6.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'jm',
                                                              messagesItem
                                                                  .when!),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: Color(
                                                                    0xE7FFFFFF),
                                                                fontSize: 9.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
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
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 8.0),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 25.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF6D6BE7),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(14.0, 14.0,
                                                          10.0, 8.0),
                                                  child: Text(
                                                    messagesItem.text,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 8.0),
                                                    child: Text(
                                                      dateTimeFormat('Hm',
                                                          messagesItem.when!),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            color: Color(
                                                                0xE7FFFFFF),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 45.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF6D6BE7),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.robot,
                                                  color: Colors.white,
                                                  size: 15.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          );
                        })
                                .addToStart(SizedBox(height: 120.0))
                                .addToEnd(SizedBox(height: 95.0)),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 15.0,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xF4FFFFFF),
                          ),
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    0.0,
                                    0.0,
                                    valueOrDefault<double>(
                                      isiOS ? 30.0 : 8.0,
                                      0.0,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 12.0, 5.0, 12.0),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: double.infinity,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF9F9F9),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController',
                                                  Duration(milliseconds: 10),
                                                  () async {
                                                    _model.message = _model
                                                        .textController.text;
                                                    setState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  hintText: 'Write a message',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'LTSuperior',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .a3a3b3,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(15.0, 8.0,
                                                              15.0, 8.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                maxLines: 5,
                                                minLines: 1,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_model.textController.text != null &&
                                        _model.textController.text != '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            FFIcons.kchat,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 21.0,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              _model.textController?.clear();
                                            });
                                            _model.addToChatmessages(
                                                ChatMessagesStruct(
                                              text: _model.message,
                                              type: 'User',
                                            ));
                                            setState(() {});
                                            _model.qa = await QABotCall.call(
                                              text: functions
                                                  .stringToAPI(_model.message),
                                            );
                                            if ((_model.qa?.succeeded ??
                                                true)) {
                                              _model.addToChatmessages(
                                                  ChatMessagesStruct(
                                                text: getJsonField(
                                                  (_model.qa?.jsonBody ?? ''),
                                                  r'''$.response''',
                                                ).toString(),
                                                when: getCurrentTimestamp,
                                                type: 'AI',
                                              ));
                                              setState(() {});
                                              unawaited(
                                                () async {
                                                  await _model.docref!.update({
                                                    ...mapToFirestore(
                                                      {
                                                        'messages':
                                                            getChatMessagesListFirestoreData(
                                                          _model.chatmessages,
                                                        ),
                                                      },
                                                    ),
                                                  });
                                                }(),
                                              );
                                              await _model.columnController
                                                  ?.animateTo(
                                                _model.columnController!
                                                    .position.maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            } else {
                                              _model.addToChatmessages(
                                                  ChatMessagesStruct(
                                                text:
                                                    'An error occured. Please, try again later',
                                                when: getCurrentTimestamp,
                                                type: 'AI',
                                              ));
                                              setState(() {});
                                            }

                                            setState(() {});
                                          },
                                        ).animateOnPageLoad(animationsMap[
                                            'iconButtonOnPageLoadAnimation']!),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).textAndStroke,
                              borderRadius: 10.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 17.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'AI Bot',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 3.0, 0.0, 0.0),
                                    child: Text(
                                      'Last seen recently',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .a3a3b3,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 12.0, 0.0),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                widget.event!.eventInfo.images.first,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6EFFD),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6EFFD),
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
