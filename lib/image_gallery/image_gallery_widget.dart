import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/image_slider_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_gallery_model.dart';
export 'image_gallery_model.dart';

class ImageGalleryWidget extends StatefulWidget {
  const ImageGalleryWidget({
    super.key,
    this.project,
    this.user,
    bool? isProjectYours,
    required this.images,
  }) : this.isProjectYours = isProjectYours ?? false;

  final ProjectsRecord? project;
  final UsersRecord? user;
  final bool isProjectYours;
  final List<String>? images;

  @override
  State<ImageGalleryWidget> createState() => _ImageGalleryWidgetState();
}

class _ImageGalleryWidgetState extends State<ImageGalleryWidget> {
  late ImageGalleryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageGalleryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.images4 = widget.project != null
          ? widget.project!.images
          : (widget.user != null
                  ? widget.user!.images
                  : (currentUserDocument?.images?.toList() ?? []))
              .toList()
              .cast<String>();
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            final images = _model.images4.toList();
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 3.0,
                                mainAxisSpacing: 3.0,
                                childAspectRatio: 1.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: images.length,
                              itemBuilder: (context, imagesIndex) {
                                final imagesItem = images[imagesIndex];
                                return Stack(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      child: ImageSliderWidget(
                                                        images: widget.images!,
                                                        initialindex:
                                                            imagesIndex,
                                                        user: widget.user,
                                                        project: widget.project,
                                                        isThisYours: widget
                                                            .isProjectYours,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              imagesItem,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ].addToStart(SizedBox(height: 40.0)),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).mainThemeBlur,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 45.0,
                          fillColor: Colors.transparent,
                          icon: Icon(
                            Icons.chevron_left,
                            color: Color(0x8A000000),
                            size: 30.0,
                          ),
                          onPressed: () async {
                            if (widget.project != null) {
                              _model.fgg = await ProjectsRecord.getDocumentOnce(
                                  widget.project!.reference);
                            } else if (widget.user != null) {
                              context.safePop();
                            } else {
                              context.safePop();
                            }

                            setState(() {});
                          },
                        ),
                        Text(
                          'Images Gallery',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Color(0x8A000000),
                              size: 24.0,
                            ),
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                mediaSource: MediaSource.photoGallery,
                                multiImage: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFiles =
                                        selectedUploadedFiles;
                                    _model.uploadedFileUrls = downloadUrls;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }

                              _model.images4 = functions
                                  .imagesList(_model.uploadedFileUrls.toList(),
                                      _model.images4.toList())
                                  .toList()
                                  .cast<String>();
                              setState(() {});
                              if (widget.project != null) {
                                unawaited(
                                  () async {
                                    await widget.project!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'images': functions.imagesList(
                                              _model.uploadedFileUrls.toList(),
                                              _model.images4.toList()),
                                        },
                                      ),
                                    });
                                  }(),
                                );
                              } else {
                                unawaited(
                                  () async {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'images': functions.imagesList(
                                              _model.uploadedFileUrls.toList(),
                                              _model.images4.toList()),
                                        },
                                      ),
                                    });
                                  }(),
                                );
                              }
                            },
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
      ),
    );
  }
}
