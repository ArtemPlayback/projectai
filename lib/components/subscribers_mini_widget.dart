import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscribers_mini_model.dart';
export 'subscribers_mini_model.dart';

class SubscribersMiniWidget extends StatefulWidget {
  const SubscribersMiniWidget({
    super.key,
    required this.listUsers,
  });

  final List<DocumentReference>? listUsers;

  @override
  State<SubscribersMiniWidget> createState() => _SubscribersMiniWidgetState();
}

class _SubscribersMiniWidgetState extends State<SubscribersMiniWidget> {
  late SubscribersMiniModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscribersMiniModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.usersExist = await actions.checkUsersExists(
        widget!.listUsers?.toList(),
      );
      _model.usersExists2 = _model.usersExist!.toList().cast<String>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _model.usersExists2.isNotEmpty,
      child: Container(
        width: 64.0,
        child: Stack(
          children: [
            if (_model.usersExists2.length >= 3)
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (true) {
                      return Visibility(
                        visible: (_model.usersExists2.isNotEmpty) == true,
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Container(
                            width: 32.0,
                            height: 32.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                _model.usersExists2[2],
                                'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text(
                        'Hello World',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      );
                    }
                  },
                ),
              ),
            if (_model.usersExists2.length >= 2)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (true) {
                      return Visibility(
                        visible: (_model.usersExists2.isNotEmpty) == true,
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Container(
                            width: 32.0,
                            height: 32.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                _model.usersExists2[1],
                                'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text(
                        'Hello World',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      );
                    }
                  },
                ),
              ),
            if (_model.usersExists2.length >= 1)
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (true) {
                      return Visibility(
                        visible: (_model.usersExists2.isNotEmpty) == true,
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Container(
                            width: 32.0,
                            height: 32.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                _model.usersExists2[0],
                                'https://firebasestorage.googleapis.com/v0/b/avaai-c0e27.appspot.com/o/dimageenko_Flat_medium_gray_silhouette_of_a_person_from_the_sho_2f244edd-3317-46aa-80ca-f9b06476d361.png?alt=media&token=e63ae723-a3a6-4e0b-a7f1-51e6ffbf866f',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text(
                        'Hello World',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
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
