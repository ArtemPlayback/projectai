import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'toggle_model.dart';
export 'toggle_model.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({
    super.key,
    required this.boolean,
    required this.toggleOn,
    required this.toggleOff,
  });

  final bool? boolean;
  final Future Function()? toggleOn;
  final Future Function()? toggleOff;

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  late ToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToggleModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.boolean = widget.boolean!;
      _model.updatePage(() {});
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
          child: Builder(
            builder: (context) {
              if (!_model.boolean) {
                return FlutterFlowIconButton(
                  borderColor: Color(0x31C6C6D5),
                  borderRadius: 10.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  onPressed: () async {
                    if (_model.boolean) {
                      await widget.toggleOff?.call();
                      _model.boolean = false;
                      setState(() {});
                    } else {
                      await widget.toggleOn?.call();
                      _model.boolean = true;
                      setState(() {});
                    }
                  },
                );
              } else {
                return FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).textAndStroke,
                  borderRadius: 10.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  onPressed: () async {
                    if (_model.boolean) {
                      await widget.toggleOff?.call();
                      _model.boolean = false;
                      setState(() {});
                    } else {
                      await widget.toggleOn?.call();
                      _model.boolean = true;
                      setState(() {});
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
