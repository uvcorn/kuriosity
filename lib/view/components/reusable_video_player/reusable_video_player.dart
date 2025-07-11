// lib/widgets/reusable_video_player.dart (Updated and Fixed - Using Slider for scrubbing)
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/app_colors/app_colors.dart';

class ReusableVideoPlayer extends StatefulWidget {
  final String? videoUrl; // Now optional
  final VideoPlayerController? controller; // New: Optional external controller
  final double? width;
  final double aspectRatio;
  final bool showControls;
  final bool enableTapToPlayPause;
  final bool enableVolumeControl;

  const ReusableVideoPlayer({
    super.key,
    this.videoUrl,
    this.controller,
    this.width,
    this.aspectRatio = 16 / 9,
    this.showControls = true,
    this.enableTapToPlayPause = true,
    this.enableVolumeControl = false,
  }) : assert(
         videoUrl != null || controller != null,
         'Either videoUrl or controller must be provided.',
       ); // Assert for safety

  @override
  State<ReusableVideoPlayer> createState() => _ReusableVideoPlayerState();
}

class _ReusableVideoPlayerState extends State<ReusableVideoPlayer> {
  late VideoPlayerController _internalController;
  bool _isMuted = false;
  bool _isDisposingInternalController = false;

  bool _showPlayPauseOverlay = true;

  bool _wasPlayingBeforeSeek = false;

  VideoPlayerController get _effectiveController =>
      widget.controller ?? _internalController;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = VideoPlayerController.network(widget.videoUrl!)
        ..initialize()
            .then((_) {
              if (mounted) setState(() {});
            })
            .catchError((error) {
              if (mounted) setState(() {});
            });
    }

    _effectiveController.addListener(_videoListener);

    _isMuted = _effectiveController.value.volume == 0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_effectiveController.value.isPlaying) {
        setState(() {
          _showPlayPauseOverlay = true;
        });
      }
    });
  }

  void _videoListener() {
    if (mounted) {
      if (!_isDisposingInternalController) {
        if (_effectiveController.value.position >=
                _effectiveController.value.duration &&
            _effectiveController.value.duration > Duration.zero) {
          _effectiveController.seekTo(Duration.zero);
          _effectiveController.pause();
          setState(() {
            _showPlayPauseOverlay = true;
          });
        }

        if (_effectiveController.value.isPlaying && _showPlayPauseOverlay) {
          _hidePlayPauseOverlayAfterDelay();
        } else if (!_effectiveController.value.isPlaying &&
            !_showPlayPauseOverlay) {
          setState(() {
            _showPlayPauseOverlay = true;
          });
        }
        setState(() {});
      }
    }
  }

  @override
  void didUpdateWidget(covariant ReusableVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller ||
        widget.videoUrl != oldWidget.videoUrl) {
      oldWidget.controller?.removeListener(_videoListener);
      if (oldWidget.controller == null && !_isDisposingInternalController) {
        _internalController.removeListener(_videoListener);
      }

      if (widget.controller == null) {
        if (oldWidget.controller != null ||
            widget.videoUrl != oldWidget.videoUrl) {
          _internalController.dispose();
          _isDisposingInternalController = true;
          _internalController = VideoPlayerController.network(widget.videoUrl!)
            ..initialize()
                .then((_) {
                  if (mounted) {
                    _isDisposingInternalController = false;
                    setState(() {});
                  }
                })
                .catchError((error) {
                  if (mounted) {
                    _isDisposingInternalController = false;
                    setState(() {});
                  }
                });
        }
      } else {
        if (oldWidget.controller == null) {
          _internalController.dispose();
          _isDisposingInternalController = true;
        }
      }
      _effectiveController.addListener(_videoListener);
      _isMuted = _effectiveController.value.volume == 0;
      setState(() {
        _showPlayPauseOverlay = true;
      });
      _hidePlayPauseOverlayAfterDelay();
    }
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_videoListener);
    if (widget.controller == null && !_isDisposingInternalController) {
      _isDisposingInternalController = true;
      _internalController.dispose();
    }
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  void _togglePlayPause() {
    if (!_effectiveController.value.isInitialized) {
      return;
    }

    setState(() {
      if (_effectiveController.value.isPlaying) {
        _effectiveController.pause();
        _showPlayPauseOverlay = true;
      } else {
        _effectiveController.play();
        _hidePlayPauseOverlayAfterDelay();
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _effectiveController.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  void _hidePlayPauseOverlayAfterDelay() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted && _effectiveController.value.isPlaying) {
        setState(() {
          _showPlayPauseOverlay = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final double maxDuration = _effectiveController
        .value
        .duration
        .inMilliseconds
        .toDouble();

    final double currentPosition = _effectiveController
        .value
        .position
        .inMilliseconds
        .toDouble();

    return Container(
      width: widget.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: ClipRRect(
          child: _effectiveController.value.isInitialized
              ? GestureDetector(
                  onTap: () {
                    if (widget.enableTapToPlayPause) {
                      _togglePlayPause();
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Video Player
                      SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: _effectiveController.value.size.width,
                            height: _effectiveController.value.size.height,
                            child: VideoPlayer(_effectiveController),
                          ),
                        ),
                      ),

                      // Central Play/Pause  Icon
                      AnimatedOpacity(
                        opacity:
                            (_showPlayPauseOverlay ||
                                _effectiveController.value.isBuffering)
                            ? 1.0
                            : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: IgnorePointer(
                          ignoring:
                              !(_showPlayPauseOverlay ||
                                  _effectiveController.value.isBuffering),
                          child: Container(
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(
                                _effectiveController.value.isPlaying &&
                                        !_effectiveController.value.isBuffering
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

                      // Controls Bar (Volume, Progress, Duration) -
                      if (widget.showControls &&
                          _effectiveController.value.isInitialized)
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
                                      color: AppColors.white,
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
                                      ), // Clamp value
                                      onChanged: (double value) {
                                        setState(() {
                                          _effectiveController.seekTo(
                                            Duration(
                                              milliseconds: value.toInt(),
                                            ),
                                          );
                                        });
                                      },
                                      onChangeStart: (double value) {
                                        _wasPlayingBeforeSeek =
                                            _effectiveController
                                                .value
                                                .isPlaying;
                                        _effectiveController.pause();
                                        setState(() {
                                          _showPlayPauseOverlay = true;
                                        });
                                      },
                                      onChangeEnd: (double value) {
                                        if (_wasPlayingBeforeSeek) {
                                          _effectiveController.play();
                                          _hidePlayPauseOverlayAfterDelay();
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
                                  '${_formatDuration(_effectiveController.value.position)} / ${_formatDuration(_effectiveController.value.duration)}',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: AppColors.white,
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
