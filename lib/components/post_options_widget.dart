import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_options_model.dart';
export 'post_options_model.dart';

class PostOptionsWidget extends StatefulWidget {
  const PostOptionsWidget({
    super.key,
    required this.timestamp,
    this.project,
    this.images,
    required this.post,
  });

  final DateTime? timestamp;
  final ProjectsRecord? project;
  final List<String>? images;
  final PostsRecord? post;

  @override
  State<PostOptionsWidget> createState() => _PostOptionsWidgetState();
}

class _PostOptionsWidgetState extends State<PostOptionsWidget> {
  late PostOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostOptionsModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 150.0, 0.0),
      child: Container(
        width: 180.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);

                        context.pushNamed(
                          'addPost',
                          queryParameters: {
                            'project': serializeParam(
                              widget.project,
                              ParamType.Document,
                            ),
                            'post': serializeParam(
                              widget.post,
                              ParamType.Document,
                            ),
                            'isUpdate': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'project': widget.project,
                            'post': widget.post,
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              FFIcons.kpencil1,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Edit post',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: Color(0x18000000),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.post!.reference.delete();
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kbasket,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 18.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Delete post',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
