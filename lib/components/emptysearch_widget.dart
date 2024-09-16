import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'emptysearch_model.dart';
export 'emptysearch_model.dart';

class EmptysearchWidget extends StatefulWidget {
  const EmptysearchWidget({super.key});

  @override
  State<EmptysearchWidget> createState() => _EmptysearchWidgetState();
}

class _EmptysearchWidgetState extends State<EmptysearchWidget> {
  late EmptysearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptysearchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Lottie.asset(
            'assets/lottie_animations/Animation_-_1700144822143.json',
            height: 120.0,
            fit: BoxFit.contain,
            animate: true,
          ),
        ),
        Text(
          'AI couldn\'t find anything relevant ',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'LTSuperior',
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
        ),
      ],
    );
  }
}
