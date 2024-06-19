import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ttest_model.dart';
export 'ttest_model.dart';

class TtestWidget extends StatefulWidget {
  const TtestWidget({super.key});

  @override
  State<TtestWidget> createState() => _TtestWidgetState();
}

class _TtestWidgetState extends State<TtestWidget> {
  late TtestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TtestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.chevron_left_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('sign_in');
                    },
                  ),
                ),
                FlutterFlowAudioPlayer(
                  audio: Audio.network(
                    valueOrDefault<String>(
                      FFAppState().voiceMessageUrl,
                      'https://filesamples.com/samples/audio/mp3/sample3.mp3',
                    ),
                    metas: Metas(
                      id: 'sample3.mp3-09ea6869',
                    ),
                  ),
                  titleTextStyle:
                      FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'LTSuperior',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                  playbackDurationTextStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'LTSuperior',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  playbackButtonColor: FlutterFlowTheme.of(context).primary,
                  activeTrackColor: FlutterFlowTheme.of(context).alternate,
                  elevation: 4.0,
                  playInBackground:
                      PlayInBackground.disabledRestoreOnForeground,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 71.0,
                    child: custom_widgets.VoiceMessage(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 71.0,
                      audio: valueOrDefault<String>(
                        FFAppState().voiceMessageUrl,
                        'https://filesamples.com/samples/audio/mp3/sample3.mp3',
                      ),
                      playIcon: FaIcon(
                        FontAwesomeIcons.play,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      stopIcon: Icon(
                        Icons.pause_rounded,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      containerColor: FlutterFlowTheme.of(context).primary,
                      isRead: true,
                      readIcon1st: Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 15.0,
                      ),
                      readIcon2nd: Icon(
                        Icons.done_all,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 15.0,
                      ),
                      isLeft: true,
                      voiceMessageContainerColor: Color(0xFFF6F6F6),
                      audioWavesColor: FlutterFlowTheme.of(context).primary,
                      sentTime: getCurrentTimestamp,
                      messageId: 'werbfdt',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 71.0,
                    child: custom_widgets.VoiceMessage(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 71.0,
                      audio: valueOrDefault<String>(
                        FFAppState().voiceMessageUrl,
                        'https://filesamples.com/samples/audio/mp3/sample3.mp3',
                      ),
                      playIcon: FaIcon(
                        FontAwesomeIcons.play,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      stopIcon: Icon(
                        Icons.pause_rounded,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      containerColor: FlutterFlowTheme.of(context).primary,
                      isRead: true,
                      readIcon1st: Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 15.0,
                      ),
                      readIcon2nd: Icon(
                        Icons.done_all,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 15.0,
                      ),
                      isLeft: true,
                      voiceMessageContainerColor: Color(0xFFF6F6F6),
                      audioWavesColor: FlutterFlowTheme.of(context).primary,
                      sentTime: getCurrentTimestamp,
                      messageId: 'werbfdt234',
                    ),
                  ),
                ),
                if (_model.isSeen)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: custom_widgets.VoiceMessageRecorderWidget(
                      width: 50.0,
                      height: 50.0,
                      recordingIcon: Icon(
                        Icons.mic_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      setTextField: () async {
                        _model.isSeen = false;
                        setState(() {});
                      },
                    ),
                  ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.isSeen = true;
                    setState(() {});
                  },
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ),
                Text(
                  'Hello World',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'LTSuperior',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
