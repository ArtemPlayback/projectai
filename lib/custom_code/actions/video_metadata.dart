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

import 'package:video_player/video_player.dart';

Future<int> videoMetadata(String videoUrl) async {
  try {
    // Инициализация контроллера видео с переданным URL
    final VideoPlayerController videoController =
        VideoPlayerController.network(videoUrl);

    // Загрузка видео
    await videoController.initialize();

    // Получение длительности видео в миллисекундах
    final duration = videoController.value.duration;

    // Закрытие контроллера, чтобы освободить ресурсы
    videoController.dispose();

    // Возвращаем длительность в секундах
    return duration.inSeconds;
  } catch (e) {
    // Обработка ошибок
    print('Ошибка при извлечении метаданных видео: $e');
    return 0;
  }
}
