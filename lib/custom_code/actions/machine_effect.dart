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

Future machineEffect() async {
  // List of texts to be displayed
  List<String> texts = [
    "What are the best places with russian food in Bali?",
    "Мне нужен технический директор в мой IT-стартап. Кого посоветуешь?",
    "Как думаешь, кто бы мог проинвестировать \$1млн в мой AI-стартап?",
    "Аренда вертолета для съемки фильма. Готов потратить не более 400\$ за 2 часа",
    "Нужна или микроволновка, или электрическая плита, или духовка. Помоги мне это найти"
  ];

  while (true) {
    for (String text in texts) {
      // Typing effect
      for (int i = 0; i <= text.length; i++) {
        double progress = i / text.length;
        double easeOutFactor = (1 - (1 - progress) * (1 - progress)) * 30;
        int delay = 50 + easeOutFactor.toInt();

        await Future.delayed(Duration(milliseconds: delay));
        FFAppState().update(() {
          FFAppState().hintText = text.substring(0, i);
        });
      }

      // Wait for 1.5 seconds before deleting
      await Future.delayed(Duration(milliseconds: 1500));

      // Deleting effect
      for (int i = text.length; i >= 0; i--) {
        await Future.delayed(Duration(milliseconds: 30));
        FFAppState().update(() {
          FFAppState().hintText = text.substring(0, i);
        });
      }
    }
  }
}
