import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_small_model.dart';
export 'product_card_small_model.dart';

class ProductCardSmallWidget extends StatefulWidget {
  const ProductCardSmallWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final String? parameter1;
  final String? parameter2;
  final int? parameter3;
  final ProductsRecord? parameter4;

  @override
  State<ProductCardSmallWidget> createState() => _ProductCardSmallWidgetState();
}

class _ProductCardSmallWidgetState extends State<ProductCardSmallWidget> {
  late ProductCardSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.0, -1.0),
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pushNamed(
              'product_page',
              queryParameters: {
                'product': serializeParam(
                  widget.parameter4,
                  ParamType.Document,
                ),
                'isFrom': serializeParam(
                  'profile',
                  ParamType.String,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'product': widget.parameter4,
              },
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  widget.parameter1!,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    widget.parameter2!,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: Text(
                  '${widget.parameter3?.toString()}\$',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'LTSuperior',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional(1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
            child: AuthUserStreamWidget(
              builder: (context) => wrapWithModel(
                model: _model.toggleModel,
                updateCallback: () => setState(() {}),
                child: ToggleWidget(
                  boolean: (currentUserDocument?.saved?.toList() ?? [])
                          .where(
                              (e) => e.products == widget.parameter4?.reference)
                          .toList()
                          .length >
                      0,
                  toggleOn: () async {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'saved': FieldValue.arrayUnion([
                            getSavedFirestoreData(
                              updateSavedStruct(
                                SavedStruct(
                                  products: widget.parameter4?.reference,
                                ),
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        },
                      ),
                    });
                  },
                  toggleOff: () async {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'saved': FieldValue.arrayRemove([
                            getSavedFirestoreData(
                              updateSavedStruct(
                                SavedStruct(
                                  products: widget.parameter4?.reference,
                                ),
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        },
                      ),
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
