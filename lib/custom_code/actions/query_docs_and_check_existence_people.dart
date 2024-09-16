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

Future<List<UsersRecord>> queryDocsAndCheckExistencePeople(
    List<DocumentReference> users) async {
  // Создаем пустой список для хранения существующих документов
  List<UsersRecord> existingUsers = [];

  // Проходим по каждой ссылке на документ
  for (var userRef in users) {
    try {
      // Пытаемся получить документ
      final docSnapshot = await userRef.get();

      // Если документ существует, добавляем его в список
      if (docSnapshot.exists) {
        existingUsers.add(UsersRecord.fromSnapshot(docSnapshot));
      }
    } catch (e) {
      // Если произошла ошибка при получении документа, пропускаем его
      print('Error fetching document ${userRef.path}: $e');
    }
  }

  // Возвращаем список существующих документов
  return existingUsers;
}
