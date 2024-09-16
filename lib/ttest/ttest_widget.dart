import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ttest_model.dart';
export 'ttest_model.dart';

class TtestWidget extends StatefulWidget {
  const TtestWidget({super.key});

  @override
  State<TtestWidget> createState() => _TtestWidgetState();
}

class _TtestWidgetState extends State<TtestWidget> {
  late TtestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TtestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              iconTheme: IconThemeData(color: Color(0x05000000)),
              automaticallyImplyLeading: true,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Text(
                    'Hello World',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'LTSuperior',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              centerTitle: false,
              elevation: 4.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Builder(
                  builder: (context) {
                    final wer = List.generate(random_data.randomInteger(15, 40),
                        (index) => random_data.randomInteger(0, 1000)).toList();

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(wer.length, (werIndex) {
                        final werItem = wer[werIndex];
                        return Text(
                          werItem.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'LTSuperior',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        );
                      }).divide(SizedBox(height: 80.0)),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
