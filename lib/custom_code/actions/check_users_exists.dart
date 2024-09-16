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

Future<List<String>> checkUsersExists(
    List<DocumentReference>? listUsersRef) async {
  print('checkUsersExists called with listUsersRef: $listUsersRef');

  if (listUsersRef == null || listUsersRef.isEmpty) {
    print('List is null or empty, returning empty list.');
    return [];
  }

  List<String> photoUrls = [];

  // Получаем экземпляр Firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  for (int i = 0; i < listUsersRef.length; i += 5) {
    int end = (i + 5 > listUsersRef.length) ? listUsersRef.length : i + 5;
    List<DocumentReference> sublist = listUsersRef.sublist(i, end);

    print('Processing sublist: $sublist');

    List<Future<String?>> queryResults = sublist.map((ref) async {
      try {
        DocumentSnapshot doc = await ref.get();
        if (doc.exists && doc.data() != null) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          String? photoUrl = data['photo_url'] as String?;
          if (photoUrl != null) {
            print('Photo URL found: $photoUrl');
            return photoUrl;
          } else {
            print('No photo URL in document: ${ref.id}');
            return '';
          }
        } else {
          print('Document not found or empty: ${ref.id}');
          return '';
        }
      } catch (e) {
        print('Error fetching document ${ref.id}: $e');
        return '';
      }
    }).toList();

    List<String?> resolvedResults = await Future.wait(queryResults);

    // Добавляем даже пустые URL
    photoUrls.addAll(resolvedResults.map((url) => url ?? ''));

    print('Photo URLs found so far: ${photoUrls.length}');

    if (photoUrls.length >= 3) {
      print('3 or more photo URLs found, returning first 3');
      return photoUrls.sublist(0, 3);
    }
  }

  print('Returning all found photo URLs: ${photoUrls.length}');
  return photoUrls;
}
