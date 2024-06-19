import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/event_card_small_widget.dart';
import '/components/navigationbar_widget.dart';
import '/components/product_card_small_widget.dart';
import '/components/project_small_card_widget.dart';
import '/components/usercard_small_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_in_foulder/new_project/button_infinity/button_infinity_widget.dart';
import '/sign_in_foulder/new_project/company_card/company_card_widget.dart';
import '/sign_in_foulder/new_project/event_card/event_card_widget.dart';
import '/sign_in_foulder/new_project/product_card/product_card_widget.dart';
import '/sign_in_foulder/new_project/user_card_new/user_card_new_widget.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'smart_search_all_widget.dart' show SmartSearchAllWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SmartSearchAllModel extends FlutterFlowModel<SmartSearchAllWidget> {
  ///  Local state fields for this page.

  String chosenState = 'All';

  String? projects;

  String? events;

  String? shop;

  String? people;

  String? news;

  bool isSmartSearch = false;

  bool showGIF = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, EventsRecord>? listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController3;
  Query? listViewPagingQuery3;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      listViewPagingController4;
  Query? listViewPagingQuery4;
  List<StreamSubscription?> listViewStreamSubscriptions4 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProjectsRecord>?
      listViewPagingController5;
  Query? listViewPagingQuery5;
  List<StreamSubscription?> listViewStreamSubscriptions5 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, EventsRecord>? listViewPagingController6;
  Query? listViewPagingQuery6;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController7;
  Query? listViewPagingQuery7;
  List<StreamSubscription?> listViewStreamSubscriptions7 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProjectsRecord>?
      listViewPagingController8;
  Query? listViewPagingQuery8;
  List<StreamSubscription?> listViewStreamSubscriptions8 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      listViewPagingController9;
  Query? listViewPagingQuery9;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_infinity component.
  late ButtonInfinityModel buttonInfinityModel;
  // Model for navigationbar component.
  late NavigationbarModel navigationbarModel;

  @override
  void initState(BuildContext context) {
    buttonInfinityModel = createModel(context, () => ButtonInfinityModel());
    navigationbarModel = createModel(context, () => NavigationbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    listViewPagingController3?.dispose();

    listViewStreamSubscriptions4.forEach((s) => s?.cancel());
    listViewPagingController4?.dispose();

    listViewStreamSubscriptions5.forEach((s) => s?.cancel());
    listViewPagingController5?.dispose();

    listViewPagingController6?.dispose();

    listViewStreamSubscriptions7.forEach((s) => s?.cancel());
    listViewPagingController7?.dispose();

    listViewStreamSubscriptions8.forEach((s) => s?.cancel());
    listViewPagingController8?.dispose();

    listViewPagingController9?.dispose();

    textFieldFocusNode?.dispose();
    textController?.dispose();

    buttonInfinityModel.dispose();
    navigationbarModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, EventsRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, EventsRecord> _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, UsersRecord> setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 8,
          isStream: false,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setListViewController4(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController4 ??= _createListViewController4(query, parent);
    if (listViewPagingQuery4 != query) {
      listViewPagingQuery4 = query;
      listViewPagingController4?.refresh();
    }
    return listViewPagingController4!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createListViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions4,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProjectsRecord> setListViewController5(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController5 ??= _createListViewController5(query, parent);
    if (listViewPagingQuery5 != query) {
      listViewPagingQuery5 = query;
      listViewPagingController5?.refresh();
    }
    return listViewPagingController5!;
  }

  PagingController<DocumentSnapshot?, ProjectsRecord>
      _createListViewController5(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProjectsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProjectsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions5,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EventsRecord> setListViewController6(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController6 ??= _createListViewController6(query, parent);
    if (listViewPagingQuery6 != query) {
      listViewPagingQuery6 = query;
      listViewPagingController6?.refresh();
    }
    return listViewPagingController6!;
  }

  PagingController<DocumentSnapshot?, EventsRecord> _createListViewController6(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 12,
          isStream: false,
        ),
      );
  }

  PagingController<DocumentSnapshot?, UsersRecord> setListViewController7(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController7 ??= _createListViewController7(query, parent);
    if (listViewPagingQuery7 != query) {
      listViewPagingQuery7 = query;
      listViewPagingController7?.refresh();
    }
    return listViewPagingController7!;
  }

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController7(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions7,
          controller: controller,
          pageSize: 12,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProjectsRecord> setListViewController8(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController8 ??= _createListViewController8(query, parent);
    if (listViewPagingQuery8 != query) {
      listViewPagingQuery8 = query;
      listViewPagingController8?.refresh();
    }
    return listViewPagingController8!;
  }

  PagingController<DocumentSnapshot?, ProjectsRecord>
      _createListViewController8(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProjectsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProjectsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions8,
          controller: controller,
          pageSize: 12,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setListViewController9(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController9 ??= _createListViewController9(query, parent);
    if (listViewPagingQuery9 != query) {
      listViewPagingQuery9 = query;
      listViewPagingController9?.refresh();
    }
    return listViewPagingController9!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createListViewController9(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 12,
          isStream: false,
        ),
      );
  }
}
