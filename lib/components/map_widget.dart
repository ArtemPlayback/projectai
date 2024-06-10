import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_model.dart';
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    this.parameter1,
    required this.address,
  });

  final LatLng? parameter1;
  final String? address;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.googleMapsController.future.then(
        (c) => c.animateCamera(
          CameraUpdate.newLatLng(widget.parameter1!.toGoogleMaps()),
        ),
      );
    });

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await launchMap(
            address: widget.address,
            title: '',
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Builder(builder: (context) {
              final _googleMapMarker = widget.parameter1;
              return FlutterFlowGoogleMap(
                controller: _model.googleMapsController,
                onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                initialLocation: _model.googleMapsCenter ??=
                    LatLng(13.106061, -59.613158),
                markers: [
                  if (_googleMapMarker != null)
                    FlutterFlowMarker(
                      _googleMapMarker.serialize(),
                      _googleMapMarker,
                    ),
                ],
                markerColor: GoogleMarkerColor.violet,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 14.0,
                allowInteraction: true,
                allowZoom: false,
                showZoomControls: false,
                showLocation: true,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerMapOnMarkerTap: true,
              );
            }),
          ),
        ),
      ),
    );
  }
}
