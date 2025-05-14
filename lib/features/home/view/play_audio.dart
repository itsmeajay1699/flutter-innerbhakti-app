import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:intl/intl.dart';

class AudioPlayerScreen extends StatefulWidget {
  final String audioUrl;
  final String title;
  final String description;
  final String imageUrl;

  const AudioPlayerScreen({
    super.key,
    this.audioUrl =
        "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-ce76a.appspot.com/o/14%20day%20shiv%20nidra%2FDAY%201%20MP3.mp3?alt=media&token=30747985-dada-4a5f-ab41-5257ee1c764f",
    this.title = "Lift Emotional Burden",
    this.description =
        "Chant Om Namo Bhagavate Vasudevaya to surrender to Bhagwan Krishna’s divine presence, cleansing emotional pain and confusion. This mantra awakens inner strength, truth, and peace, guiding you toward divine connection.",
    this.imageUrl = "assets/images/krishna.png",
  });

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _player;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isSeeking = false;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    _player = AudioPlayer();

    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());

    await session.setActive(true);

    try {
      await _player.setUrl(widget.audioUrl);
      _duration = _player.duration ?? Duration.zero;

      _player.positionStream.listen((pos) {
        if (!_isSeeking && mounted) {
          setState(() {
            _position = pos;
          });
        }
      });
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  String _formatDuration(Duration duration) {
    return DateFormat('mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(duration.inMilliseconds, isUtc: true),
    );
  }

  Future<void> _stopAndDisposePlayer() async {
    if (!_isDisposed) {
      await _player.stop();
      await _player.dispose();
      _isDisposed = true;
    }
  }

  @override
  void dispose() {
    _stopAndDisposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          await _stopAndDisposePlayer();
        }
      },

      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          title: Text(
            "Krishna Mantra",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF121212),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: HeroIcon(
              HeroIcons.chevronLeft,
              color: Color(0xFF121212),
              size: 24,
            ),
            onPressed: () async {
              await _stopAndDisposePlayer();
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF121212),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0xFF5D6879),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 8,
                          ),
                          trackShape: const _CustomTrackShape(),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 18,
                          ),
                        ),
                        child: Slider(
                          thumbColor: const Color(0xFFEF6820),
                          activeColor: const Color(0xFFEF6820),
                          min: 0,
                          max: _duration.inMilliseconds.toDouble(),
                          value:
                              _position.inMilliseconds
                                  .clamp(0, _duration.inMilliseconds)
                                  .toDouble(),
                          onChanged: (value) {
                            setState(() {
                              _isSeeking = true;
                              _position = Duration(milliseconds: value.toInt());
                            });
                          },
                          onChangeEnd: (value) {
                            _player.seek(Duration(milliseconds: value.toInt()));
                            setState(() => _isSeeking = false);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_position),
                            style: const TextStyle(color: Colors.black54),
                          ),
                          Text(
                            _formatDuration(_duration),
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: IconButton(
                          iconSize: 68,
                          icon: Icon(
                            _player.playing
                                ? Icons.pause_circle
                                : Icons.play_circle,
                            color: const Color(0xFFEF6820),
                          ),
                          onPressed:
                              () =>
                                  _player.playing
                                      ? _player.pause()
                                      : _player.play(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTrackShape extends RoundedRectSliderTrackShape {
  const _CustomTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
