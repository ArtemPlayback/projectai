import '/components/component_search_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'textfield_comp_model.dart';
export 'textfield_comp_model.dart';

class TextfieldCompWidget extends StatefulWidget {
  const TextfieldCompWidget({
    super.key,
    required this.action,
  });

  final Future Function()? action;

  @override
  State<TextfieldCompWidget> createState() => _TextfieldCompWidgetState();
}

class _TextfieldCompWidgetState extends State<TextfieldCompWidget> {
  late TextfieldCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextfieldCompModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Container(
            height: 38.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'LTSuperior',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                hintText: 'Search',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'LTSuperior',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                filled: true,
                fillColor: Color(0x41A3A3B3),
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 8.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'LTSuperior',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await widget.action?.call();
          },
          child: wrapWithModel(
            model: _model.componentSearchModel,
            updateCallback: () => setState(() {}),
            child: ComponentSearchWidget(),
          ),
        ),
      ],
    );
  }
}
