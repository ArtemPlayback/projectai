import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'role_choose_model.dart';
export 'role_choose_model.dart';

class RoleChooseWidget extends StatefulWidget {
  const RoleChooseWidget({super.key});

  @override
  State<RoleChooseWidget> createState() => _RoleChooseWidgetState();
}

class _RoleChooseWidgetState extends State<RoleChooseWidget> {
  late RoleChooseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoleChooseModel());

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
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 30.0,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 15.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
            Text(
              'ROLE IN THE PROJECT',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'LTSuperior',
                    fontSize: 32.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
