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

Future<List<DocumentReference>> queryUsers(
  DocumentReference authuser,
  List<ChatsRecord> chats,
) async {
  // Initialize a list to hold user references
  List<DocumentReference> userRefs = [];

  // Iterate through each chat and collect all user references
  for (var chat in chats) {
    userRefs.addAll(chat.users);
  }

  // Convert the list of DocumentReferences to a set to remove duplicates
  Set<DocumentReference> uniqueUserRefs = userRefs.toSet();

  // Filter out the authuser reference
  uniqueUserRefs.remove(authuser);

  // Return the list of DocumentReferences, excluding the authuser
  return uniqueUserRefs.toList();
}
