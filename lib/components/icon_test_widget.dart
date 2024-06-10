import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_test_model.dart';
export 'icon_test_model.dart';

class IconTestWidget extends StatefulWidget {
  const IconTestWidget({
    super.key,
    required this.icon,
    required this.iconSize,
  });

  final Widget? icon;
  final double? iconSize;

  @override
  State<IconTestWidget> createState() => _IconTestWidgetState();
}

class _IconTestWidgetState extends State<IconTestWidget> {
  late IconTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconTestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon!;
  }
}
