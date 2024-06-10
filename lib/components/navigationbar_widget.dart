import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigationbar_model.dart';
export 'navigationbar_model.dart';

class NavigationbarWidget extends StatefulWidget {
  const NavigationbarWidget({
    super.key,
    String? chosen,
  }) : this.chosen = chosen ?? 'Projects';

  final String chosen;

  @override
  State<NavigationbarWidget> createState() => _NavigationbarWidgetState();
}

class _NavigationbarWidgetState extends State<NavigationbarWidget> {
  late NavigationbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationbarModel());

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
          sigmaX: 18.0,
          sigmaY: 18.0,
        ),
        child: Container(
          width: double.infinity,
          height: isiOS ? 90.0 : 70.0,
          decoration: BoxDecoration(
            color: Color(0xF2FFFFFF),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'smart_search_all',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.kprojectsW,
                              color: widget.chosen != 'Smart Search'
                                  ? Color(0x80A3A3B3)
                                  : FlutterFlowTheme.of(context).primary,
                              size: 22.0,
                            ),
                            onPressed: true
                                ? null
                                : () {
                                    print('IconButton pressed ...');
                                  },
                          ),
                          Text(
                            'Smart Search',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  color: widget.chosen != 'Smart Search'
                                      ? Color(0x80A3A3B3)
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'chats',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.kmessages,
                              color: widget.chosen != 'Messages'
                                  ? Color(0x80A3A3B3)
                                  : FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            onPressed: true
                                ? null
                                : () {
                                    print('IconButton pressed ...');
                                  },
                          ),
                          Text(
                            'Messages',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  color: widget.chosen != 'Messages'
                                      ? Color(0x80A3A3B3)
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'profile',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.kuser,
                              color: widget.chosen != 'Profile'
                                  ? Color(0x80A3A3B3)
                                  : FlutterFlowTheme.of(context).primary,
                              size: 22.0,
                            ),
                            onPressed: true
                                ? null
                                : () {
                                    print('IconButton pressed ...');
                                  },
                          ),
                          Text(
                            'Profile',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'LTSuperior',
                                  color: widget.chosen != 'Profile'
                                      ? Color(0x80A3A3B3)
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
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
