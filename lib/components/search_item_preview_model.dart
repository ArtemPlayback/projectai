import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'search_item_preview_widget.dart' show SearchItemPreviewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchItemPreviewModel extends FlutterFlowModel<SearchItemPreviewWidget> {
  /// Query cache managers for this widget.

  final _eventComponentManager = FutureRequestManager<List<EventsRecord>>();
  Future<List<EventsRecord>> eventComponent({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EventsRecord>> Function() requestFn,
  }) =>
      _eventComponentManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventComponentCache() => _eventComponentManager.clear();
  void clearEventComponentCacheKey(String? uniqueKey) =>
      _eventComponentManager.clearRequest(uniqueKey);

  final _productComponentManager = FutureRequestManager<List<ProductsRecord>>();
  Future<List<ProductsRecord>> productComponent({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProductsRecord>> Function() requestFn,
  }) =>
      _productComponentManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductComponentCache() => _productComponentManager.clear();
  void clearProductComponentCacheKey(String? uniqueKey) =>
      _productComponentManager.clearRequest(uniqueKey);

  final _companyComponentManager = FutureRequestManager<List<ProjectsRecord>>();
  Future<List<ProjectsRecord>> companyComponent({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProjectsRecord>> Function() requestFn,
  }) =>
      _companyComponentManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCompanyComponentCache() => _companyComponentManager.clear();
  void clearCompanyComponentCacheKey(String? uniqueKey) =>
      _companyComponentManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearEventComponentCache();

    clearProductComponentCache();

    clearCompanyComponentCache();
  }
}
