import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_notifications_model.dart';
export 'empty_notifications_model.dart';

class EmptyNotificationsWidget extends StatefulWidget {
  const EmptyNotificationsWidget({super.key});

  @override
  State<EmptyNotificationsWidget> createState() =>
      _EmptyNotificationsWidgetState();
}

class _EmptyNotificationsWidgetState extends State<EmptyNotificationsWidget> {
  late EmptyNotificationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyNotificationsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              FFIcons.knotifications,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 72.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'No notifciations',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: Text(
                'It seems that you don\'t have any recent activity.',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Manrope',
                      color: Color(0x78000000),
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
