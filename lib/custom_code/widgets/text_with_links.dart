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

import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class TextWithLinks extends StatefulWidget {
  const TextWithLinks({
    Key? key,
    this.width,
    this.height,
    this.text,
    this.textColor,
    this.linkColor,
    this.textSize,
    this.textWeight,
    this.linkWeight,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text;
  final Color? textColor;
  final Color? linkColor;
  final double? textSize;
  final int? textWeight;
  final int? linkWeight;

  @override
  State<TextWithLinks> createState() => _TextWithLinksState();
}

class _TextWithLinksState extends State<TextWithLinks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: RichText(
        text: _linkify(widget.text ?? ''),
      ),
    );
  }

  TextSpan _linkify(String text) {
    final RegExp linkRegExp = RegExp(
      r'((https?:\/\/|www\.)[\w-]+\.[\w./?=&-]+)',
      caseSensitive: false,
    );

    final List<TextSpan> spans = [];
    final matches = linkRegExp.allMatches(text);

    int lastMatchEnd = 0;
    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: TextStyle(
            fontFamily: 'primary',
            color: widget.textColor ?? FlutterFlowTheme.of(context).primaryText,
            fontSize: widget.textSize ?? 14,
            fontWeight: _convertToFontWeight(widget.textWeight ?? 400),
          ),
        ));
      }

      final url = text.substring(match.start, match.end);
      spans.add(
        TextSpan(
          text: url,
          style: TextStyle(
            fontFamily: 'primary',
            color: widget.linkColor ?? Colors.blue,
            fontSize: widget.textSize ?? 14,
            fontWeight: _convertToFontWeight(widget.linkWeight ?? 600),
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
        ),
      );

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: TextStyle(
          fontFamily: 'primary',
          color: widget.textColor ?? FlutterFlowTheme.of(context).primaryText,
          fontSize: widget.textSize ?? 14,
          fontWeight: _convertToFontWeight(widget.textWeight ?? 400),
        ),
      ));
    }

    return TextSpan(children: spans);
  }

  FontWeight _convertToFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }
}
