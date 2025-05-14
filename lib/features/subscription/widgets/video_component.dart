import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_session/audio_session.dart';

class LoopingVideoPlayer extends StatefulWidget {
  const LoopingVideoPlayer({super.key});

  @override
  State<LoopingVideoPlayer> createState() => _LoopingVideoPlayerState();
}

class _LoopingVideoPlayerState extends State<LoopingVideoPlayer>
    with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());

    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://dgaqwe1r16p4i.cloudfront.net/presale/sub.mp4'),
    );

    await _controller.initialize();
    _controller.setLooping(true);
    _controller.play();

    setState(() {
      _isInitialized = true;
      _isPlaying = true;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_isInitialized) return;
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _controller.pause();
      setState(() {
        _isPlaying = false;
      });
    } else if (state == AppLifecycleState.resumed) {
      _controller.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _onTapVideo() {
    if (!_isInitialized) return;
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.black,
      ),
      child:
          _isInitialized
              ? GestureDetector(
                onTap: _onTapVideo,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Stack(
                    children: [
                      VideoPlayer(_controller),
                      Positioned(
                        bottom: 8.h,
                        left: 8.w,
                        child: Icon(
                          _isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                          size: 30.r,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
    );
  }
}
