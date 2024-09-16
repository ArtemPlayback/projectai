import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'video_expand_widget.dart' show VideoExpandWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoExpandModel extends FlutterFlowModel<VideoExpandWidget> {
  ///  Local state fields for this component.

  List<String> imagesPage = [];
  void addToImagesPage(String item) => imagesPage.add(item);
  void removeFromImagesPage(String item) => imagesPage.remove(item);
  void removeAtIndexFromImagesPage(int index) => imagesPage.removeAt(index);
  void insertAtIndexInImagesPage(int index, String item) =>
      imagesPage.insert(index, item);
  void updateImagesPageAtIndex(int index, Function(String) updateFn) =>
      imagesPage[index] = updateFn(imagesPage[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
