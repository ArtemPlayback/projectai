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

import 'dart:math'; // Import math library

Future newCustomAction(List<ProjectsRecord>? projects) async {
  // Add your function code here!
  if (projects == null) return;

  final firestoreInstance = FirebaseFirestore.instance;
  final random = Random(); // Create a new Random instance

  // Define project types
  final List<String> projectTypes = [
    'IT-project',
    'Fin-tech',
    'Health-tech',
    'Edu-tech',
    'Agri-tech'
  ];

  for (var project in projects) {
    // Generate a random index
    final randomIndex = random.nextInt(projectTypes.length);
    // Get a random project type
    final randomProjectType = projectTypes[randomIndex];

    await firestoreInstance
        .collection('projects')
        .doc(project.reference.id)
        .update({'type': randomProjectType});
  }
}
