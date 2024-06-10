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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference?> queryCollectionForChats(
  DocumentReference user1,
  DocumentReference user2,
) async {
  final query1 = FirebaseFirestore.instance
      .collection('chats')
      .where('users', isEqualTo: [user1, user2])
      .limit(1)
      .get();

  final query2 = FirebaseFirestore.instance
      .collection('chats')
      .where('users', isEqualTo: [user2, user1])
      .limit(1)
      .get();

  final results = await Future.wait([query1, query2]);

  for (var querySnapshot in results) {
    if (querySnapshot.docs.isNotEmpty) {
      // Возвращаем ссылку на первый найденный документ
      return querySnapshot.docs.first.reference;
    }
  }

  return null; // Если документ не найден, возвращаем null
}
