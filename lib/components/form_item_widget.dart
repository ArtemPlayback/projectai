import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'form_item_model.dart';
export 'form_item_model.dart';

class FormItemWidget extends StatefulWidget {
  const FormItemWidget({
    super.key,
    required this.question,
    required this.index,
    required this.updatePagestate,
  });

  final QuestionsStruct? question;
  final int? index;
  final Future Function()? updatePagestate;

  @override
  State<FormItemWidget> createState() => _FormItemWidgetState();
}

class _FormItemWidgetState extends State<FormItemWidget> {
  late FormItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormItemModel());

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
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.question?.question,
                          'title',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                      TextSpan(
                        text: '  (optional) ',
                        style: TextStyle(
                          color: Color(0xFFB2B2C1),
                        ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ],
          ),
          if (widget.question?.description != null &&
              widget.question?.description != '')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 24.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.question?.description,
                  'e',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'LTSuperior',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.question?.type == 'textfield') {
                            return TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 20),
                                () async {
                                  FFAppState().updateQuestionsAtIndex(
                                    widget.index!,
                                    (e) =>
                                        e..answer = _model.textController.text,
                                  );
                                  setState(() {});
                                  await widget.updatePagestate?.call();
                                },
                              ),
                              autofocus: false,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Start writing',
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
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    18.0, 15.0, 18.0, 15.0),
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
                              maxLines: null,
                              minLines: 1,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            );
                          } else if (widget.question?.type == 'choice_chips') {
                            return Builder(
                              builder: (context) {
                                if (widget.question?.isMultiselect ?? false) {
                                  return FlutterFlowChoiceChips(
                                    options: widget.question!.options
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) async {
                                      setState(() =>
                                          _model.choiceChipsValues1 = val);
                                      FFAppState().updateQuestionsAtIndex(
                                        widget.index!,
                                        (e) => e
                                          ..multipleAnswer = _model
                                              .choiceChipsValues1!
                                              .toList(),
                                      );
                                      setState(() {});
                                      await widget.updatePagestate?.call();
                                    },
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      iconColor: Color(0x02000000),
                                      iconSize: 1.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15.0, 4.0, 15.0, 4.0),
                                      elevation: 0.0,
                                      borderWidth: 1.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      iconColor: Color(0x00000000),
                                      iconSize: 0.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15.0, 4.0, 15.0, 4.0),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    chipSpacing: 8.0,
                                    rowSpacing: 8.0,
                                    multiselect: true,
                                    initialized:
                                        _model.choiceChipsValues1 != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController1 ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: true,
                                  );
                                } else {
                                  return FlutterFlowChoiceChips(
                                    options: widget.question!.options
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) async {
                                      setState(() => _model.choiceChipsValue2 =
                                          val?.firstOrNull);
                                      FFAppState().updateQuestionsAtIndex(
                                        widget.index!,
                                        (e) => e
                                          ..answer = _model.choiceChipsValue2,
                                      );
                                      setState(() {});
                                      await widget.updatePagestate?.call();
                                    },
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      iconColor: Color(0x02000000),
                                      iconSize: 1.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15.0, 4.0, 15.0, 4.0),
                                      elevation: 0.0,
                                      borderWidth: 1.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'LTSuperior',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      iconColor: Color(0x00000000),
                                      iconSize: 0.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15.0, 4.0, 15.0, 4.0),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    chipSpacing: 8.0,
                                    rowSpacing: 8.0,
                                    multiselect: false,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController2 ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: true,
                                  );
                                }
                              },
                            );
                          } else if (widget.question?.type == 'map') {
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
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0xFFDDDDF3),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 12.0, 15.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 6.0, 0.0),
                                                  child: Icon(
                                                    Icons.location_on,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                              .placePickerValue
                                                              .address
                                                          : 'Выберите местоположение',
                                                      'd',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'LTSuperior',
                                                          color: _model
                                                                      .placePickerValue !=
                                                                  null
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                              setState(() => _model
                                                  .placePickerValue = place);
                                              (await _model.googleMapsController
                                                      .future)
                                                  .animateCamera(
                                                      CameraUpdate.newLatLng(
                                                          place.latLng
                                                              .toGoogleMaps()));
                                            },
                                            defaultText: 'Select Location',
                                            icon: Icon(
                                              Icons.place,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 16.0,
                                            ),
                                            buttonOptions: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'LTSuperior',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 270.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: FlutterFlowGoogleMap(
                                            controller:
                                                _model.googleMapsController,
                                            onCameraIdle: (latLng) => _model
                                                .googleMapsCenter = latLng,
                                            initialLocation: _model
                                                    .googleMapsCenter ??=
                                                _model.placePickerValue.latLng,
                                            markerColor:
                                                GoogleMarkerColor.violet,
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
                                      final _colorPickedColor =
                                          await showFFColorPicker(
                                        context,
                                        currentColor: _model.colorPicked ??=
                                            Colors.black,
                                        showRecentColors: true,
                                        allowOpacity: true,
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        secondaryTextColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        primaryButtonBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        primaryButtonTextColor: Colors.white,
                                        primaryButtonBorderColor:
                                            Colors.transparent,
                                        displayAsBottomSheet:
                                            isMobileWidth(context),
                                      );

                                      if (_colorPickedColor != null) {
                                        safeSetState(() => _model.colorPicked =
                                            _colorPickedColor);
                                      }

                                      FFAppState()
                                          .addToColors(_model.colorPicked!);
                                      FFAppState().updateQuestionsAtIndex(
                                        widget.index!,
                                        (e) => e
                                          ..updateColors(
                                            (e) => e.add(_model.colorPicked!),
                                          ),
                                      );
                                      setState(() {});
                                      await widget.updatePagestate?.call();
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(360.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .textAndStroke,
                                        ),
                                      ),
                                      child: Icon(
                                        FFIcons.kadd,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final colors =
                                          widget.question?.colors?.toList() ??
                                              [];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(colors.length,
                                            (colorsIndex) {
                                          final colorsItem =
                                              colors[colorsIndex];
                                          return Container(
                                            width: 58.0,
                                            height: 58.0,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        colorsItem,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              360.0),
                                                      border: Border.all(
                                                        color: colorsItem ==
                                                                Colors.white
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
                                                            : Color(0x00000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(22.0, 0.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: colorsItem,
                                                      borderRadius: 20.0,
                                                      borderWidth: 2.0,
                                                      buttonSize: 28.0,
                                                      fillColor:
                                                          Color(0xBA000000),
                                                      icon: Icon(
                                                        Icons.close_outlined,
                                                        color: Colors.white,
                                                        size: 11.0,
                                                      ),
                                                      onPressed: () async {
                                                        FFAppState()
                                                            .updateQuestionsAtIndex(
                                                          widget.index!,
                                                          (e) => e
                                                            ..updateColors(
                                                              (e) => e.remove(
                                                                  colorsItem),
                                                            ),
                                                        );
                                                        FFAppState()
                                                            .update(() {});
                                                        await widget
                                                            .updatePagestate
                                                            ?.call();
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
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ),
        ],
      ),
    );
  }
}
