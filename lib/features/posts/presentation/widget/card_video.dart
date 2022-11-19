import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCard extends HookConsumerWidget {
  const VideoPlayerCard({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoPlayerController = useMemoized(
      () => VideoPlayerController.network(videoUrl),
      [videoUrl],
    );

    final videoInitialized = useState(false);
    final isPlaying = useState(true);

    useEffect(() {
      videoPlayerController.initialize().then((_) {
        videoPlayerController.play();
        videoPlayerController.setLooping(true);
        videoInitialized.value = true;
      });
      return videoPlayerController.dispose;
    }, [videoPlayerController]);

    return GestureDetector(
      onTap: () {
        if (isPlaying.value) {
          videoPlayerController.pause();
        } else {
          videoPlayerController.play();
        }
        isPlaying.value = !isPlaying.value;
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          videoInitialized.value ? VideoPlayer(videoPlayerController) : const CircularProgressIndicator.adaptive(),
          Icon(isPlaying.value ? null : Icons.play_arrow, size: 50),
        ],
      ),
    );
  }
}
