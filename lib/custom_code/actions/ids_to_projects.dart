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

Future<List<ProjectsRecord>?> idsToProjects(List<String>? firestoreIDs) async {
  if (firestoreIDs == null) {
    return null;
  }

  var documents = await Future.wait(
    firestoreIDs.map((id) =>
        FirebaseFirestore.instance.collection('projects').doc(id).get()),
  );

  return documents
      .where((snapshot) => snapshot.exists)
      .map((snapshot) => ProjectsRecord.fromSnapshot(snapshot))
      .toList();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
