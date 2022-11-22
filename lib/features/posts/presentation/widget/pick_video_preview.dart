import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/enums.dart';
import '../extension/post_extensions.dart';
import '../provider/notifier/post_info_notifier.dart';
import '../provider/notifier/post_notifier.dart';
import 'preview_video.dart';

class PickVideoPreview extends HookConsumerWidget {
  const PickVideoPreview({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final postNotifier = ref.read(postNotifierProvider.notifier);
    final postInfoNotifier = ref.watch(postInfoNotifierProvider(FileType.video).notifier);

    final videoNotifier = useState<File?>(null);
    final aspectRatioNotifier = useState<double>(1.5);
    final isLoading = useState<bool>(false);
    final isVideoPicked = useState<bool>(false);

    Future<void> pickVideo() async {
      isLoading.value = true;

      final video = await postNotifier.pickVideo();
      if (video == null) {
        aspectRatioNotifier.value = 1.5;
        videoNotifier.value = null;
        isVideoPicked.value = false;
        isLoading.value = false;
        ref.invalidate(postInfoNotifierProvider);
        return;
      }

      videoNotifier.value = video;
      aspectRatioNotifier.value = await video.videoAspectRatio;
      postInfoNotifier.setFile(video);
      postInfoNotifier.setAspectRatio(aspectRatioNotifier.value);

      isVideoPicked.value = true;
      isLoading.value = false;
    }

    return GestureDetector(
      onTap: isVideoPicked.value ? null : pickVideo,
      child: Container(
        width: size.width * .9,
        height: size.width * .9 / aspectRatioNotifier.value,
        decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: isLoading.value
            ? const CircularProgressIndicator.adaptive()
            : videoNotifier.value == null
                ? Icon(FontAwesomeIcons.video, size: size.width * .15)
                : VideoPreview(video: videoNotifier.value!, pickVideo: pickVideo),
      ),
    );
  }
}
