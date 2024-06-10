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

import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart'; // Import for TapGestureRecognizer

class TextVisible extends StatefulWidget {
  const TextVisible({
    super.key,
    this.width,
    this.height,
    required this.messageObj,
    required this.onSeen,
    this.textColor = Colors.black, // Параметр для передачи цвета текста
    this.linkColor = Colors.blue, // Параметр для передачи цвета ссылки
    this.isLinkUnderlined = true, // Параметр для подчеркивания ссылок
  });

  final double? width;
  final double? height;
  final ChatMessagesStruct messageObj;
  final Future Function(String messageId) onSeen;
  final Color textColor;
  final Color linkColor;
  final bool isLinkUnderlined;

  @override
  State<TextVisible> createState() => _TextVisibleState();
}

class _TextVisibleState extends State<TextVisible> {
  bool isSeen = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget
          .messageObj.id), // Использование идентификатора сообщения для ключа
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5 && !isSeen) {
          setState(() {
            isSeen = true;
          });
          widget.onSeen(widget.messageObj
              .id); // Передача идентификатора сообщения в функцию onSeen
        }
      },
      child: _buildRichText(
          widget.messageObj.text ?? ''), // Отображение текста сообщения
    );
  }

  Widget _buildRichText(String text) {
    final words = text.split(' ');
    final spans = <TextSpan>[];

    for (var word in words) {
      if (_isUrl(word)) {
        spans.add(
          TextSpan(
            text: '$word ',
            style: TextStyle(
              color: widget.linkColor,
              decoration: widget.isLinkUnderlined
                  ? TextDecoration.underline
                  : TextDecoration
                      .none, // Использование параметра для подчеркивания
              fontFamily: 'LTSuperior',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                if (await canLaunch(word)) {
                  await launch(word);
                }
              },
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: '$word ',
            style: TextStyle(
              color: widget.textColor,
              fontFamily: 'LTSuperior',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        );
      }
    }

    return RichText(
      text: TextSpan(children: spans),
      maxLines: 4,
    );
  }

  bool _isUrl(String word) {
    final urlPattern = RegExp(
      r'^(http|https):\/\/[^\s$.?#].[^\s]*$',
      caseSensitive: false,
    );
    return urlPattern.hasMatch(word);
  }
}
