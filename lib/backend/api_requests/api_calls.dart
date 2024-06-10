import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Create Products Group Code

class CreateProductsGroup {
  static String getBaseUrl() =>
      'https://project-s2vh.onrender.com/api/v1/prediction/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateQuestionsCall createQuestionsCall = CreateQuestionsCall();
  static CreateBlocksCall createBlocksCall = CreateBlocksCall();
}

class CreateQuestionsCall {
  Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final baseUrl = CreateProductsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create questions',
      apiUrl: '${baseUrl}369e8534-87e0-47d0-a018-0ed88e1f3103',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateBlocksCall {
  Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final baseUrl = CreateProductsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create blocks',
      apiUrl: '${baseUrl}ec40578e-ea22-42fb-8471-210cd85556fa',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Create Products Group Code

class ShortDescriptionCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'short description',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/b3b8db98-c271-49bb-9d6e-dba74d86d9ff',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SynonimsCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'synonims',
      apiUrl:
          'https://ava-ai-3vni.onrender.com/api/v1/prediction/3b9b7172-91a0-4890-8a5d-504b515ccac4',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ShortDescriptionCopyCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'short description Copy',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/dbb8de2e-ba90-4ed0-982a-4cb4a3d1a1b7',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AskCurrentProjCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}",
  "overrideConfig": {
    "text": "${text}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'askCurrentProj',
      apiUrl:
          'https://ava-ai-3vni.onrender.com/api/v1/prediction/84be1a2b-9bef-46f3-ab53-8ac22bd085c0',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchUpsertProjectCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? projectName = '',
    String? firestoreId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "What's my name?",
  "overrideConfig": {
    "text": "${text}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search upsert project',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/8aa35bd7-877a-4fa9-a484-7fa89180cf2b',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchUpsertNewsCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? projectName = '',
    String? firestoreId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "What's my name?",
  "overrideConfig": {
    "text": "${text}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search upsert news',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/8aa35bd7-877a-4fa9-a484-7fa89180cf2b',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchUpsertCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    dynamic? metadataJson,
  }) async {
    final metadata = _serializeJson(metadataJson);
    final ffApiRequestBody = '''
{
  "question": "${text}",
  "overrideConfig": {
    "text": "${text}",
    "metadata": ${metadata}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search upsert ',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/808e879b-a4a5-4643-9204-07d245f8bca2',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    dynamic? supabaseMetadataFilterJson,
  }) async {
    final supabaseMetadataFilter = _serializeJson(supabaseMetadataFilterJson);
    final ffApiRequestBody = '''
{
  "question": "${text}",
  "overrideConfig": {
    "text": "${text}",
    "metadata": ${supabaseMetadataFilter}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search ',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/188b40ce-5a18-45ac-8801-803724e3dad3',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchPeopleCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search people ',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/cac50b33-24b1-49b2-b452-d22caa4afd3d',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchNewsCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search news',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/8aa35bd7-877a-4fa9-a484-7fa89180cf2b',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ProblemDefinitionCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'problem definition',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/8d39448e-4567-4228-a7e9-8b680cecb103',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BusinessModelNameCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'business model name',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/68b54ee0-96e1-42a0-a521-1613f9a9e932',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BusinessModelDescriptionCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'business model description',
      apiUrl:
          'curl https://project-s2vh.onrender.com/api/v1/prediction/58f824af-4c0d-449d-9ec3-e5c39ea8b0eb',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class MessageToInvestorsCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'message to investors',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/8c882a0a-a2c1-4e7b-bca8-dce031194347',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class MarketNameCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'market name',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/cc695d3e-b712-4fa3-abd8-26162cd44cd0',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class MarketDescriptionCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'market description',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/18759ba5-426f-4e39-a033-36664b20c844',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class OperatingIndustryCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'operating industry',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/1cd95609-2f69-4202-80e0-0556740a7a8b',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PotentialMarketSizeCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Potential market size',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/e934ec1d-1e27-41fb-b9d6-7bb7f7671d3f',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class MonetizationCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'monetization',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/c9268b9f-7899-4422-aaaf-23e97eeed65f',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductionPlanCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'production plan',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/4b59ed62-a7ee-4d4f-9203-e3a3af10952e',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class MarketSizeCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'market size',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/ac1a470e-1046-415e-b9ba-8d67ac2b87d7',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FinancialPlanCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'financial plan',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/e84e3337-9cda-4c65-acca-92c079ca200c',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class MarketingPlanCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'marketing plan',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/6c411ece-3fc8-4af0-9402-a48dae669c64',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GeminiTestCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "who are you?"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'gemini test',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyDULAgRzAL7OhCW9WXQC8n1WckDdG207C8',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LlamaTestCall {
  static Future<ApiCallResponse> call({
    String? replicateApiToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "input": {
    "prompt": "Can you write a poem about open source machine learning?"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'llama test',
      apiUrl:
          'https://api.replicate.com/v1/models/meta/meta-llama-3-70b-instruct/predictions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${replicateApiToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class MakeHookCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? verificationCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "verificationCode": "${verificationCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'make hook',
      apiUrl: 'https://hook.eu1.make.com/c4ye1734k90qtczw08b0x4v6o7ifkpy5',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpsertVectorsNeightnCall {
  static Future<ApiCallResponse> call({
    String? upsertText = '',
    String? ownerType = '',
    String? owner = '',
    String? documentId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "upsert_text": "${upsertText}",
  "owner_type": "${ownerType}",
  "document_id": "${documentId}",
  "owner": "${owner}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'upsert vectors neightn',
      apiUrl:
          'https://primary-production-c4b7.up.railway.app/webhook/a9d58931-b35b-4ee5-a538-da7d171ce782',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchNeightnCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? userInfo = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "${text}",
  "user_info": "${userInfo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search neightn',
      apiUrl:
          'https://primary-production-c4b7.up.railway.app/webhook-test/a9d58931-b35b-4ee5-a538-da7d171ce782',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class QABotCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${text}",
  "overrideConfig": {
    "text": "${text}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'QA Bot',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/d840d03e-80f3-44bd-97f9-2aa7f0f3e15a',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
