import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_expand_model.dart';
export 'video_expand_model.dart';

class VideoExpandWidget extends StatefulWidget {
  const VideoExpandWidget({
    super.key,
    required this.videoPath,
  });

  final String? videoPath;

  @override
  State<VideoExpandWidget> createState() => _VideoExpandWidgetState();
}

class _VideoExpandWidgetState extends State<VideoExpandWidget> {
  late VideoExpandModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoExpandModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xE6000000),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  custom_widgets.CustomVideoplayer(
                    width: double.infinity,
                    height: 300.0,
                    url: widget!.videoPath!,
                    playIcon: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    pauseIcon: FaIcon(
                      FontAwesomeIcons.pause,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).textAndStroke,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      buttonSize: 35.0,
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context, _model.imagesPage);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
