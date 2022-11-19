import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../button/pick_video_again_button.dart';

class VideoPreview extends HookConsumerWidget {
  const VideoPreview({super.key, required this.video, this.pickVideo});

  final File video;
  final Future<void> Function()? pickVideo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoController = useMemoized(
      () => VideoPlayerController.file(video),
      [video],
    );

    final videoInitialized = useState(false);
    final isPlaying = useState(false);

    useEffect(() {
      videoController.initialize().then((_) {
        videoController.setLooping(true);
        videoController.play();
        videoInitialized.value = true;
        isPlaying.value = true;
      });
      return videoController.dispose;
    }, [videoController]);

    return GestureDetector(
      onTap: () {
        if (isPlaying.value) {
          videoController.pause();
          isPlaying.value = false;
        } else {
          videoController.play();
          isPlaying.value = true;
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          alignment: Alignment.center,
          children: [
            videoInitialized.value ? VideoPlayer(videoController) : const CircularProgressIndicator.adaptive(),
            PickVideoAgainButton(onTap: pickVideo ?? () async {}),
            if (!isPlaying.value) const Positioned(child: FaIcon(FontAwesomeIcons.play, color: Colors.white, size: 40)),
          ],
        ),
      ),
    );
  }
}
