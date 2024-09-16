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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNameForUsersQueryCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create name for users query',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/360964d4-4fba-441c-9b52-d2b51eff3de5',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShortDescriptionUserCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'short description user',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/48e2fdb3-1e1b-4830-91f0-09f16053716f',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShortDescriptionCompanyCall {
  static Future<ApiCallResponse> call({
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'short description company',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/b2e4c4c2-4c6a-475a-94b5-d0bc4a7307dd',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      isStreamingApi: false,
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
      apiUrl:
          'https://primary-production-c4b7.up.railway.app/webhook/abee0f8d-cebe-4711-b072-5f80523cea2a',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
          'https://primary-production-c4b7.up.railway.app/webhook/210fba4c-acdb-449b-86ac-7da935210af4',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpsertVectorsTestsCall {
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
      callName: 'upsert vectors tests',
      apiUrl:
          'https://primary-production-c4b7.up.railway.app/webhook/210fba4c-acdb-449b-86ac-7da935210af4',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpsertVectorsMessagesCall {
  static Future<ApiCallResponse> call({
    String? chatId = '',
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "chat_id": "${chatId}",
  "text": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'upsert vectors messages',
      apiUrl:
          'https://primary-production-c4b7.up.railway.app/webhook/ff067384-5035-45d2-a535-b94283e69c1d',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchRetrieveVectorsCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? userInfo = '',
    String? currentTime = '',
    String? images = '',
    String? messages = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "${text}",
  "user_info": "${userInfo}",
  "messages": "${messages}",
  "images": "${images}",
  "current_time": "${currentTime}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search retrieve vectors',
      apiUrl:
          'https://primary-production-c4b7.up.railway.app/webhook-test/f10d2a34-25bf-408c-9e6f-25002aa43e4f',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchNeightnCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? userInfo = '',
    String? currentTime = '',
    String? images = '',
    String? messages = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "${text}",
  "user_info": "${userInfo}",
  "images": "${images}",
  "messages": "${messages}",
  "current_time": "${currentTime}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search neightn',
      apiUrl:
          'https://primary-production-c4b7.up.railway.app/webhook/f10d2a34-25bf-408c-9e6f-25002aa43e4f',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SingleSmartSearchCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? userInfo = '',
    String? currentTime = '',
    String? images = '',
    String? messages = '',
    String? promptsPlan = '',
    String? currentPrompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "${text}",
  "user_info": "${userInfo}",
  "images": "${images}",
  "messages": "${messages}",
  "prompts_plan": "${promptsPlan}",
  "current_prompt": "${currentPrompt}",
  "current_time": "${currentTime}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'single smart search',
      apiUrl:
          'https://primary-production-c4b7.up.railway.app/webhook/4e6e5838-e1de-4228-9b9a-27cf431c87b0',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SmartSearchMessagesCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? chatId = '',
    String? userId = '',
    String? chatMessages = '',
    String? userInformation = '',
    dynamic? supabaseMetadataFilterJson,
  }) async {
    final supabaseMetadataFilter = _serializeJson(supabaseMetadataFilterJson);
    final ffApiRequestBody = '''
{
  "question": "${text}, your user's id is ${userId}, you need to answer to him",
  "overrideConfig": {
    "user_id": "${userId}",
    "sessionId": "${chatId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'smart search messages',
      apiUrl:
          'https://project-s2vh.onrender.com/api/v1/prediction/6c3f0a46-da88-4c57-8251-d2cd4ee611c6',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
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
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OpenAIGptBigCall {
  static Future<ApiCallResponse> call({
    dynamic? messagesJson,
  }) async {
    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "model": "gpt-4o",
  "temperature": 0.6,
  "stream": true,
  "messages": ${messages}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OpenAI gpt big',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

class OpenAIComplexityDefinitionCall {
  static Future<ApiCallResponse> call({
    dynamic? messagesJson,
  }) async {
    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "model": "gpt-4o-mini-2024-07-18",
  "messages": ${messages},
  "response_format": {
    "type": "json_schema",
    "json_schema": {
      "name": "complexity definition",
      "description": "defines wether user's request is complex or not",
      "schema": {
        "type": "object",
        "properties": {
          "complexity": {
            "type": "string"
          }
        },
        "required": [
          "complexity"
        ],
        "additionalProperties": false
      },
      "strict": true
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OpenAI complexity definition',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
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
