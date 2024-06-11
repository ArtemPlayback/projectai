import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'sign_in': ParameterData.none(),
  'profile': ParameterData.none(),
  'pitchdeck': (data) async => ParameterData(
        allParams: {
          'project': await getDocumentParameter<ProjectsRecord>(
              data, 'project', ProjectsRecord.fromSnapshot),
          'from': getParameter<String>(data, 'from'),
        },
      ),
  'createPitchDeck': (data) async => ParameterData(
        allParams: {
          'project': await getDocumentParameter<ProjectsRecord>(
              data, 'project', ProjectsRecord.fromSnapshot),
          'update': getParameter<bool>(data, 'update'),
        },
      ),
  'ttest': ParameterData.none(),
  'createBusinessPlan': (data) async => ParameterData(
        allParams: {
          'project': await getDocumentParameter<ProjectsRecord>(
              data, 'project', ProjectsRecord.fromSnapshot),
          'initialPage': getParameter<int>(data, 'initialPage'),
          'isUpdate': getParameter<bool>(data, 'isUpdate'),
        },
      ),
  'createProjectImages': (data) async => ParameterData(
        allParams: {
          'project': await getDocumentParameter<ProjectsRecord>(
              data, 'project', ProjectsRecord.fromSnapshot),
        },
      ),
  'addPost': (data) async => ParameterData(
        allParams: {
          'project': await getDocumentParameter<ProjectsRecord>(
              data, 'project', ProjectsRecord.fromSnapshot),
          'post': await getDocumentParameter<PostsRecord>(
              data, 'post', PostsRecord.fromSnapshot),
          'isUpdate': getParameter<bool>(data, 'isUpdate'),
        },
      ),
  'imageGallery': (data) async => ParameterData(
        allParams: {
          'project': await getDocumentParameter<ProjectsRecord>(
              data, 'project', ProjectsRecord.fromSnapshot),
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
          'isProjectYours': getParameter<bool>(data, 'isProjectYours'),
        },
      ),
  'chats': ParameterData.none(),
  'chat_page': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
          'company': await getDocumentParameter<ProjectsRecord>(
              data, 'company', ProjectsRecord.fromSnapshot),
          'event': await getDocumentParameter<EventsRecord>(
              data, 'event', EventsRecord.fromSnapshot),
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
        },
      ),
  'onboarding': ParameterData.none(),
  'terms_of_service': ParameterData.none(),
  'smart_search_all': (data) async => ParameterData(
        allParams: {
          'chosen': getParameter<String>(data, 'chosen'),
        },
      ),
  'create_event': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<EventsRecord>(
              data, 'event', EventsRecord.fromSnapshot),
          'company': await getDocumentParameter<ProjectsRecord>(
              data, 'company', ProjectsRecord.fromSnapshot),
        },
      ),
  'event_page': (data) async => ParameterData(
        allParams: {
          'events': await getDocumentParameter<EventsRecord>(
              data, 'events', EventsRecord.fromSnapshot),
          'isFrom': getParameter<String>(data, 'isFrom'),
        },
      ),
  'sign_up': ParameterData.none(),
  'smart_search_all_2': (data) async => ParameterData(
        allParams: {
          'chosen': getParameter<String>(data, 'chosen'),
          'firstSearch': getParameter<String>(data, 'firstSearch'),
        },
      ),
  'create_product': (data) async => ParameterData(
        allParams: {
          'company': await getDocumentParameter<ProjectsRecord>(
              data, 'company', ProjectsRecord.fromSnapshot),
        },
      ),
  'product_page': (data) async => ParameterData(
        allParams: {
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
          'isFrom': getParameter<String>(data, 'isFrom'),
        },
      ),
  'create_product_loading': (data) async => ParameterData(
        allParams: {
          'document': await getDocumentParameter<ProductsRecord>(
              data, 'document', ProductsRecord.fromSnapshot),
        },
      ),
  'create_productCopy': ParameterData.none(),
  'create_project_1': ParameterData.none(),
  'create_project_2': ParameterData.none(),
  'edit_project': ParameterData.none(),
  'Create_Account': ParameterData.none(),
  'user_page': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'settings': ParameterData.none(),
  'company_page': (data) async => ParameterData(
        allParams: {
          'company': await getDocumentParameter<ProjectsRecord>(
              data, 'company', ProjectsRecord.fromSnapshot),
        },
      ),
  'information': ParameterData.none(),
  'event_settings': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<EventsRecord>(
              data, 'event', EventsRecord.fromSnapshot),
        },
      ),
  'participants': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<EventsRecord>(
              data, 'event', EventsRecord.fromSnapshot),
        },
      ),
  'product_settings': (data) async => ParameterData(
        allParams: {
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
        },
      ),
  'company_settings': (data) async => ParameterData(
        allParams: {
          'company': await getDocumentParameter<ProjectsRecord>(
              data, 'company', ProjectsRecord.fromSnapshot),
        },
      ),
  'chats_search': (data) async => ParameterData(
        allParams: {},
      ),
  'information_company': (data) async => ParameterData(
        allParams: {
          'company': await getDocumentParameter<ProjectsRecord>(
              data, 'company', ProjectsRecord.fromSnapshot),
        },
      ),
  'product_information': (data) async => ParameterData(
        allParams: {
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
        },
      ),
  'create_group_chat': (data) async => ParameterData(
        allParams: {},
      ),
  'create_group_chat_2': (data) async => ParameterData(
        allParams: {},
      ),
  'group_chat_page': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
        },
      ),
  'notifications': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
        },
      ),
  'wishlist': (data) async => ParameterData(
        allParams: {
          'chosen': getParameter<String>(data, 'chosen'),
          'firstSearch': getParameter<String>(data, 'firstSearch'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
