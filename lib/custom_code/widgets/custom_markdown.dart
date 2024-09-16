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

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;

class CustomMarkdown extends StatefulWidget {
  const CustomMarkdown({
    Key? key,
    this.width,
    this.height,
    this.text,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text;

  @override
  _CustomMarkdownState createState() => _CustomMarkdownState();
}

class _CustomMarkdownState extends State<CustomMarkdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      // Высота подстраивается автоматически
      child: SingleChildScrollView(
        child: MarkdownBody(
          data: widget.text?.replaceAll('\\n', '\n') ?? '',
          styleSheet: MarkdownStyleSheet(
            p: GoogleFonts.manrope(
              textStyle: TextStyle(fontSize: 16),
            ),
            h1: GoogleFonts.manrope(
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            h2: GoogleFonts.manrope(
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            h3: GoogleFonts.manrope(
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            h4: GoogleFonts.manrope(
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            h5: GoogleFonts.manrope(
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            h6: GoogleFonts.manrope(
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            em: GoogleFonts.manrope(
              textStyle: TextStyle(fontStyle: FontStyle.italic),
            ),
            strong: GoogleFonts.manrope(
              textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            blockquote: GoogleFonts.manrope(
              textStyle: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey[700]),
            ),
            code: GoogleFonts.manrope(
              textStyle: TextStyle(
                  fontFamily: 'monospace', backgroundColor: Colors.grey[200]),
            ),
            tableHead: GoogleFonts.manrope(
              textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            tableBody: GoogleFonts.manrope(
              textStyle: TextStyle(fontSize: 14),
            ),
          ),
          builders: {
            'table': TableElementBuilder(),
          },
        ),
      ),
    );
  }
}

class TableElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    if (element.tag == 'table') {
      return Table(
        border: TableBorder.all(color: Colors.black),
        children: element.children!.map<TableRow>((row) {
          final md.Element rowElement = row as md.Element;
          return TableRow(
            children: rowElement.children!.map<Widget>((cell) {
              final md.Element cellElement = cell as md.Element;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cellElement.textContent),
              );
            }).toList(),
          );
        }).toList(),
      );
    }
    return null;
  }
}
