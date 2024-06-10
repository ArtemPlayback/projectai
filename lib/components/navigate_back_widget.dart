import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigate_back_model.dart';
export 'navigate_back_model.dart';

class NavigateBackWidget extends StatefulWidget {
  const NavigateBackWidget({
    super.key,
    required this.parameter1,
  });

  final String? parameter1;

  @override
  State<NavigateBackWidget> createState() => _NavigateBackWidgetState();
}

class _NavigateBackWidgetState extends State<NavigateBackWidget> {
  late NavigateBackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigateBackModel());

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
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 10.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          fillColor: Color(0x34000000),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 20.0,
          ),
          onPressed: () async {
            if (widget.parameter1 == 'smartsearch') {
              context.safePop();
            } else if (widget.parameter1 == 'profile') {
              context.safePop();
            } else {
              context.pushNamed('profile');
            }
          },
        ),
      ),
    );
  }
}
