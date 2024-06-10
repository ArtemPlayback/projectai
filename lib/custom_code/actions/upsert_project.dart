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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future upsertProject(
  String? projectName,
  String? projectDescription,
) async {
  final url =
      'https://ava.app.n8n.cloud/webhook-test/88b864c4-f63e-4e60-8a52-9fd598051c09';

  final body = {
    'project_name': projectName,
    'project_description': projectDescription,
  };

  await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );
}
