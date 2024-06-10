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

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart' as mat show TextDirection;
import 'package:just_audio/just_audio.dart';

class CustomAudioPlayer extends StatefulWidget {
  const CustomAudioPlayer({
    super.key,
    this.height,
    this.width,
    required this.fontFamily,
    required this.backIcon,
    required this.playButton,
    required this.nextIcon,
    required this.audioFilePath,
  });

  final double? height;
  final double? width;
  final String fontFamily;
  final Widget backIcon;
  final Widget playButton;
  final Widget nextIcon;
  final String audioFilePath;

  @override
  State<CustomAudioPlayer> createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  final controller = _AudioController();

  @override
  void initState() {
    controller.init(widget.audioFilePath);
    controller.addListener(updateListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateListener() {
    setState(() {});
  }

  double? _currentSliderValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              sliderTheme: SliderThemeData(
                trackHeight: 2,
                activeTrackColor: Colors.white,
                inactiveTrackColor: const Color(0xFFD2D5DA),
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 4.5,
                  elevation: 0,
                  pressedElevation: 0,
                ),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 15),
                overlayColor: Colors.transparent,
                trackShape: CustomTrackShape(),
              ),
            ),
            child: Slider(
              value: _currentSliderValue != null
                  ? _currentSliderValue!
                  : controller.elapsedSeconds.toDouble(),
              max: controller.totalSeconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              onChangeStart: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              onChangeEnd: (newValue) {
                _currentSliderValue = null;
                controller.seekToSeconds(newValue.round());
              },
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  controller.elapsed,
                  style: TextStyle(
                    fontFamily: widget.fontFamily,
                    color: const Color(0xFFD2D5DA),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Text(
                  controller.total,
                  style: TextStyle(
                    fontFamily: widget.fontFamily,
                    color: const Color(0xFFD2D5DA),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, -5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: controller.onBackPressed,
                  child: widget.backIcon,
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: controller.onPausePlayPressed,
                  child: widget.playButton,
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: controller.onNextPressed,
                  child: widget.nextIcon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AudioController extends ChangeNotifier {
  final audioPlayer = AudioPlayer();
  final disposeBag = DisposeBag();

  String get elapsed {
    String minutes = '';
    String seconds = '';
    final position = audioPlayer.position;
    minutes = max(position.inMinutes, 0).toString();
    seconds = max((position.inSeconds % 60), 0).toString();

    if (minutes.length < 2) {
      minutes = '0$minutes';
    }
    if (seconds.length < 2) {
      seconds = '0$seconds';
    }

    return '$minutes:$seconds';
  }

  String get total {
    String minutes = '';
    String seconds = '';
    final duration = audioPlayer.duration;
    if (duration != null) {
      minutes = duration.inMinutes.toString();
      seconds = (duration.inSeconds % 60).toString();
    }

    if (minutes.length < 2) {
      minutes = '0$minutes';
    }
    if (seconds.length < 2) {
      seconds = '0$seconds';
    }

    return '$minutes:$seconds';
  }

  int get totalSeconds => audioPlayer.duration?.inSeconds ?? 0;

  int get elapsedSeconds => audioPlayer.position.inSeconds;

  void init(String filePath) {
    // audioPlayer
    //     .setAudioSource(AudioSource.uri(Uri.parse(filePath)))
    //     .then((value) {
    //   audioPlayer.play();
    // });
    audioPlayer.setAudioSource(AudioSource.file(filePath)).then((value) {
      audioPlayer.play();
    });
    audioPlayer.positionStream.listen((event) {
      notifyListeners();
    }).disposedBy(disposeBag);
  }

  void onBackPressed() {
    final currentPosition = audioPlayer.position;
    final currentSeconds = currentPosition.inSeconds;
    final newSeconds = max(currentSeconds - 10, 0);
    final newDuration = Duration(seconds: newSeconds);
    audioPlayer.seek(newDuration);
  }

  void onNextPressed() {
    final maxSeconds = audioPlayer.duration?.inSeconds ?? 0;
    final currentPosition = audioPlayer.position;
    final currentSeconds = currentPosition.inSeconds;
    final newSeconds = min(currentSeconds + 10, maxSeconds);
    if (newSeconds == maxSeconds) {
      audioPlayer.pause();
    }
    final newDuration = Duration(seconds: newSeconds);
    audioPlayer.seek(newDuration);
  }

  void onPausePlayPressed() {
    if (audioPlayer.playerState.playing) {
      audioPlayer.pause();
      return;
    }
    audioPlayer.play();
  }

  void seekToSeconds(int seconds) {
    if (seconds == audioPlayer.duration?.inSeconds) {
      audioPlayer.seek(Duration(seconds: seconds));
      audioPlayer.pause();
      return;
    }
    audioPlayer.seek(Duration(seconds: seconds));
  }

  @override
  void dispose() {
    disposeBag.dispose();
    super.dispose();
  }
}

class DisposeBag {
  final _subs = <StreamSubscription>[];

  void append(StreamSubscription sub) {
    _subs.add(sub);
  }

  void dispose() {
    for (final element in _subs) {
      element.cancel();
    }
  }
}

extension on StreamSubscription {
  void disposedBy(DisposeBag bag) {
    bag.append(this);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required mat.TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    super.paint(
      context,
      offset,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      enableAnimation: enableAnimation,
      textDirection: textDirection,
      thumbCenter: thumbCenter,
      isDiscrete: isDiscrete,
      isEnabled: isEnabled,
      additionalActiveTrackHeight: 0,
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
