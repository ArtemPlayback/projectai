import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'empty_chats_model.dart';
export 'empty_chats_model.dart';

class EmptyChatsWidget extends StatefulWidget {
  const EmptyChatsWidget({super.key});

  @override
  State<EmptyChatsWidget> createState() => _EmptyChatsWidgetState();
}

class _EmptyChatsWidgetState extends State<EmptyChatsWidget> {
  late EmptyChatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyChatsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 80.0, 20.0, 40.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Lottie.network(
            'https://lottie.host/030838c8-a02c-4cfb-95d4-c708c6b75b7b/l0kjwxUr38.json',
            width: 280.0,
            height: 240.0,
            fit: BoxFit.cover,
            animate: true,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: Text(
              'You haven\'t chatted with anyone yet',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('smart_search_all');
              },
              text: 'Pick user to chat',
              options: FFButtonOptions(
                width: double.infinity,
                height: 36.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Manrope',
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
