// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> sendEmailWebhook(
  String email,
  int verificationCode,
) async {
  // Add your function code here!
  final uri =
      Uri.parse('https://hook.eu1.make.com/c4ye1734k90qtczw08b0x4v6o7ifkpy5');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'email': email,
    'verificationCode': verificationCode,
  });

  try {
    final response = await http.post(uri, headers: headers, body: body);

    // Проверяем, успешно ли выполнен запрос
    if (response.statusCode == 200) {
      // Здесь можно добавить дополнительную логику обработки успешного ответа, если необходимо
      return true;
    } else {
      // Логгирование или обработка ошибки
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  } catch (e) {
    // Обработка исключения при отправке запроса
    print('Exception sending webhook: $e');
    return false;
  }
}
