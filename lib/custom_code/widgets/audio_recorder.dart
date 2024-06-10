// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class AudioRecorder extends StatefulWidget {
  const AudioRecorder({
    super.key,
    this.width,
    this.height,
    required this.finalAction,
    required this.icon,
    required this.wavesColor,
  });

  final double? width;
  final double? height;
  final Future Function() finalAction;
  final Widget icon;
  final Color wavesColor;

  @override
  State<AudioRecorder> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
