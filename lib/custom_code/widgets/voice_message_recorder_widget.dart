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

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart' as rec;
import 'package:uuid/uuid.dart';

final _noiseStream = NoiseMeter().noise;

class VoiceMessageRecorderWidget extends StatefulWidget {
  const VoiceMessageRecorderWidget({
    required this.setTextField,
    required this.recordingIcon,
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  final Widget recordingIcon;
  final Future Function() setTextField;

  @override
  State<VoiceMessageRecorderWidget> createState() => _SpeechToTextBoxState();
}

class _SpeechToTextBoxState extends State<VoiceMessageRecorderWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ViewModel(
        remoteApi: _RemoteStorageApi(),
        successAction: widget.setTextField,
      ),
      child: Builder(builder: (context) {
        final viewModel = context.watch<_ViewModel>();
        return SizedBox(
          height: widget.height,
          width: double.infinity,
          child: Center(
            child: switch (viewModel.currentState) {
              _State.recording => _RecordingWidget(icon: widget.recordingIcon),
              _State.converting => const _LoadingWidget(),
            },
          ),
        );
      }),
    );
  }
}

class _RecordingWidget extends StatefulWidget {
  const _RecordingWidget({required this.icon});

  final Widget icon;

  @override
  State<_RecordingWidget> createState() => _RecordingWidgetState();
}

class _RecordingWidgetState extends State<_RecordingWidget>
    with SingleTickerProviderStateMixin {
  StreamSubscription? _noiseSub;

  final _Debouncer debouncer = _Debouncer(
    debounceDuration: const Duration(milliseconds: 235),
  );

  late final AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    scaleAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.value = 0.5;

    context.read<_ViewModel>().startRecord();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _noiseSub = _noiseStream.listen((event) {
        final value = convertToZeroOne(event.meanDecibel);

        pulse(value);
      });
    });

    super.initState();
  }

  void pulse(double value) {
    animationController.stop();
    setState(() {
      scaleAnimation = Tween(begin: scaleAnimation.value, end: value)
          .animate(animationController);
      animationController.value = 0;
    });
    debouncer.debounce(() {
      animationController.stop();
      setState(() {
        scaleAnimation = Tween(begin: scaleAnimation.value, end: 0.1)
            .animate(animationController);
        animationController.value = 0;
      });
      animationController.animateTo(
        1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInCubic,
      );
    });
    animationController.animateTo(
      1,
      duration: const Duration(milliseconds: 230),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _noiseSub?.cancel();
    debouncer.dispose();
    animationController.dispose();
    super.dispose();
  }

  double convertToZeroOne(double value) {
    return ((value - 10) / (90 - 10)).clamp(0.7, 1);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          context.read<_ViewModel>().stopRecord();
        },
        child: AbsorbPointer(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0062FF).withOpacity(0.22),
                      borderRadius: BorderRadius.circular(300),
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 59,
                  width: 59,
                  child: widget.icon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Lottie.network(
              'https://lottie.host/814b50e9-5a96-4b8e-a522-eec43608640b/CFvxYYaokN.json',
              width: 56 * 250 / 130,
              // 56
              height: (56 * 250 / 130) * 130 / 250,
              // 56
              alignment: Alignment.center,
              frameRate: FrameRate(60),
              animate: true,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Uploading...',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFFD2D5DA),
            ),
          )
        ],
      ),
    );
  }
}

class _ViewModel extends ChangeNotifier {
  _ViewModel({
    required this.remoteApi,
    required this.successAction,
  });

  final _RemoteStorageApi remoteApi;
  final Future Function() successAction;

  _State currentState = _State.recording;

  rec.AudioRecorder? _audioRecorder;
  StreamSubscription? _recorderSub;
  String? _fileDir;

  void startRecord() async {
    _audioRecorder = rec.AudioRecorder();

    _recorderSub = _audioRecorder?.onStateChanged().listen((event) {
      if (event == rec.RecordState.stop) {
        _whenRecordStopped();
      }
    });

    _fileDir = await _FileManager().createTempFile();
    await _audioRecorder!.start(
      const rec.RecordConfig(),
      path: _fileDir!,
    );
  }

  void _whenRecordStopped() async {
    currentState = _State.converting;
    notifyListeners();
    try {
      final url = await remoteApi.uploadFile(_fileDir!);
      await File(_fileDir!).delete();

      FFAppState().update(() {
        FFAppState().voiceMessageUrl = url;
      });

      successAction();
    } catch (_) {
      successAction();
      notifyListeners();
    }
  }

  void stopRecord() async {
    if (_audioRecorder == null) return;
    if (!(await _audioRecorder!.isRecording())) return;
    _audioRecorder?.stop();
  }

  @override
  void dispose() {
    _recorderSub?.cancel();
    _audioRecorder?.dispose();
    super.dispose();
  }
}

enum _State { recording, converting }

class _Debouncer {
  _Debouncer({required this.debounceDuration});

  final Duration debounceDuration;
  Timer? _timer;

  void debounce(VoidCallback onSuccess) {
    _timer?.cancel();
    _timer = Timer(debounceDuration, () {
      onSuccess();
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}

class _RemoteStorageApi {
  _RemoteStorageApi();

  Future<String> uploadFile(String filePath) async {
    final id = const Uuid().v4();
    final res = await FirebaseStorage.instance
        .ref('voice_messages/$id')
        .putFile(File(filePath));
    final url = await res.ref.getDownloadURL();

    return url;
  }
}

class _FileManager {
  Future<String> createTempFile() async {
    final tempDir = await getTemporaryDirectory();
    final result = p.join(
      tempDir.path,
      'grow_up_voice_message_${DateTime.now().millisecondsSinceEpoch}.m4a',
    );
    return result;
  }
}
