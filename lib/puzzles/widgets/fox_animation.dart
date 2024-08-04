import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:rive/rive.dart';

class FoxAnimation extends StatefulWidget {
  const FoxAnimation({
    required this.rivePath,
    required this.controller,
    this.startInitial = false,
    this.audioPath,
    this.startDelayed = true,
    super.key,
  });

  final FoxController controller;
  final String rivePath;
  final String? audioPath;
  final bool startInitial;
  final bool startDelayed;

  @override
  State<FoxAnimation> createState() => _FoxAnimationState();
}

class _FoxAnimationState extends State<FoxAnimation> {
  late FoxController controller;
  bool initialised = false;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.initialize(widget.rivePath, widget.audioPath);
      setState(() => initialised = true);
      if (widget.startInitial) {
        if (widget.startDelayed) {
          await Future<void>.delayed(const Duration(seconds: 1));
        }
        await controller.play();
      }
    });
  }

  @override
  void didUpdateWidget(covariant FoxAnimation oldWidget) {
    oldWidget.controller.playerStream?.cancel();
    oldWidget.controller.player.stop();
    oldWidget.controller.triggerStopTalk();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialised) return Rive(artboard: controller.artboard!);
    return const SizedBox(height: 160);
  }
}

class FoxController {
  FoxController({required this.audioType});

  final AudioType audioType;
  StateMachineController? _controller;
  SMITrigger? _talkTrigger;
  SMITrigger? _stopTalkTrigger;
  final AudioPlayer player = AudioPlayer();
  StreamSubscription<PlayerState>? playerStream;

  Future<void> initialize(String rivePath, String? audioPath) async {
    await _loadRiveFile(
      rivePath: rivePath,
    );
    if (audioPath != null) {
      await _loadAudio(audioPath);
    }
  }

  Future<void> _loadAudio(String audioPath, {bool startInitial = false}) async {
    await player.setSource(AssetSource(audioPath));
    playerStream = player.onPlayerStateChanged.listen((state) async {
      if ([
        PlayerState.completed,
        PlayerState.stopped,
        PlayerState.disposed,
      ].contains(state)) {
        await playerStream?.cancel();
        triggerStopTalk();
      }
    });
  }

  Future<void> _loadRiveFile({required String rivePath}) async {
    await RiveFile.initialize();
    final data = await rootBundle.load(rivePath);
    final file = RiveFile.import(data);
    final artBoard = file.mainArtboard;
    final controller =
        StateMachineController.fromArtboard(artBoard, 'State Machine 1');
    if (controller != null) {
      artBoard.addController(controller);
      _talkTrigger = controller.findInput<bool>('talk') as SMITrigger?;
      _stopTalkTrigger = controller.findInput<bool>('stop_talk') as SMITrigger?;
      _controller = controller;
    }
  }

  void _triggerTalk() {
    _talkTrigger?.fire();
  }

  void triggerStopTalk() {
    _stopTalkTrigger?.fire();
  }

  Future<void> play() async {
    if (player.state == PlayerState.playing) {
      await player.stop();
    }
    await _loadAudio(
      PuzzleHelper.getRandomAudio(audioType),
      startInitial: true,
    );
    await player.resume();
    _triggerTalk();
  }

  void stop() {
    player.stop();
  }

  Artboard? get artboard => _controller?.artboard;

  void dispose() {
    playerStream?.cancel();
    player
      ..stop()
      ..dispose();
    _controller?.dispose();
  }
}
