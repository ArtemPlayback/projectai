import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SmartSearchAllWidget() : SignInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SmartSearchAllWidget()
              : SignInWidget(),
        ),
        FFRoute(
          name: 'sign_in',
          path: '/signIn',
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'pitchdeck',
          path: '/pitchdeck',
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => PitchdeckWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'createPitchDeck',
          path: '/createPitchDeck',
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CreatePitchDeckWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
            update: params.getParam(
              'update',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'ttest',
          path: '/ttest',
          builder: (context, params) => TtestWidget(),
        ),
        FFRoute(
          name: 'createBusinessPlan',
          path: '/createBusinessPlan',
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateBusinessPlanWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
            initialPage: params.getParam(
              'initialPage',
              ParamType.int,
            ),
            isUpdate: params.getParam(
              'isUpdate',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'createProjectImages',
          path: '/createProjectImages',
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateProjectImagesWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'addPost',
          path: '/addPost',
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
            'post': getDoc(['posts'], PostsRecord.fromSnapshot),
          },
          builder: (context, params) => AddPostWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
            post: params.getParam(
              'post',
              ParamType.Document,
            ),
            isUpdate: params.getParam(
              'isUpdate',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'imageGallery',
          path: '/imageGallery',
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
            'user': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ImageGalleryWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
            user: params.getParam(
              'user',
              ParamType.Document,
            ),
            isProjectYours: params.getParam(
              'isProjectYours',
              ParamType.bool,
            ),
            images: params.getParam<String>(
              'images',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'chats',
          path: '/chats',
          builder: (context, params) => ChatsWidget(),
        ),
        FFRoute(
          name: 'chat_page',
          path: '/chatPage',
          asyncParams: {
            'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
            'user': getDoc(['users'], UsersRecord.fromSnapshot),
            'company': getDoc(['projects'], ProjectsRecord.fromSnapshot),
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => ChatPageWidget(
            chat: params.getParam(
              'chat',
              ParamType.Document,
            ),
            user: params.getParam(
              'user',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.Document,
            ),
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: 'terms_of_service',
          path: '/termsOfService',
          builder: (context, params) => TermsOfServiceWidget(),
        ),
        FFRoute(
          name: 'smart_search_all',
          path: '/smartSearchAll',
          builder: (context, params) => SmartSearchAllWidget(
            chosen: params.getParam(
              'chosen',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'create_event',
          path: '/createEvent',
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
            'company': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateEventWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'event_page',
          path: '/eventPage',
          asyncParams: {
            'events': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventPageWidget(
            events: params.getParam(
              'events',
              ParamType.Document,
            ),
            text: params.getParam(
              'text',
              ParamType.JSON,
            ),
            isFrom: params.getParam(
              'isFrom',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'sign_up',
          path: '/signUp',
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: 'smart_search_allCopy',
          path: '/smartSearchAllCopy',
          builder: (context, params) => SmartSearchAllCopyWidget(
            chosen: params.getParam(
              'chosen',
              ParamType.String,
            ),
            firstSearch: params.getParam(
              'firstSearch',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'create_product',
          path: '/createProduct',
          asyncParams: {
            'company': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateProductWidget(
            company: params.getParam(
              'company',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'product_page',
          path: '/productPage',
          asyncParams: {
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => ProductPageWidget(
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
            isFrom: params.getParam(
              'isFrom',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'create_product_loading',
          path: '/createProductLoading',
          asyncParams: {
            'document': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateProductLoadingWidget(
            document: params.getParam(
              'document',
              ParamType.Document,
            ),
            answers: params.getParam<dynamic>(
              'answers',
              ParamType.JSON,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'create_productCopy',
          path: '/createProductCopy',
          builder: (context, params) => CreateProductCopyWidget(),
        ),
        FFRoute(
          name: 'create_project_1',
          path: '/createProject1',
          builder: (context, params) => CreateProject1Widget(),
        ),
        FFRoute(
          name: 'create_project_2',
          path: '/createProject2',
          builder: (context, params) => CreateProject2Widget(),
        ),
        FFRoute(
          name: 'edit_project',
          path: '/editProject',
          builder: (context, params) => EditProjectWidget(),
        ),
        FFRoute(
          name: 'Create_Account',
          path: '/createAccount',
          builder: (context, params) => CreateAccountWidget(),
        ),
        FFRoute(
          name: 'user_page',
          path: '/userPage',
          asyncParams: {
            'user': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => UserPageWidget(
            user: params.getParam(
              'user',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'settings',
          path: '/settings',
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'company_page',
          path: '/companyPage',
          asyncParams: {
            'company': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyPageWidget(
            company: params.getParam(
              'company',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'information',
          path: '/information',
          builder: (context, params) => InformationWidget(),
        ),
        FFRoute(
          name: 'event_settings',
          path: '/eventSettings',
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventSettingsWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'participants',
          path: '/participants',
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => ParticipantsWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'product_settings',
          path: '/productSettings',
          asyncParams: {
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => ProductSettingsWidget(
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'company_settings',
          path: '/companySettings',
          asyncParams: {
            'company': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CompanySettingsWidget(
            company: params.getParam(
              'company',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chats_search',
          path: '/chatsSearch',
          asyncParams: {
            'chats': getDocList(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ChatsSearchWidget(
            chats: params.getParam<ChatsRecord>(
              'chats',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'information_company',
          path: '/informationCompany',
          asyncParams: {
            'company': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => InformationCompanyWidget(
            company: params.getParam(
              'company',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'product_information',
          path: '/productInformation',
          asyncParams: {
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => ProductInformationWidget(
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'create_group_chat',
          path: '/createGroupChat',
          asyncParams: {
            'chats': getDocList(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateGroupChatWidget(
            chats: params.getParam<ChatsRecord>(
              'chats',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'create_group_chat_2',
          path: '/createGroupChat2',
          builder: (context, params) => CreateGroupChat2Widget(
            users: params.getParam<DocumentReference>(
              'users',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'group_chat_page',
          path: '/groupChatPage',
          asyncParams: {
            'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => GroupChatPageWidget(
            chat: params.getParam(
              'chat',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
