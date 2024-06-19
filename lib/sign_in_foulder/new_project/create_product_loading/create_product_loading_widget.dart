import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'create_product_loading_model.dart';
export 'create_product_loading_model.dart';

class CreateProductLoadingWidget extends StatefulWidget {
  const CreateProductLoadingWidget({
    super.key,
    required this.document,
    required this.answers,
  });

  final ProductsRecord? document;
  final List<dynamic>? answers;

  @override
  State<CreateProductLoadingWidget> createState() =>
      _CreateProductLoadingWidgetState();
}

class _CreateProductLoadingWidgetState
    extends State<CreateProductLoadingWidget> {
  late CreateProductLoadingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProductLoadingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultmga = await CreateProductsGroup.createBlocksCall.call(
        question: functions.stringToAPI(
            'title ${widget.document?.title}, description: ${widget.document?.description}, price: ${widget.document?.price?.toString()}, questions and answers: ${functions.stringToAPI(functions.jsonListToText(widget.answers?.toList()))}'),
      );

      if ((_model.apiResultmga?.succeeded ?? true)) {
        _model.gu = getJsonField(
          (_model.apiResultmga?.jsonBody ?? ''),
          r'''$.text''',
        ).toString().toString();
        setState(() {});
        _model.upsert = await UpsertVectorsNeightnCall.call(
          upsertText: functions.stringToAPI(
              'firebase_id:${widget.document?.customId}, type: product, title: ${widget.document?.title}, description: ${widget.document?.description}, price (dollars): ${widget.document?.price?.toString()}, additional informational blocks: ${functions.jsonListToText(functions.cleanJson(getJsonField(
                    (_model.apiResultmga?.jsonBody ?? ''),
                    r'''$.text''',
                  ).toString().toString()).toList())}'),
          ownerType:
              widget.document?.ownerPerson != null ? 'person' : 'company',
          owner: valueOrDefault<String>(
            widget.document?.ownerPerson != null
                ? widget.document?.ownerPerson?.id
                : widget.document?.ownerCompany?.id,
            'tst',
          ),
          documentId: valueOrDefault<String>(
            widget.document?.customId,
            '345435fds',
          ),
        );

        await Future.delayed(const Duration(milliseconds: 1000));
        unawaited(
          () async {
            await DocumentsTable().update(
              data: {
                'firebase_id': widget.document?.customId,
              },
              matchingRows: (rows) => rows.eq(
                'content',
                functions.stringToAPI(
                    'title: ${widget.document?.title}, description: ${widget.document?.description}, price (dollars): ${widget.document?.price?.toString()}, additional informational blocks: ${functions.jsonListToText(functions.cleanJson(getJsonField(
                          (_model.apiResultmga?.jsonBody ?? ''),
                          r'''$.text''',
                        ).toString().toString()).toList())}'),
              ),
            );
          }(),
        );

        await widget.document!.reference.update({
          ...mapToFirestore(
            {
              'product_info': getProductInfoAIListFirestoreData(
                functions
                    .cleanJson(getJsonField(
                      (_model.apiResultmga?.jsonBody ?? ''),
                      r'''$.text''',
                    ).toString().toString())
                    .map((e) => ProductInfoAIStruct.maybeFromMap(e))
                    .withoutNulls
                    .toList(),
              ),
            },
          ),
        });
        _model.updated =
            await ProductsRecord.getDocumentOnce(widget.document!.reference);

        context.pushNamed(
          'product_page',
          queryParameters: {
            'product': serializeParam(
              _model.updated,
              ParamType.Document,
            ),
            'isFrom': serializeParam(
              'create',
              ParamType.String,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'product': _model.updated,
          },
        );
      }
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Lottie.network(
                    'https://lottie.host/3ef6e011-d3b7-4302-bfa7-b8aff4341487/FT4UOUhvQH.json',
                    width: 420.0,
                    height: 420.0,
                    fit: BoxFit.fill,
                    animate: true,
                  ),
                ),
                SelectionArea(
                    child: Text(
                  'AI is creating your page...',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'LTSuperior',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
