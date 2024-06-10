// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> openAIImages(
  List<String> imageUrls,
  String message,
) async {
  // Создаем список сообщений, начиная с текстового сообщения пользователя
  final List<Map<String, dynamic>> contentList = [
    {
      "type": "text",
      "text": message, // Текстовое сообщение от пользователя
    }
  ];

  // Добавляем URL изображений к списку сообщений
  imageUrls.forEach((imageUrl) {
    contentList.add({
      "type": "image_url",
      "image_url": {
        "url": imageUrl,
      },
    });
  });

  // Подготавливаем тело запроса
  final body = json.encode({
    "model": "gpt-4-turbo", // Используемая модель
    "messages": [
      {
        "role": "user",
        "content": contentList,
      }
    ],
  });

  // Заголовки запроса
  final headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer sk-proj-nYfdx3NmmyNbjmdfJDbFT3BlbkFJQ6TVTPF0AotKudiBUDvt', // Ваш API ключ
  };

  // Отправляем POST запрос
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/chat/completions'),
    headers: headers,
    body: body,
  );

  // Проверяем статус ответа и возвращаем результат
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    // В случае ошибки возвращаем пустой JSON
    print('Request failed with status: ${response.statusCode}.');
    return '{}';
  }
}
