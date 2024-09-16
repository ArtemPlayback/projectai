import '/backend/schema/structs/index.dart';
import '/components/search_item_preview_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'short_list_model.dart';
export 'short_list_model.dart';

class ShortListWidget extends StatefulWidget {
  const ShortListWidget({
    super.key,
    this.searchItems,
  });

  final List<SearchItemStruct>? searchItems;

  @override
  State<ShortListWidget> createState() => _ShortListWidgetState();
}

class _ShortListWidgetState extends State<ShortListWidget>
    with TickerProviderStateMixin {
  late ShortListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShortListModel());

    animationsMap.addAll({
      'searchItemPreviewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 490.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
        child: Builder(
          builder: (context) {
            final smartSearch = widget!.searchItems?.toList() ?? [];

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(smartSearch.length, (smartSearchIndex) {
                  final smartSearchItem = smartSearch[smartSearchIndex];
                  return SearchItemPreviewWidget(
                    key: Key(
                        'Key46x_${smartSearchIndex}_of_${smartSearch.length}'),
                    searchItem: smartSearchItem,
                  ).animateOnPageLoad(
                      animationsMap['searchItemPreviewOnPageLoadAnimation']!);
                })
                    .divide(SizedBox(width: 10.0))
                    .addToStart(SizedBox(width: 20.0))
                    .addToEnd(SizedBox(width: 20.0)),
              ),
            );
          },
        ),
      ),
    );
  }
}
