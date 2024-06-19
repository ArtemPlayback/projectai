import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_block_model.dart';
export 'product_block_model.dart';

class ProductBlockWidget extends StatefulWidget {
  const ProductBlockWidget({
    super.key,
    required this.index,
    required this.productinfo,
  });

  final int? index;
  final ProductInfoAIStruct? productinfo;

  @override
  State<ProductBlockWidget> createState() => _ProductBlockWidgetState();
}

class _ProductBlockWidgetState extends State<ProductBlockWidget> {
  late ProductBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductBlockModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.productinfo?.type == 'text') {
        _model.trueState = 'Title and text';
        _model.updatePage(() {});
      } else if (widget.productinfo?.type == 'options') {
        _model.trueState = 'Options';
        _model.updatePage(() {});
      } else if (widget.productinfo?.type == 'map') {
        _model.trueState = 'Map';
        _model.updatePage(() {});
      } else {
        _model.trueState = 'Colors';
        _model.updatePage(() {});
      }

      setState(() {
        _model.dropDownValueController?.value = _model.trueState;
      });
    });

    _model.textController1 ??=
        TextEditingController(text: widget.productinfo?.title);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.productinfo?.text);
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Block ${((widget.index!) + 1).toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 35.0,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 19.0,
                    ),
                    onPressed: () async {
                      FFAppState().removeAtIndexFromProductInfo(widget.index!);
                      FFAppState().update(() {});
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController ??=
                    FormFieldController<String>(
                  _model.dropDownValue ??= _model.trueState,
                ),
                options: ['Title and text', 'Map', 'Colors'],
                onChanged: (val) async {
                  setState(() => _model.dropDownValue = val);
                  if (_model.dropDownValue == 'Title and text') {
                    _model.trueState = 'text';
                    setState(() {});
                    FFAppState().updateProductInfoAtIndex(
                      widget.index!,
                      (e) => e..type = _model.trueState,
                    );
                    FFAppState().update(() {});
                  } else if (_model.dropDownValue == 'Map') {
                    _model.trueState = 'map';
                    setState(() {});
                    FFAppState().updateProductInfoAtIndex(
                      widget.index!,
                      (e) => e..type = _model.trueState,
                    );
                    FFAppState().update(() {});
                  } else {
                    _model.trueState = 'color';
                    setState(() {});
                    FFAppState().updateProductInfoAtIndex(
                      widget.index!,
                      (e) => e..type = _model.trueState,
                    );
                    FFAppState().update(() {});
                  }
                },
                width: double.infinity,
                height: 45.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'LTSuperior',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                hintText: 'Please select...',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                elevation: 0.0,
                borderColor: FlutterFlowTheme.of(context).textAndStroke,
                borderWidth: 1.0,
                borderRadius: 10.0,
                margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                hidesUnderline: true,
                isOverButton: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (_model.trueState == 'text') {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController1',
                                Duration(milliseconds: 10),
                                () async {
                                  FFAppState().updateSectionsAtIndex(
                                    widget.index!,
                                    (e) =>
                                        e..title = _model.textController1.text,
                                  );
                                  FFAppState().update(() {});
                                },
                              ),
                              autofocus: false,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Section title',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      color: FlutterFlowTheme.of(context)
                                          .textAndStroke,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .textAndStroke,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).thirdText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).whiteBlur,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'LTSuperior',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController2',
                                  Duration(milliseconds: 10),
                                  () async {
                                    FFAppState().updateSectionsAtIndex(
                                      widget.index!,
                                      (e) =>
                                          e..text = _model.textController2.text,
                                    );
                                    FFAppState().update(() {});
                                  },
                                ),
                                autofocus: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Section text',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'LTSuperior',
                                        color: FlutterFlowTheme.of(context)
                                            .textAndStroke,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .textAndStroke,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .thirdText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).whiteBlur,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          18.0, 20.0, 18.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'LTSuperior',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                                maxLines: 5,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (_model.trueState == 'options') {
                    return Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    );
                  } else if (_model.trueState == 'map') {
                    return Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color(0xFFDDDDF3),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 12.0, 15.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 6.0, 0.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 18.0,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              (_model.placePickerValue
                                                                  .address !=
                                                              null &&
                                                          _model.placePickerValue
                                                                  .address !=
                                                              '') !=
                                                      false
                                                  ? _model
                                                      .placePickerValue.address
                                                  : 'Выберите местоположение',
                                              'd',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'LTSuperior',
                                                  color:
                                                      _model.placePickerValue !=
                                                              null
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.001,
                                  child: FlutterFlowPlacePicker(
                                    iOSGoogleMapsApiKey:
                                        'AIzaSyCBtpZrPcAqji_tZWGFZvrXY7q2DHrC5yk',
                                    androidGoogleMapsApiKey:
                                        'AIzaSyD7s4MbxzPSLvDvI5PEgNaaPtvbLCiWcjw',
                                    webGoogleMapsApiKey:
                                        'AIzaSyBb9qGEcU87nPm0uhZNTdje-WL8lCPAS6g',
                                    onSelect: (place) async {
                                      setState(() =>
                                          _model.placePickerValue = place);
                                      (await _model.googleMapsController.future)
                                          .animateCamera(CameraUpdate.newLatLng(
                                              place.latLng.toGoogleMaps()));
                                    },
                                    defaultText: 'Select Location',
                                    icon: Icon(
                                      Icons.place,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 16.0,
                                    ),
                                    buttonOptions: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40.0,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      elevation: 2.0,
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
                          ),
                          if (_model.placePickerValue != null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 270.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: FlutterFlowGoogleMap(
                                    controller: _model.googleMapsController,
                                    onCameraIdle: (latLng) =>
                                        _model.googleMapsCenter = latLng,
                                    initialLocation: _model.googleMapsCenter ??=
                                        _model.placePickerValue.latLng,
                                    markerColor: GoogleMarkerColor.violet,
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.standard,
                                    initialZoom: 14.0,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: true,
                                    showLocation: true,
                                    showCompass: false,
                                    showMapToolbar: false,
                                    showTraffic: false,
                                    centerMapOnMarkerTap: true,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final _colorPickedColor = await showFFColorPicker(
                                context,
                                currentColor: _model.colorPicked ??=
                                    Colors.black,
                                showRecentColors: true,
                                allowOpacity: true,
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                secondaryTextColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                primaryButtonBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                primaryButtonTextColor: Colors.white,
                                primaryButtonBorderColor: Colors.transparent,
                                displayAsBottomSheet: isMobileWidth(context),
                              );

                              if (_colorPickedColor != null) {
                                safeSetState(() =>
                                    _model.colorPicked = _colorPickedColor);
                              }

                              FFAppState().updateProductInfoAtIndex(
                                widget.index!,
                                (e) => e
                                  ..updateColors(
                                    (e) => e.add(_model.colorPicked!),
                                  ),
                              );
                              setState(() {});
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .textAndStroke,
                                ),
                              ),
                              child: Icon(
                                FFIcons.kadd,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                            ),
                          ),
                          if ((widget.productinfo?.colors != null &&
                                  (widget.productinfo?.colors)!.isNotEmpty) ==
                              true)
                            Builder(
                              builder: (context) {
                                final colors =
                                    widget.productinfo?.colors?.toList() ?? [];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(colors.length,
                                      (colorsIndex) {
                                    final colorsItem = colors[colorsIndex];
                                    return Container(
                                      width: 58.0,
                                      height: 58.0,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  colorsItem,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        360.0),
                                                border: Border.all(
                                                  color:
                                                      colorsItem == Colors.white
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0x00000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      22.0, 0.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: colorsItem,
                                                borderRadius: 20.0,
                                                borderWidth: 3.0,
                                                buttonSize: 28.0,
                                                fillColor: Color(0x9C000000),
                                                icon: Icon(
                                                  Icons.close_outlined,
                                                  color: Colors.white,
                                                  size: 11.0,
                                                ),
                                                onPressed: () async {
                                                  FFAppState()
                                                      .updateProductInfoAtIndex(
                                                    widget.index!,
                                                    (e) => e
                                                      ..updateColors(
                                                        (e) => e.remove(
                                                            _model.colorPicked),
                                                      ),
                                                  );
                                                  FFAppState().update(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).divide(SizedBox(width: 0.0)),
                                );
                              },
                            ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
