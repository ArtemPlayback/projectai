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

Future updateCompetitors(
  List<CompetitorsStruct>? appState,
  List<String>? comparisonOptions,
  int? competitorIndex,
  int? optionIndex,
  String? updatedText,
  bool isOptionUpdate,
) async {
  if (appState == null || comparisonOptions == null) return;

  if (isOptionUpdate) {
    // Обновление конкретной опции для всех компетиторов
    for (var competitor in appState) {
      if (optionIndex != null && optionIndex < competitor.options.length) {
        competitor.options[optionIndex].option = updatedText ?? "";
      }
    }
  } else {
    // Обновление опций при изменении имени компетитора
    if (competitorIndex != null && competitorIndex < appState.length) {
      List<CompetitorOptionsStruct> optionStructs = comparisonOptions
          .map(
            (option) =>
                CompetitorOptionsStruct(option: option, presence: false),
          )
          .toList();
      appState[competitorIndex].options = optionStructs;
    }
  }

  FFAppState().update(() {
    FFAppState().competitors = appState;
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
