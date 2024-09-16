// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';

class StaticVideoThumbnail extends StatefulWidget {
  const StaticVideoThumbnail({
    super.key,
    this.width,
    this.height,
    required this.videoUrl,
  });

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  State<StaticVideoThumbnail> createState() => _StaticVideoThumbnailState();
}

class _StaticVideoThumbnailState extends State<StaticVideoThumbnail> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Запуск для загрузки первого кадра
        _controller.pause(); // Остановка, чтобы оставить кадр статичным
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 200, // Высота по умолчанию, если не указана
      width: double
          .infinity, // Игнорируем переданный width, растягиваем на всю ширину
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(color: Colors.black), // Плейсхолдер до загрузки видео
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
