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

Future<List<ProjectsRecord>> queryProjects(DocumentReference user) async {
  // Add your function code here!
  final projectsRef = FirebaseFirestore.instance.collection('projects');

  // Query for projects where the user is a team member
  final querySnapshot = await projectsRef
      .where('team_members', arrayContains: {'user': user}).get();

  // Convert the query snapshot to a list of ProjectsRecord objects
  return querySnapshot.docs
      .map((doc) => ProjectsRecord.fromSnapshot(doc))
      .toList();
}
