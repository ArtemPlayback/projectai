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

import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class SlidableTile extends StatefulWidget {
  const SlidableTile({
    super.key,
    this.width,
    this.height,
    required this.title,
    required this.deadline,
    required this.status,
    required this.checkBoxIcon,
    required this.trashIcon,
    required this.delete,
    required this.updateStatus,
    required this.fontName,
  });

  final double? width;
  final double? height;
  final String title;
  final DateTime deadline;
  final bool status;
  final Widget checkBoxIcon;
  final Widget trashIcon;
  final Future<dynamic> Function() delete;
  final Future<dynamic> Function() updateStatus;
  final String fontName;

  @override
  State<SlidableTile> createState() => _SlidableTileState();
}

class _SlidableTileState extends State<SlidableTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _dragExtent = 0.0;
  final double _actionPaneWidth = 60.0; // ширина области с иконкой
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragExtent = math.max(0, details.primaryDelta! + _dragExtent);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });

    if (_dragExtent > _actionPaneWidth) {
      _controller.forward(from: 0.0).then((_) {
        _controller.reverse();
      });
    }

    setState(() {
      _dragExtent = 0.0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        setState(() {
          _isDragging = true;
        });
      },
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color(0xFFD34141),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              child: widget.trashIcon,
            ),
          ),
          Transform.translate(
            offset: Offset(-_dragExtent * _animation.value, 0),
            child: Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFF4F4F4),
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.hardEdge,
              child: Container(
                height: widget.height,
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: CustomMultiChildLayout(
                  delegate: _TileContentLayoutDelegate(),
                  children: [
                    LayoutId(
                      id: #checkBox,
                      child: GestureDetector(
                        onTap: () {
                          widget.updateStatus();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            color: widget.status
                                ? const Color(0xFF3BD326)
                                : const Color(0xFFF4F4F4),
                            alignment: Alignment.center,
                            child: widget.status ? widget.checkBoxIcon : null,
                          ),
                        ),
                      ),
                    ),
                    LayoutId(
                      id: #title,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: widget.fontName,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    LayoutId(
                      id: #deadline,
                      child: Text(
                        _getDeadlineText(),
                        style: TextStyle(
                          color: const Color(0xFFB0B0B0),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          fontFamily: widget.fontName,
                        ),
                      ),
                    ),
                    LayoutId(
                      id: #importantText,
                      child: Text(
                        'Important',
                        style: TextStyle(
                          color: const Color(0xFFB0B0B0),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          fontFamily: widget.fontName,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getDeadlineText() {
    return DateFormat('h:mm a').format(widget.deadline);
  }
}

class _TileContentLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    final checkBoxSize = layoutChild(
      #checkBox,
      const BoxConstraints.expand(width: 20, height: 20),
    );

    positionChild(
      #checkBox,
      const Offset(0, 0),
    );

    layoutChild(
      #title,
      BoxConstraints.tight(Size(size.width - checkBoxSize.width - 12, 17)),
    );

    const yOfTitle = 0.0;

    positionChild(
      #title,
      Offset(checkBoxSize.width + 12, yOfTitle),
    );

    final deadlineSize = layoutChild(
      #deadline,
      BoxConstraints(
        minHeight: 0,
        maxHeight: 14,
        minWidth: 0,
        maxWidth: size.width - checkBoxSize.width - 12,
      ),
    );

    positionChild(
      #deadline,
      Offset(
        checkBoxSize.width + 12,
        size.height - deadlineSize.height,
      ),
    );

    final importantSize = layoutChild(
      #importantText,
      BoxConstraints(
        minHeight: 0,
        maxHeight: 14,
        minWidth: 0,
        maxWidth: size.width - checkBoxSize.width - 12 - deadlineSize.width - 8,
      ),
    );

    positionChild(
      #importantText,
      Offset(
        checkBoxSize.width + 12 + deadlineSize.width + 8,
        size.height - importantSize.height,
      ),
    );
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, 35);
  }
}
