// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReusableVideoPlayer extends StatefulWidget {
  final VideoPlayerController? controller;
  final double? width;
  final double aspectRatio;
  final bool showControls;
  final bool enableTapToPlayPause;
  final bool enableVolumeControl;

  const ReusableVideoPlayer({
    super.key,
    this.controller,
    this.width,
    this.aspectRatio = 16 / 9,
    this.showControls = true,
    this.enableTapToPlayPause = true,
    this.enableVolumeControl = false,
  }) : assert(controller != null, 'Controller must be provided.');

  @override
  State<ReusableVideoPlayer> createState() => _ReusableVideoPlayerState();
}

class _ReusableVideoPlayerState extends State<ReusableVideoPlayer>
    with WidgetsBindingObserver {
  bool _isMuted = false;
  bool _showPlayPauseOverlay = true;
  bool _wasPlayingBeforeSeek = false;
  bool _wasPlayingBeforePauseDueToScroll = false;

  final GlobalKey _containerKey = GlobalKey();

  VideoPlayerController get _controller => widget.controller!;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _controller.addListener(_videoListener);
    _isMuted = _controller.value.volume == 0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_controller.value.isPlaying) {
        setState(() {
          _showPlayPauseOverlay = true;
        });
      }
      _checkIfWidgetIsVisible();
    });
  }

  void _videoListener() {
    if (!mounted) return;

    if (_controller.value.position >= _controller.value.duration &&
        _controller.value.duration > Duration.zero) {
      _controller.seekTo(Duration.zero);
      _controller.pause();
      setState(() {
        _showPlayPauseOverlay = true;
      });
    }

    if (_controller.value.isPlaying && _showPlayPauseOverlay) {
      // Optionally hide overlay after delay
    } else if (!_controller.value.isPlaying && !_showPlayPauseOverlay) {
      setState(() {
        _showPlayPauseOverlay = true;
      });
    }

    setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      if (_controller.value.isPlaying) {
        _controller.pause();
        setState(() {
          _showPlayPauseOverlay = true;
        });
      }
    }
  }

  void _checkIfWidgetIsVisible() {
    if (!mounted) return;

    final RenderObject? renderObject = _containerKey.currentContext
        ?.findRenderObject();
    if (renderObject is RenderBox && renderObject.hasSize) {
      final Offset offset = renderObject.localToGlobal(Offset.zero);
      final double screenHeight = MediaQuery.of(context).size.height;

      final double widgetTop = offset.dy;
      final double widgetBottom = offset.dy + renderObject.size.height;

      final bool isVisible = widgetBottom > 0 && widgetTop < screenHeight;

      if (!isVisible && _controller.value.isPlaying) {
        _wasPlayingBeforePauseDueToScroll = true;
        _controller.pause();
        setState(() {
          _showPlayPauseOverlay = true;
        });
      } else if (isVisible && _wasPlayingBeforePauseDueToScroll) {
        _controller.play();
        _wasPlayingBeforePauseDueToScroll = false;
        setState(() {
          _showPlayPauseOverlay = false;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant ReusableVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_videoListener);
      _controller.addListener(_videoListener);
      _isMuted = _controller.value.volume == 0;
      setState(() {
        _showPlayPauseOverlay = true;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkIfWidgetIsVisible();
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.removeListener(_videoListener);
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  void _togglePlayPause() {
    if (!_controller.value.isInitialized) return;

    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showPlayPauseOverlay = true;
      } else {
        _controller.play();
        _showPlayPauseOverlay = false;
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final maxDuration = _controller.value.duration.inMilliseconds.toDouble();
    final currentPosition = _controller.value.position.inMilliseconds
        .toDouble();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfWidgetIsVisible();
    });

    return Container(
      key: _containerKey,
      width: widget.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: _controller.value.isInitialized
              ? GestureDetector(
                  onTap: () {
                    if (widget.enableTapToPlayPause) {
                      _togglePlayPause();
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: _controller.value.size.width,
                            height: _controller.value.size.height,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity:
                            (_showPlayPauseOverlay ||
                                _controller.value.isBuffering)
                            ? 1.0
                            : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: IgnorePointer(
                          ignoring:
                              !(_showPlayPauseOverlay ||
                                  _controller.value.isBuffering),
                          child: Container(
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(
                                _controller.value.isPlaying &&
                                        !_controller.value.isBuffering
                                    ? Icons.pause_circle_outline
                                    : Icons.play_circle_outline,
                                color: Colors.white,
                                size: 60,
                              ),
                              onPressed: _togglePlayPause,
                            ),
                          ),
                        ),
                      ),
                      if (widget.showControls)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black54,
                                  Colors.black26,
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Row(
                              children: [
                                if (widget.enableVolumeControl)
                                  IconButton(
                                    icon: Icon(
                                      _isMuted
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      color: Colors.white,
                                    ),
                                    onPressed: _toggleMute,
                                  ),
                                Expanded(
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                      trackHeight: 3,
                                      thumbColor: Colors.blue,
                                      activeTrackColor: Colors.blue,
                                      inactiveTrackColor: Colors.white24,
                                      overlayColor: Colors.blue.withOpacity(
                                        0.2,
                                      ),
                                      thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 6.0,
                                      ),
                                      overlayShape:
                                          const RoundSliderOverlayShape(
                                            overlayRadius: 12.0,
                                          ),
                                    ),
                                    child: Slider(
                                      min: 0.0,
                                      max: maxDuration > 0 ? maxDuration : 1.0,
                                      value: currentPosition.clamp(
                                        0.0,
                                        maxDuration > 0 ? maxDuration : 1.0,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _controller.seekTo(
                                            Duration(
                                              milliseconds: value.toInt(),
                                            ),
                                          );
                                        });
                                      },
                                      onChangeStart: (value) {
                                        _wasPlayingBeforeSeek =
                                            _controller.value.isPlaying;
                                        _controller.pause();
                                        setState(() {
                                          _showPlayPauseOverlay = true;
                                        });
                                      },
                                      onChangeEnd: (value) {
                                        if (_wasPlayingBeforeSeek) {
                                          _controller.play();
                                          setState(() {
                                            _showPlayPauseOverlay = false;
                                          });
                                        } else {
                                          setState(() {
                                            _showPlayPauseOverlay = true;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  '${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                ),
        ),
      ),
    );
  }
}
