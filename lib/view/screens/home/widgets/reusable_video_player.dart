// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReusableVideoPlayer extends StatefulWidget {
  final String? videoUrl; // Now optional
  final VideoPlayerController? controller; // New: Optional external controller
  final double? width;
  final double aspectRatio;
  final bool showControls;
  final bool enableTapToPlayPause;
  final bool enableVolumeControl;
  final bool autoPlay; // New: Added autoplay option

  const ReusableVideoPlayer({
    super.key,
    this.videoUrl,
    this.controller,
    this.width,
    this.aspectRatio = 16 / 9,
    this.showControls = true,
    this.enableTapToPlayPause = true,
    this.enableVolumeControl = false,
    this.autoPlay = false, // Default to false
  }) : assert(
         videoUrl != null || controller != null,
         'Either videoUrl or controller must be provided.',
       );

  @override
  State<ReusableVideoPlayer> createState() => ReusableVideoPlayerState();
}

class ReusableVideoPlayerState extends State<ReusableVideoPlayer> {
  late VideoPlayerController _internalController;
  // This flag indicates if the controller used is internal (managed by this widget)
  // or external (passed via widget.controller).
  bool _isInternalController = false;

  bool _isMuted = false;
  bool _showPlayPauseOverlay = true;
  // Track current overlay hide duration
  Future<void>?
  _initializeVideoPlayerFuture; // To hold the initialization future

  VideoPlayerController get _effectiveController {
    // If an external controller is provided, use it. Otherwise, use the internal one.
    return widget.controller ?? _internalController;
  }

