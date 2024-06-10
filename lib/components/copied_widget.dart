import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'copied_model.dart';
export 'copied_model.dart';

class CopiedWidget extends StatefulWidget {
  const CopiedWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<CopiedWidget> createState() => _CopiedWidgetState();
}

class _CopiedWidgetState extends State<CopiedWidget> {
  late CopiedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CopiedModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.pop(context);
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
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryText,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          valueOrDefault<String>(
            widget.text,
            'Copied!',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'LTSuperior',
                color: Colors.white,
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
        ),
      ),
    );
  }
}
