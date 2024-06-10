import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_fixed_size_model.dart';
export 'button_fixed_size_model.dart';

class ButtonFixedSizeWidget extends StatefulWidget {
  const ButtonFixedSizeWidget({
    super.key,
    required this.width,
    required this.height,
    required this.buttonColor,
    required this.text,
    this.action,
    this.borderColor,
    this.transparency,
    required this.fontsize,
    required this.textcolor,
    bool? showLoadingIndicator,
    this.icon,
  }) : this.showLoadingIndicator = showLoadingIndicator ?? false;

  final double? width;
  final double? height;
  final Color? buttonColor;
  final String? text;
  final Future Function()? action;
  final Color? borderColor;
  final double? transparency;
  final int? fontsize;
  final Color? textcolor;
  final bool showLoadingIndicator;
  final Widget? icon;

  @override
  State<ButtonFixedSizeWidget> createState() => _ButtonFixedSizeWidgetState();
}

class _ButtonFixedSizeWidgetState extends State<ButtonFixedSizeWidget>
    with TickerProviderStateMixin {
  late ButtonFixedSizeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonFixedSizeModel());

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 130.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.98, 0.98),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        if (animationsMap['buttonOnActionTriggerAnimation'] != null) {
          await animationsMap['buttonOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0)
              .whenComplete(animationsMap['buttonOnActionTriggerAnimation']!
                  .controller
                  .reverse);
        }
        await widget.action?.call();
      },
      text: widget.text!,
      icon: widget.icon,
      options: FFButtonOptions(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget.buttonColor,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'LTSuperior',
              color: widget.textcolor,
              fontSize: widget.fontsize?.toDouble(),
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              useGoogleFonts: false,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: valueOrDefault<Color>(
            widget.borderColor,
            Colors.transparent,
          ),
          width: 0.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ).animateOnActionTrigger(
      animationsMap['buttonOnActionTriggerAnimation']!,
    );
  }
}