  @override
  void initState() {
    super.initState();
    _initializeController();
    _isMuted = _effectiveController.value.volume == 0;

    // Show overlay initially if not playing or if autoplay is off
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !widget.autoPlay) {
        setState(() {
          _showPlayPauseOverlay = true;
        });
      }
    });
  }

  void _initializeController() {
    if (widget.controller == null) {
      // Create and manage an internal controller
      _isInternalController = true;
      _internalController = VideoPlayerController.network(widget.videoUrl!);
    } else {
      // Use the provided external controller
      _isInternalController = false;
    }

    _effectiveController.removeListener(
      _videoListener,
    ); // Remove any old listener
    _effectiveController.addListener(_videoListener);

    // Initialize the controller
    _initializeVideoPlayerFuture = _effectiveController
        .initialize()
        .then((_) {
          if (mounted) {
            // If autoplay is true, start playing once initialized
            if (widget.autoPlay && !_effectiveController.value.isPlaying) {
              _effectiveController.play();
              // _hidePlayPauseOverlayAfterDelay();
            } else {
              setState(() {
                _showPlayPauseOverlay = !_effectiveController.value.isPlaying;
              });
            }
          }
        })
        .catchError((error) {
          if (mounted) {
            // Update UI to reflect error, e.g., show a broken icon or message
            setState(() {
              // You might want a specific error state or message here
              _showPlayPauseOverlay = true; // Keep controls visible on error
            });
            debugPrint('Video player initialization error: $error');
          }
        });
  }

  void _videoListener() {
    if (!mounted) return;

    // If video ends, loop it or reset and show play button
    if (_effectiveController.value.position >=
            _effectiveController.value.duration &&
        _effectiveController.value.duration > Duration.zero) {
      _effectiveController.seekTo(Duration.zero);
      _effectiveController.pause();
      setState(() {
        _showPlayPauseOverlay = true;
      });
    }

    // Logic to show/hide overlay based on playing state
    if (_effectiveController.value.isPlaying) {
      // If playing, hide overlay unless it's explicitly shown by user interaction
      if (_showPlayPauseOverlay) {
        // _hidePlayPauseOverlayAfterDelay();
      }
    } else {
      // If paused or ended, always show overlay
      if (!_showPlayPauseOverlay) {
        setState(() {
          _showPlayPauseOverlay = true;
        });
      }
    }
    setState(() {}); // Trigger rebuild for progress updates
  }

  @override
  void didUpdateWidget(covariant ReusableVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the controller instance itself has changed
    if (widget.controller != oldWidget.controller) {
      // Dispose old internal controller if it was managed by us
      if (_isInternalController) {
        _internalController.removeListener(_videoListener);
        _internalController.dispose();
      }
      // Re-initialize the controller based on the new widget's properties
      _initializeController();
      _isMuted = _effectiveController.value.volume == 0; // Update mute state
      setState(() {
        _showPlayPauseOverlay = true; // Always show overlay on source change
      });
    } else if (widget.controller == null &&
        widget.videoUrl != oldWidget.videoUrl) {
      // If using internal controller and videoUrl changed
      _internalController.removeListener(_videoListener);
      _internalController.dispose();
      _initializeController(); // Re-initialize with new URL
      _isMuted = _internalController.value.volume == 0;
      setState(() {
        _showPlayPauseOverlay = true;
      });
    }
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_videoListener);
    // Only dispose internal controller if it was created and managed by this widget
    if (_isInternalController) {
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
        _showPlayPauseOverlay = true; // Keep overlay visible when paused
      } else {
        _effectiveController.play();
        // _hidePlayPauseOverlayAfterDelay();
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _effectiveController.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  // void _hidePlayPauseOverlayAfterDelay() {
  //   // Cancel any previous hide timer
  //   _overlayHideTimerDuration = null;

  //   // Set a new timer to hide the overlay after 3 seconds
  //   Future.delayed(const Duration(seconds: 3), () {
  //     if (mounted && _effectiveController.value.isPlaying) {
  //       setState(() {
  //         _showPlayPauseOverlay = false;
  //       });
  //     }
  //   });
  // }

  /// Public method to programmatically play the video.
  void playVideo() {
    if (_effectiveController.value.isInitialized &&
        !_effectiveController.value.isPlaying) {
      _effectiveController.play();
      // _hidePlayPauseOverlayAfterDelay();
    }
  }

  /// Public method to programmatically pause the video.
  void pauseVideo() {
    if (_effectiveController.value.isPlaying) {
      _effectiveController.pause();
      setState(() {
        _showPlayPauseOverlay = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double maxDuration =
        _effectiveController.value.isInitialized &&
            _effectiveController.value.duration.inMilliseconds > 0
        ? _effectiveController.value.duration.inMilliseconds.toDouble()
        : 1.0;

    final double currentPosition = _effectiveController.value.isInitialized
        ? _effectiveController.value.position.inMilliseconds.toDouble()
        : 0.0;

    return Container(
      width: widget.width,
      constraints: const BoxConstraints(
        minHeight:
            200, // 👈 Minimum height for video container (adjust as needed)
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Error loading video: ${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }
                return GestureDetector(
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

                      // Central Play/Pause Icon and Buffering Indicator
                      if (_showPlayPauseOverlay ||
                          _effectiveController.value.isBuffering)
                        Center(
                          child: _effectiveController.value.isBuffering
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : IconButton(
                                  icon: Icon(
                                    _effectiveController.value.isPlaying &&
                                            !_effectiveController
                                                .value
                                                .isBuffering
                                        ? Icons.pause_circle_outline
                                        : Icons.play_circle_outline,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  onPressed: _togglePlayPause,
                                ),
                        ),

                      // Controls Bar (Volume, Progress, Duration)
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
                                      max: maxDuration,
                                      value: currentPosition.clamp(
                                        0.0,
                                        maxDuration,
                                      ),
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
                                        // Pause on scrubbing start
                                        pauseVideo();
                                      },
                                      onChangeEnd: (double value) {
                                        // No specific action needed here as _togglePlayPause handles play/pause.
                                        // If you want to resume playing after scrubbing, you might add:
                                        // if (_wasPlayingBeforeScrubbing) _effectiveController.play();
                                        // But this might conflict with tap-to-play-pause, so keeping it simple.
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  '${_formatDuration(_effectiveController.value.position)} / ${_formatDuration(_effectiveController.value.duration)}',
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
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
