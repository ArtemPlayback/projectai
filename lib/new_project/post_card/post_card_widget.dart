import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/image_slider_widget.dart';
import '/components/post_options_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_card_model.dart';
export 'post_card_model.dart';

class PostCardWidget extends StatefulWidget {
  const PostCardWidget({
    super.key,
    required this.post,
    this.user,
    bool? isAuthUser,
    this.project,
  }) : this.isAuthUser = isAuthUser ?? false;

  final PostsRecord? post;
  final UsersRecord? user;
  final bool isAuthUser;
  final ProjectsRecord? project;

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  late PostCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostCardModel());

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
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    if (widget.isAuthUser) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 18.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => ClipRRect(
                                    borderRadius: BorderRadius.circular(360.0),
                                    child: Image.network(
                                      currentUserPhoto,
                                      width: 47.0,
                                      height: 47.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          currentUserDisplayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'LTSuperior',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        dateTimeFormat('relative',
                                            widget.post!.postInfo.timestamp!),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .thirdText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.keyboard_control,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await showAlignedDialog(
                                    barrierColor: Color(0x71000000),
                                    context: context,
                                    isGlobal: false,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(
                                            1.0, -1.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: Container(
                                          height: 145.0,
                                          width: 322.0,
                                          child: PostOptionsWidget(
                                            project: widget.project,
                                            images:
                                                widget.post?.postInfo?.images,
                                            post: widget.post!,
                                            timestamp: widget
                                                .post!.postInfo.timestamp!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 18.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(360.0),
                                  child: Image.network(
                                    widget.user!.photoUrl,
                                    width: 47.0,
                                    height: 47.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget.user?.displayName,
                                          'Name',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        widget.post!.postInfo.timestamp!
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'LTSuperior',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .thirdText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (!widget.isAuthUser)
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Subscribe',
                                options: FFButtonOptions(
                                  height: 33.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00007AFF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'LTSuperior',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                    child: Text(
                      widget.post!.postInfo.text,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'LTSuperior',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.35,
                          ),
                    ),
                  ),
                ),
                if ((widget.post?.postInfo?.images != null &&
                        (widget.post?.postInfo?.images)!.isNotEmpty) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final images =
                            widget.post?.postInfo?.images?.toList() ?? [];
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).width - 40,
                          child: CarouselSlider.builder(
                            itemCount: images.length,
                            itemBuilder: (context, imagesIndex, _) {
                              final imagesItem = images[imagesIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Stack(
                                  children: [
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            barrierColor: Color(0x04000000),
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child: ImageSliderWidget(
                                                    images: widget
                                                        .post!.postInfo.images,
                                                    initialindex: imagesIndex,
                                                    user: widget.isAuthUser
                                                        ? null
                                                        : widget.user,
                                                    isThisYours: false,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            imagesItem,
                                            width: MediaQuery.sizeOf(context)
                                                    .width -
                                                40,
                                            height: MediaQuery.sizeOf(context)
                                                    .width -
                                                40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 26.0, 15.0, 0.0),
                                        child: Container(
                                          height: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x851D1D20),
                                            borderRadius:
                                                BorderRadius.circular(360.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '${(imagesIndex + 1).toString()}/${widget.post?.postInfo?.images?.length?.toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            carouselController: _model.carouselController ??=
                                CarouselController(),
                            options: CarouselOptions(
                              initialPage: max(0, min(0, images.length - 1)),
                              viewportFraction: 0.92,
                              disableCenter: true,
                              enlargeCenterPage: false,
                              enlargeFactor: 0.0,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: false,
                              onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                            ),
                          ),
                        );
                      },
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
