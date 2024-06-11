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

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

class VoiceMessage extends StatefulWidget {
  const VoiceMessage({
    super.key,
    this.width,
    this.height,
    required this.audio,
    required this.playIcon,
    required this.stopIcon,
    required this.containerColor,
    required this.isRead,
    required this.readIcon1st,
    required this.readIcon2nd,
    required this.isLeft,
    required this.voiceMessageContainerColor,
    required this.audioWavesColor,
    required this.sentTime,
  });

  final double? width;
  final double? height;
  final String audio;
  final Widget playIcon;
  final Widget stopIcon;
  final Color containerColor;
  final bool isRead;
  final Widget readIcon1st;
  final Widget readIcon2nd;
  final bool isLeft;
  final Color voiceMessageContainerColor;
  final Color audioWavesColor;
  final DateTime sentTime;

  @override
  State<VoiceMessage> createState() => _VoiceMessageState();
}

class _VoiceMessageState extends State<VoiceMessage> {
  late final _VoiceMessageController controller;

  double? sliderValue;

  @override
  void initState() {
    controller = _VoiceMessageController(audioLink: widget.audio);
    controller.init();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: controller.isLoading,
      child: Container(
        height: 71,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.voiceMessageContainerColor,
            borderRadius: BorderRadius.circular(10)
                .copyWith(bottomLeft: Radius.circular(widget.isLeft ? 2 : 10))
                .copyWith(
                    bottomRight: Radius.circular(widget.isLeft ? 10 : 2))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  LayoutBuilder(
                    builder: (context, c) {
                      return GestureDetector(
                        onTap: controller.togglePlay,
                        child: Container(
                          height: c.maxHeight,
                          width: c.maxHeight,
                          decoration: BoxDecoration(
                            color: widget.containerColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          alignment: Alignment.center,
                          child: controller.isPlaying
                              ? widget.stopIcon
                              : widget.playIcon,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: LayoutBuilder(builder: (context, c) {
                      final maxWidth = c.maxWidth;
                      return GestureDetector(
                        onHorizontalDragDown: (details) {
                          controller.audioPlayer.pause();
                          setState(() {
                            sliderValue = (details.localPosition.dx / maxWidth)
                                .clamp(0, 1);
                          });
                        },
                        onHorizontalDragUpdate: (details) {
                          setState(() {
                            sliderValue = (details.localPosition.dx / maxWidth)
                                .clamp(0, 1);
                          });
                        },
                        onHorizontalDragEnd: (_) {
                          controller.seekToPercent(sliderValue!);
                          setState(() {
                            sliderValue = null;
                          });
                          controller.audioPlayer.play();
                        },
                        child: Container(
                          color: widget.voiceMessageContainerColor
                              .withOpacity(0.0001),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              Expanded(
                                child: _Waveforms(
                                  data: controller.waveformsData,
                                  fakeData: controller.fakeWaveformsData,
                                  showPercentages: sliderValue != null ||
                                      controller.isPlaying ||
                                      controller.showPercentages,
                                  percentage: sliderValue != null
                                      ? sliderValue!
                                      : controller.playedPercentage,
                                  color: widget.audioWavesColor,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                controller.formattedDuration,
                                style: const TextStyle(
                                  color: Color(0xFFC6C6D5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 3),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: LayoutBuilder(
                builder: (context, c) {
                  if (!controller.isLoading) return const SizedBox();
                  return SizedBox(
                    height: c.maxHeight,
                    width: c.maxHeight,
                    child: _ProgressCircle(
                      percentage: controller.loadingProgress,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formattedSentTime(),
                      style: const TextStyle(
                        color: Color(0xFFC6C6D5),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    widget.isRead ? widget.readIcon1st : widget.readIcon2nd,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formattedSentTime() {
    final format = DateFormat('HH:mm');
    return format.format(widget.sentTime);
  }
}

class _Waveforms extends StatelessWidget {
  const _Waveforms({
    required this.percentage,
    required this.data,
    required this.fakeData,
    required this.showPercentages,
    required this.color,
  });

  final List<double> data;
  final List<double> fakeData;
  final bool showPercentages;
  final double percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;
        final maxWidth = constraints.maxWidth;
        final maxTilesCount = ((maxWidth + 1) / 4).floor();

        if (data.isEmpty) {
          return Row(
            children: List.generate(maxTilesCount, (index) {
              return Expanded(
                child: Center(
                  child: Container(
                    width: 3,
                    height: maxHeight * fakeData[index],
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              );
            }),
          );
        }

        final everyWhat = (data.length / maxTilesCount).ceil();
        var resultData = data;
        if (everyWhat >= 1) {
          resultData = <double>[];
          for (var i = 0; i < data.length; i++) {
            if (i % everyWhat == 0) {
              resultData.add(data[i]);
            }
          }
        }
        final lastActiveTile = (resultData.length * percentage).round();
        final maxValue = resultData.max;
        return Row(
          children: List.generate(
            resultData.length,
            (index) {
              final value = resultData[index];
              bool isFilled = false;
              if (!showPercentages) {
                isFilled = true;
              } else if (index <= lastActiveTile && percentage != 0) {
                isFilled = true;
              }

              return Expanded(
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 3,
                    decoration: BoxDecoration(
                      color: color.withOpacity(isFilled ? 1 : 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: value * maxHeight / maxValue,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _ProgressCircle extends StatelessWidget {
  const _ProgressCircle({required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: constraints.biggest,
          painter: _ProgressCirclePainter(percentage: percentage),
        );
      },
    );
  }
}

class _ProgressCirclePainter extends CustomPainter {
  _ProgressCirclePainter({required this.percentage});

  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      getRadiansByAngle(-90),
      getRadiansByAngle(360 * percentage),
      false,
      Paint()
        ..color = Colors.black.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_ProgressCirclePainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }

  double getRadiansByAngle(double angle) {
    return (angle * pi / 180);
  }
}

class _VoiceMessageController extends ChangeNotifier {
  _VoiceMessageController({required this.audioLink});

  final _subs = <StreamSubscription>[];

  final String audioLink;

  var loadingProgress = 0.0;

  final fakeWaveformsData =
      List.generate(200, (index) => Random().nextDouble());

  bool isLoading = true;
  bool showPercentages = false;
  var waveformsData = <double>[];

  final playerController = PlayerController();
  final audioPlayer = AudioPlayer();

  bool get isPlaying {
    return audioPlayer.playing;
  }

  double get playedPercentage {
    if (audioPlayer.duration == null) return 0;
    return audioPlayer.position.inMilliseconds /
        audioPlayer.duration!.inMilliseconds;
  }

  String get formattedDuration {
    final duration = audioPlayer.duration;
    if (duration == null) return '00:00';
    String minutes = duration.inMinutes.toString();
    String seconds = (duration.inSeconds % 60).toString();
    if (minutes.length < 2) {
      minutes = '0$minutes';
    }
    if (seconds.length < 2) {
      seconds = '0$seconds';
    }

    return '$minutes:$seconds';
  }

  void init() async {
    final path = await _downloadAudio();
    await audioPlayer.setFilePath(path);
    isLoading = false;
    if (Platform.isAndroid) {
      waveformsData = fakeWaveformsData;
    } else {
      waveformsData = await playerController.extractWaveformData(path: path);
    }

    _subs.add(audioPlayer.playingStream.listen((event) {
      notifyListeners();
    }));
    _subs.add(audioPlayer.positionStream.listen((event) {
      if (playedPercentage >= 1) {
        audioPlayer.pause();
        showPercentages = false;
        seekToPercent(0);
      }
      notifyListeners();
    }));
    notifyListeners();
  }

  void togglePlay() {
    showPercentages = true;
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  void seekToPercent(double percent) {
    final maxMilliseconds = audioPlayer.duration?.inMilliseconds;
    if (maxMilliseconds == null) return;
    final resultMilliseconds = (maxMilliseconds * percent).ceil();
    if (percent == 1) {
      showPercentages = false;
    }
    audioPlayer.seek(Duration(milliseconds: resultMilliseconds));
    notifyListeners();
  }

  Future<String> _downloadAudio() async {
    final resultPath = await _generateFilePath();
    await Dio().download(
      audioLink,
      resultPath,
      onReceiveProgress: (actualBytes, totalBytes) {
        loadingProgress = actualBytes.toDouble() / totalBytes.toDouble();
        notifyListeners();
      },
    );
    return resultPath;
  }

  Future<String> _generateFilePath() async {
    final temp = await getTemporaryDirectory();
    final time = DateTime.now().millisecondsSinceEpoch;
    return '${temp.path}/growUpVoiceMessage_$time.mp3';
  }

  @override
  void dispose() {
    for (var element in _subs) {
      element.cancel();
    }
    _subs.clear();
    playerController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}
