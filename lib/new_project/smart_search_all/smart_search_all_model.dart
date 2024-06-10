import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/event_card_small_widget.dart';
import '/components/navigationbar_widget.dart';
import '/components/project_small_card_widget.dart';
import '/components/usercard_small_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/new_project/button_infinity/button_infinity_widget.dart';
import '/new_project/company_card/company_card_widget.dart';
import '/new_project/event_card/event_card_widget.dart';
import '/new_project/user_card_new/user_card_new_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'smart_search_all_widget.dart' show SmartSearchAllWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

  PagingController<DocumentSnapshot?, EventsRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProjectsRecord>?
      listViewPagingController4;
  Query? listViewPagingQuery4;
  List<StreamSubscription?> listViewStreamSubscriptions4 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, EventsRecord>? listViewPagingController5;
  Query? listViewPagingQuery5;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController6;
  Query? listViewPagingQuery6;
  List<StreamSubscription?> listViewStreamSubscriptions6 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProjectsRecord>?
      listViewPagingController7;
  Query? listViewPagingQuery7;
  List<StreamSubscription?> listViewStreamSubscriptions7 = [];

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
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();

    listViewStreamSubscriptions4.forEach((s) => s?.cancel());
    listViewPagingController4?.dispose();

    listViewPagingController5?.dispose();

    listViewStreamSubscriptions6.forEach((s) => s?.cancel());
    listViewPagingController6?.dispose();

    listViewStreamSubscriptions7.forEach((s) => s?.cancel());
    listViewPagingController7?.dispose();

    textFieldFocusNode?.dispose();
    textController?.dispose();

    buttonInfinityModel.dispose();
    navigationbarModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, EventsRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, EventsRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, EventsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryEventsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, UsersRecord> setListViewController2(
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

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setListViewController3(
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

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProjectsRecord> setListViewController4(
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

  PagingController<DocumentSnapshot?, ProjectsRecord>
      _createListViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProjectsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProjectsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions4,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, EventsRecord> setListViewController5(
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

  PagingController<DocumentSnapshot?, EventsRecord> _createListViewController5(
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

  PagingController<DocumentSnapshot?, UsersRecord> setListViewController6(
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

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController6(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions6,
          controller: controller,
          pageSize: 12,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProjectsRecord> setListViewController7(
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

  PagingController<DocumentSnapshot?, ProjectsRecord>
      _createListViewController7(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProjectsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProjectsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions7,
          controller: controller,
          pageSize: 12,
          isStream: true,
        ),
      );
  }
}
